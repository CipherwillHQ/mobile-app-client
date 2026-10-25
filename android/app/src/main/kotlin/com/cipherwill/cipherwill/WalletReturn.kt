// Identifies the MetaMask return intent that only resumes the existing app.
// Owns the dedicated SDK callback scheme shared with the web client.
// Does not accept signatures or authenticate an account from an intent.
package com.cipherwill.cipherwill

import android.content.Intent

fun isWalletReturn(intent: Intent?): Boolean =
    intent?.action == Intent.ACTION_VIEW && intent.data?.scheme == "cipherwill-wallet"
