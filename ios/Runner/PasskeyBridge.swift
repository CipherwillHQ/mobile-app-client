// Uses AuthenticationServices for Cipherwill associated-domain passkeys.
// Owns native passkey requests and credential-ID responses.
// Does not derive or retain vault keys.
import Flutter
import AuthenticationServices
final class PasskeyBridge: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
  private var pending: FlutterResult?
  private var controller: ASAuthorizationController?
  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard pending == nil else { result(FlutterError(code: "BUSY", message: "A passkey request is already running.", details: nil)); return }
    guard let args = call.arguments as? [String: Any], let json = args["json"] as? String,
      let data = json.data(using: .utf8), let options = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
      let challengeText = options["challenge"] as? String, let challenge = decode(challengeText)
    else { result(FlutterError(code: "PASSKEY_INVALID", message: "Invalid passkey request.", details: nil)); return }
    let provider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: "cipherwill.com")
    let request: ASAuthorizationRequest
    if call.method == "createPasskey", let user = options["user"] as? [String: Any], let id = user["id"] as? String, let userID = decode(id) {
      let registration = provider.createCredentialRegistrationRequest(challenge: challenge, name: user["name"] as? String ?? "Cipherwill", userID: userID)
      registration.userVerificationPreference = .required
      request = registration
    } else {
      let assertion = provider.createCredentialAssertionRequest(challenge: challenge)
      assertion.userVerificationPreference = .required
      request = assertion
    }
    pending = result
    let authorization = ASAuthorizationController(authorizationRequests: [request])
    authorization.delegate = self; authorization.presentationContextProvider = self
    controller = authorization; authorization.performRequests()
  }
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.flatMap { $0.windows }.first { $0.isKeyWindow } ?? ASPresentationAnchor()
  }
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    let id: Data?
    if let registration = authorization.credential as? ASAuthorizationPlatformPublicKeyCredentialRegistration { id = registration.credentialID }
    else if let assertion = authorization.credential as? ASAuthorizationPlatformPublicKeyCredentialAssertion { id = assertion.credentialID }
    else { id = nil }
    let callback = pending; pending = nil; self.controller = nil
    if let id = id { callback?(["rawId": id.base64EncodedString()]) }
    else { callback?(FlutterError(code: "PASSKEY_UNAVAILABLE", message: "Use another security factor.", details: nil)) }
  }
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    let callback = pending; pending = nil; self.controller = nil
    callback?(FlutterError(code: "PASSKEY_CANCELLED", message: "Passkey authentication was cancelled or unavailable.", details: nil))
  }
  private func decode(_ value: String) -> Data? {
    let base = value.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
    return Data(base64Encoded: base + String(repeating: "=", count: (4 - base.count % 4) % 4))
  }
}
