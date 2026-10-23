// Uses Android Credential Manager for Cipherwill domain-associated passkeys.
// Owns native creation and assertion responses.
// Does not derive vault keys or send assertions to another service.
package com.cipherwill.cipherwill
import androidx.credentials.CredentialManager
import androidx.credentials.CreatePublicKeyCredentialRequest
import androidx.credentials.CreatePublicKeyCredentialResponse
import androidx.credentials.GetCredentialRequest
import androidx.credentials.GetPublicKeyCredentialOption
import androidx.credentials.PublicKeyCredential
import androidx.fragment.app.FragmentActivity
import androidx.lifecycle.lifecycleScope
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.launch
import org.json.JSONObject
class PasskeyBridge(private val activity: FragmentActivity) {
    fun handle(call: MethodCall, result: MethodChannel.Result) {
        activity.lifecycleScope.launch {
            try {
                val manager = CredentialManager.create(activity)
                val json = call.argument<String>("json")!!
                val response = if (call.method == "createPasskey") {
                    val value = manager.createCredential(activity, CreatePublicKeyCredentialRequest(json)) as CreatePublicKeyCredentialResponse
                    value.registrationResponseJson
                } else {
                    val value = manager.getCredential(activity, GetCredentialRequest(listOf(GetPublicKeyCredentialOption(json))))
                    (value.credential as PublicKeyCredential).authenticationResponseJson
                }
                val data = JSONObject(response)
                result.success(mapOf("rawId" to data.getString("rawId")))
            } catch (_: Exception) { result.error("PASSKEY_UNAVAILABLE", "Passkey authentication was cancelled or unavailable. Try another factor.", null) }
        }
    }
}
