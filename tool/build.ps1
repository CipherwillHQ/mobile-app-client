# Builds a configured Cipherwill native artifact.
# Owns environment selection and local Flutter invocation.
# Does not create or print credentials and signing keys.
param(
  [ValidateSet('development','staging','production')] [string]$Environment='development',
  [ValidateSet('android','ios')] [string]$Platform='android',
  [string]$FlutterCommand='flutter',
  [switch]$DebugBuild
)
$ErrorActionPreference='Stop'
$taskRoot=Split-Path -Parent $PSScriptRoot
$taskConfig=Join-Path $taskRoot "config/$Environment.json"
if(-not (Test-Path -LiteralPath $taskConfig)){throw "Create config/$Environment.json from its example first."}
$taskValues=Get-Content -LiteralPath $taskConfig -Raw | ConvertFrom-Json
if($taskValues.APP_ENV -ne $Environment){throw 'APP_ENV must match the selected environment.'}
Push-Location $taskRoot
try{
  if($Platform -eq 'android'){
    if($DebugBuild){& $FlutterCommand build apk --debug "--dart-define-from-file=$taskConfig"}
    else{& $FlutterCommand build appbundle --release "--dart-define-from-file=$taskConfig"}
  }else{& $FlutterCommand build ipa --release "--dart-define-from-file=$taskConfig"}
  if($LASTEXITCODE -ne 0){throw 'Native build failed.'}
}finally{Pop-Location}
