# Installs the exact Android NDK with bounded retries after failed downloads.
# Owns SDK package validation and cleanup of partial NDK installations.
# Does not change other installed SDK packages or application dependencies.
set -euo pipefail

sdk_root="${1:?Pass the Android SDK directory}"
ndk_version="${2:?Pass the required NDK version}"
[[ -d "$sdk_root" && "$ndk_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || exit 2
sdk_root="$(cd "$sdk_root" && pwd)"
ndk_directory="$sdk_root/ndk/$ndk_version"

if [[ -s "$ndk_directory/source.properties" && -x "$ndk_directory/ndk-build" ]]; then
  echo "Using installed NDK $ndk_version."
  exit 0
fi

sdk_manager=''
for candidate in "$sdk_root/cmdline-tools/latest/bin/sdkmanager" "$sdk_root"/cmdline-tools/*/bin/sdkmanager; do
  if [[ -x "$candidate" ]]; then
    sdk_manager="$candidate"
    break
  fi
done
if [[ -z "$sdk_manager" ]]; then
  sdk_manager="$(command -v sdkmanager || true)"
fi
if [[ -z "$sdk_manager" ]]; then
  echo "Android SDK command-line tools are missing. Install them under $sdk_root/cmdline-tools or add sdkmanager to PATH." >&2
  exit 127
fi

for attempt in 1 2 3; do
  if "$sdk_manager" --sdk_root="$sdk_root" --install "ndk;$ndk_version" &&
      [[ -s "$ndk_directory/source.properties" && -x "$ndk_directory/ndk-build" ]]; then
    echo "Installed NDK $ndk_version."
    exit 0
  fi
  if (( attempt < 3 )); then
    echo "NDK installation attempt $attempt failed; retrying with a fresh download."
    rm -rf -- "$sdk_root/.temp" "$ndk_directory"
    sleep "$((attempt * 5))"
  fi
done

echo "NDK $ndk_version installation failed after three attempts." >&2
exit 1
