# Configures the existing Firebase project for Cipherwill Android and iOS.
# Owns public native configuration and Google client synchronization.
# Does not log in, handle signing keys or create another Firebase project.
param([string]$Project='project-cipherwill')
$ErrorActionPreference='Stop'
$taskRoot=Split-Path -Parent $PSScriptRoot
$taskIosDownload=$null
Push-Location $taskRoot
try {
  & flutterfire configure "--project=$Project" --platforms=android,ios --android-package-name=com.cipherwill.app --ios-bundle-id=com.cipherwill.app --out=lib/core/config/firebase_options.dart --yes
  if($LASTEXITCODE -ne 0){throw 'FlutterFire configuration failed. Verify CLI account project access.'}
  $taskMetadata=Get-Content -LiteralPath 'firebase.json' -Raw | ConvertFrom-Json
  $taskIosApp=$taskMetadata.flutter.platforms.dart.'lib/core/config/firebase_options.dart'.configurations.ios
  if(-not $taskIosApp){throw 'FlutterFire did not register the requested iOS app.'}
  New-Item -ItemType Directory -Path '.dart_tool' -Force | Out-Null
  $taskIosDownload=Join-Path $taskRoot ('.dart_tool/firebase-ios-'+[guid]::NewGuid().ToString()+'.plist')
  & firebase apps:sdkconfig IOS $taskIosApp "--project=$Project" "--out=$taskIosDownload"
  if($LASTEXITCODE -ne 0){throw 'Downloading the iOS Firebase configuration failed. Use a current Node.js release.'}
  & node tool/sync_ios_firebase.mjs $taskIosDownload
  if($LASTEXITCODE -ne 0){throw 'Native iOS Firebase synchronization failed.'}
  & node tool/sync_google_config.mjs
  if($LASTEXITCODE -ne 0){throw 'Native Google configuration synchronization failed.'}
  & dart format lib/core/config/firebase_options.dart
  if($LASTEXITCODE -ne 0){throw 'Formatting generated Firebase options failed.'}
} finally {
  if($taskIosDownload -and (Test-Path -LiteralPath $taskIosDownload)){
    Remove-Item -LiteralPath $taskIosDownload
  }
  Pop-Location
}
