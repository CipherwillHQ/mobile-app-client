// Stores derived factor keys in a device-only biometric-protected Keychain.
// Owns access controls, prompt cancellation and serialized secret operations.
// Does not store passwords or authenticate Firebase accounts.
import Flutter
import LocalAuthentication
import Security
final class BiometricVault {
  private var revision = 0
  private var activeContext: LAContext?
  private let service = "com.cipherwill.app.factors"
  private let index = "cipherwill.factor.ids"
  private var ids: [String] { UserDefaults.standard.stringArray(forKey: index) ?? [] }
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any] ?? [:]
    let id = args["id"] as? String ?? ""
    switch call.method {
    case "clearKeys":
      cancel()
      SecItemDelete([kSecClass: kSecClassGenericPassword, kSecAttrService: service] as CFDictionary)
      UserDefaults.standard.removeObject(forKey: index)
      result(nil)
    case "pruneKeys":
      let valid = args["ids"] as? [String] ?? []
      for old in ids where !valid.contains(old) { remove(old) }
      result(nil)
    case "deleteKey": cancel(); remove(id); result(nil)
    case "saveKey", "readKey":
      guard activeContext == nil else {
        result(FlutterError(code: "BUSY", message: "Biometric authentication is already running.", details: nil)); return
      }
      if call.method == "saveKey" { save(id, secret: args["secret"] as? String ?? "", result: result) }
      else { read(id, result: result) }
    default: result(FlutterMethodNotImplemented)
    }
  }
  private func cancel() { revision += 1; activeContext?.invalidate(); activeContext = nil }
  private func remove(_ id: String) {
    SecItemDelete(base(id) as CFDictionary)
    UserDefaults.standard.set(ids.filter { $0 != id }, forKey: index)
  }
  private func base(_ id: String) -> [CFString: Any] {
    [kSecClass: kSecClassGenericPassword, kSecAttrService: service, kSecAttrAccount: id]
  }
  private func save(_ id: String, secret: String, result: @escaping FlutterResult) {
    let epoch = revision
    let context = LAContext()
    activeContext = context
    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Protect your Cipherwill factor key") { success, _ in
      DispatchQueue.main.async {
        guard success && epoch == self.revision else {
          if epoch == self.revision { self.activeContext = nil }
          result(FlutterError(code: "BIOMETRIC_CANCELLED", message: "Biometric authentication was cancelled or unavailable.", details: nil)); return
        }
        self.activeContext = nil
        guard let access = SecAccessControlCreateWithFlags(nil, kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly, .biometryCurrentSet, nil) else {
          result(FlutterError(code: "KEY_UNAVAILABLE", message: "Biometric protection is unavailable.", details: nil)); return
        }
        var query = self.base(id)
        SecItemDelete(query as CFDictionary)
        query[kSecAttrAccessControl] = access
        query[kSecValueData] = secret.data(using: .utf8)!
        query[kSecUseAuthenticationContext] = context
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == errSecSuccess {
          UserDefaults.standard.set(Array(Set(self.ids + [id])), forKey: self.index)
        }
        result(status == errSecSuccess ? nil : FlutterError(code: "KEY_UNAVAILABLE", message: "Unable to protect this factor key.", details: nil))
      }
    }
  }
  private func read(_ id: String, result: @escaping FlutterResult) {
    let epoch = revision
    let context = LAContext()
    activeContext = context
    context.localizedReason = "Unlock your Cipherwill security factor"
    DispatchQueue.global(qos: .userInitiated).async {
      var query = self.base(id)
      query[kSecReturnData] = true
      query[kSecUseAuthenticationContext] = context
      var value: CFTypeRef?
      let status = SecItemCopyMatching(query as CFDictionary, &value)
      DispatchQueue.main.async {
        guard epoch == self.revision else {
          result(FlutterError(code: "KEY_UNAVAILABLE", message: "Factor storage changed. Authenticate again.", details: nil)); return
        }
        self.activeContext = nil
        if status == errSecSuccess, let data = value as? Data { result(String(data: data, encoding: .utf8)) }
        else if status == errSecItemNotFound { result(nil) }
        else { result(FlutterError(code: "KEY_UNAVAILABLE", message: "Unlock with your security factor to continue.", details: nil)) }
      }
    }
  }
}
