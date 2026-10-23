// Retrieves factor secrets only through a successful biometric CryptoObject.
// Owns BiometricPrompt callbacks and enrollment invalidation handling.
// Does not accept an authentication-only boolean as permission to read keys.
package com.cipherwill.cipherwill
import androidx.biometric.BiometricPrompt
import androidx.biometric.BiometricManager
import androidx.core.content.ContextCompat
import androidx.fragment.app.FragmentActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
class BiometricVault(private val activity: FragmentActivity) {
    private val keys = FactorKeyStore(activity)
    private var busy = false
    private var revision = 0
    private var activePrompt: BiometricPrompt? = null
    fun handle(call: MethodCall, result: MethodChannel.Result) {
        if (busy && call.method in listOf("saveKey", "readKey")) { result.error("BUSY", "Biometric authentication is already running.", null); return }
        try {
            when (call.method) {
                "clearKeys" -> { revision++; activePrompt?.cancelAuthentication(); keys.clear(); result.success(null) }
                "pruneKeys" -> { keys.prune(call.argument<List<String>>("ids") ?: emptyList()); result.success(null) }
                "deleteKey" -> { revision++; activePrompt?.cancelAuthentication(); keys.delete(call.argument<String>("id")!!); result.success(null) }
                "saveKey", "readKey" -> authenticate(call, result)
            }
        } catch (_: Exception) {
            busy = false
            call.argument<String>("id")?.let { keys.delete(it) }
            result.error("KEY_UNAVAILABLE", "Use your security factor again to enable biometrics.", null)
        }
    }
    private fun authenticate(call: MethodCall, result: MethodChannel.Result) {
        val id = call.argument<String>("id")!!
        val save = call.method == "saveKey"
        val cipher = if (save) keys.encryption(id) else keys.decryption(id)
        if (cipher == null) { result.success(null); return }
        busy = true
        val epoch = revision
        var completed = false
        val prompt = BiometricPrompt(activity, ContextCompat.getMainExecutor(activity), object : BiometricPrompt.AuthenticationCallback() {
            override fun onAuthenticationError(code: Int, message: CharSequence) {
                if (completed) return
                completed = true; busy = false; activePrompt = null
                result.error("BIOMETRIC_CANCELLED", "Biometric unlock was cancelled or unavailable.", null)
            }
            override fun onAuthenticationSucceeded(authentication: BiometricPrompt.AuthenticationResult) {
                if (completed) return
                completed = true; busy = false; activePrompt = null
                try {
                    check(epoch == revision) { "Factor storage changed" }
                    val authorized = authentication.cryptoObject?.cipher ?: error("Missing biometric cipher")
                    if (save) { keys.persist(id, authorized, call.argument<String>("secret")!!); result.success(null) }
                    else result.success(keys.read(id, authorized))
                } catch (_: Exception) { result.error("KEY_UNAVAILABLE", "Use your security factor again.", null) }
            }
        })
        val info = BiometricPrompt.PromptInfo.Builder().setTitle("Unlock Cipherwill factor")
            .setSubtitle("Your saved factor key stays on this device.")
            .setAllowedAuthenticators(BiometricManager.Authenticators.BIOMETRIC_STRONG)
            .setNegativeButtonText("Use security factor").build()
        activePrompt = prompt
        prompt.authenticate(info, BiometricPrompt.CryptoObject(cipher))
    }
}
