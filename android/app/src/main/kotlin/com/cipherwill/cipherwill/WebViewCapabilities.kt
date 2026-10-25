// Enables Android Credential Manager support in the existing Flutter WebView.
// Owns feature detection and the supported plugin-to-WebView lookup.
// Does not implement passkey cryptography or access vault factors.
package com.cipherwill.cipherwill

import androidx.webkit.WebSettingsCompat
import androidx.webkit.WebViewFeature
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.webviewflutter.WebViewFlutterAndroidExternalApi

object WebViewCapabilities {
    fun register(engine: FlutterEngine) {
        MethodChannel(engine.dartExecutor.binaryMessenger, "cipherwill/webview").setMethodCallHandler { call, result ->
            if (call.method != "enablePasskeys") {
                result.notImplemented()
                return@setMethodCallHandler
            }
            val identifier = (call.arguments as? Number)?.toLong()
            val webView = identifier?.let { WebViewFlutterAndroidExternalApi.getWebView(engine, it) }
            if (webView == null || !WebViewFeature.isFeatureSupported(WebViewFeature.WEB_AUTHENTICATION)) {
                result.success(false)
                return@setMethodCallHandler
            }
            WebSettingsCompat.setWebAuthenticationSupport(webView.settings, WebSettingsCompat.WEB_AUTHENTICATION_SUPPORT_FOR_APP)
            result.success(WebSettingsCompat.getWebAuthenticationSupport(webView.settings) == WebSettingsCompat.WEB_AUTHENTICATION_SUPPORT_FOR_APP)
        }
    }
}
