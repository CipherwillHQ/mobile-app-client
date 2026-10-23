# Exercises NDK installation recovery with a controlled SDK manager.
# Owns cache reuse, partial-download cleanup and retry exhaustion checks.
# Does not download SDK packages or touch the machine's Android installation.
set -euo pipefail

tool_directory="$(cd "$(dirname "$0")" && pwd)"
test_directory="$(mktemp -d /tmp/cipherwill-ndk-test.XXXXXX)"
[[ "$test_directory" == /tmp/cipherwill-ndk-test.* ]] || exit 2
trap 'rm -rf -- "$test_directory"' EXIT
mkdir -p "$test_directory/bin" "$test_directory/sdk"
export PATH="$test_directory/bin:$PATH"
export NDK_TEST_DIRECTORY="$test_directory"
export NDK_TEST_CASE=transient

cat > "$test_directory/bin/sdkmanager" <<'MOCK'
#!/usr/bin/env bash
set -euo pipefail
echo called >> "$NDK_TEST_DIRECTORY/calls"
attempt="$(wc -l < "$NDK_TEST_DIRECTORY/calls")"
sdk_root="${1#--sdk_root=}"
ndk_version="${3#ndk;}"
ndk_directory="$sdk_root/ndk/$ndk_version"
if [[ "$NDK_TEST_CASE" == permanent ]]; then exit 1; fi
if [[ "$NDK_TEST_CASE" != success && "$attempt" -eq 1 ]]; then
  mkdir -p "$sdk_root/.temp" "$ndk_directory"
  echo 'not a zip archive' > "$sdk_root/.temp/partial.zip"
  echo partial > "$ndk_directory/source.properties"
  if [[ "$NDK_TEST_CASE" == incomplete ]]; then exit 0; fi
  exit 1
fi
[[ ! -e "$sdk_root/.temp/partial.zip" ]]
mkdir -p "$ndk_directory"
echo "Pkg.Revision = $ndk_version" > "$ndk_directory/source.properties"
printf '#!/usr/bin/env bash\nexit 0\n' > "$ndk_directory/ndk-build"
chmod +x "$ndk_directory/ndk-build"
MOCK
printf '#!/usr/bin/env bash\nexit 0\n' > "$test_directory/bin/sleep"
chmod +x "$test_directory/bin/sdkmanager" "$test_directory/bin/sleep"
ndk_version=28.2.13676358

bash "$tool_directory/install_android_ndk.sh" "$test_directory/sdk" "$ndk_version"
[[ "$(wc -l < "$test_directory/calls")" -eq 2 ]]
bash "$tool_directory/install_android_ndk.sh" "$test_directory/sdk" "$ndk_version"
[[ "$(wc -l < "$test_directory/calls")" -eq 2 ]]

export NDK_TEST_CASE=incomplete
mkdir -p "$test_directory/incomplete-sdk"
rm -- "$test_directory/calls"
bash "$tool_directory/install_android_ndk.sh" "$test_directory/incomplete-sdk" "$ndk_version"
[[ "$(wc -l < "$test_directory/calls")" -eq 2 ]]

export NDK_TEST_CASE=permanent
mkdir -p "$test_directory/failed-sdk"
rm -- "$test_directory/calls"
if bash "$tool_directory/install_android_ndk.sh" "$test_directory/failed-sdk" "$ndk_version"; then
  echo 'An exhausted installation must fail the job.' >&2
  exit 1
fi
[[ "$(wc -l < "$test_directory/calls")" -eq 3 ]]

if bash "$tool_directory/install_android_ndk.sh" "$test_directory/sdk" '../unexpected'; then
  echo 'A package version must not escape the SDK directory.' >&2
  exit 1
fi
echo 'NDK cache and recovery checks passed.'
