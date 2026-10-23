// Registers plugins and the native Cipherwill security channel.
// Owns biometric and passkey bridge lifetimes.
// Does not initialize Firebase or read account data.
import Flutter
import UIKit
@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private let biometrics = BiometricVault()
  private let passkeys = PasskeyBridge()
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CipherwillSecurity")!
    let channel = FlutterMethodChannel(name: "cipherwill/security", binaryMessenger: registrar.messenger())
    channel.setMethodCallHandler { [weak self] call, result in
      switch call.method {
      case "createPasskey", "getPasskey": self?.passkeys.handle(call, result: result)
      default: self?.biometrics.handle(call, result: result)
      }
    }
  }
}
