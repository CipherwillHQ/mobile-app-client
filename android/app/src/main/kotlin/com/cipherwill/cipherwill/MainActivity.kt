// Hosts Flutter authentication and the web application.
// Owns Android screenshot protection and wallet returns without web navigation.
// Does not implement native vault storage or passkey cryptography.
package com.cipherwill.cipherwill
import android.content.pm.ApplicationInfo
import android.content.Intent
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun onNewIntent(intent: Intent) {
        // The signature returns over the SDK connection; a router navigation would discard it.
        if (isWalletReturn(intent)) return
        super.onNewIntent(intent)
    }

    override fun getInitialRoute(): String? =
        if (isWalletReturn(intent)) "/app" else super.getInitialRoute()

    override fun configureFlutterEngine(engine: FlutterEngine) {
        super.configureFlutterEngine(engine)
        WebViewCapabilities.register(engine)
        if ((applicationInfo.flags and ApplicationInfo.FLAG_DEBUGGABLE) == 0) {
            window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
        }
    }
}
