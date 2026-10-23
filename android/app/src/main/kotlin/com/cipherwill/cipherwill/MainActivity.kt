// Connects Flutter to native factor storage and passkey APIs.
// Owns platform channel registration.
// Does not read vault contents or initialize Firebase.
package com.cipherwill.cipherwill
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import android.view.WindowManager
import io.flutter.plugin.common.MethodChannel
class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(engine: FlutterEngine) {
        super.configureFlutterEngine(engine)
        window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
        val biometrics = BiometricVault(this)
        val passkeys = PasskeyBridge(this)
        MethodChannel(engine.dartExecutor.binaryMessenger, "cipherwill/security").setMethodCallHandler { call, result ->
            when (call.method) {
                "saveKey", "readKey", "deleteKey", "clearKeys", "pruneKeys" -> biometrics.handle(call, result)
                "createPasskey", "getPasskey" -> passkeys.handle(call, result)
                else -> result.notImplemented()
            }
        }
    }
}
