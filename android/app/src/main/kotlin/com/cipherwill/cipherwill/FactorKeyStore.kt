// Encrypts device factor keys with biometric-bound Android Keystore keys.
// Owns encrypted preferences and per-factor aliases.
// Does not authenticate Firebase accounts or save passwords.
package com.cipherwill.cipherwill
import android.content.Context
import android.os.Build
import android.security.keystore.KeyGenParameterSpec
import android.security.keystore.KeyProperties
import android.util.Base64
import java.security.KeyStore
import java.security.MessageDigest
import javax.crypto.Cipher
import javax.crypto.KeyGenerator
import javax.crypto.SecretKey
import javax.crypto.spec.GCMParameterSpec
class FactorKeyStore(context: Context) {
    private val preferences = context.getSharedPreferences("cipherwill_factors", Context.MODE_PRIVATE)
    private val store = KeyStore.getInstance("AndroidKeyStore").apply { load(null) }
    fun alias(id: String): String = "cipherwill.factor." + MessageDigest.getInstance("SHA-256").digest(id.toByteArray()).joinToString("") { "%02x".format(it) }
    fun encryption(id: String): Cipher {
        val name = alias(id)
        if (store.containsAlias(name)) store.deleteEntry(name)
        val builder = KeyGenParameterSpec.Builder(name, KeyProperties.PURPOSE_ENCRYPT or KeyProperties.PURPOSE_DECRYPT)
            .setBlockModes(KeyProperties.BLOCK_MODE_GCM).setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
            .setUserAuthenticationRequired(true).setInvalidatedByBiometricEnrollment(true)
        if (Build.VERSION.SDK_INT >= 30) builder.setUserAuthenticationParameters(0, KeyProperties.AUTH_BIOMETRIC_STRONG)
        else builder.setUserAuthenticationValidityDurationSeconds(-1)
        val generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore")
        generator.init(builder.build())
        return Cipher.getInstance("AES/GCM/NoPadding").apply { init(Cipher.ENCRYPT_MODE, generator.generateKey()) }
    }
    fun persist(id: String, cipher: Cipher, secret: String) {
        val encrypted = cipher.doFinal(secret.toByteArray(Charsets.UTF_8))
        preferences.edit().putString(alias(id), Base64.encodeToString(cipher.iv, Base64.NO_WRAP) + ":" + Base64.encodeToString(encrypted, Base64.NO_WRAP)).commit()
    }
    fun decryption(id: String): Cipher? {
        val record = preferences.getString(alias(id), null) ?: return null
        val key = store.getKey(alias(id), null) as SecretKey
        val iv = Base64.decode(record.substringBefore(":"), Base64.NO_WRAP)
        return Cipher.getInstance("AES/GCM/NoPadding").apply { init(Cipher.DECRYPT_MODE, key, GCMParameterSpec(128, iv)) }
    }
    fun read(id: String, cipher: Cipher): String {
        val record = preferences.getString(alias(id), null) ?: error("Missing factor key")
        return cipher.doFinal(Base64.decode(record.substringAfter(":"), Base64.NO_WRAP)).toString(Charsets.UTF_8)
    }
    fun delete(id: String) { store.deleteEntry(alias(id)); preferences.edit().remove(alias(id)).commit() }
    fun prune(ids: List<String>) {
        val valid = ids.map { alias(it) }.toSet()
        store.aliases().toList().filter { it.startsWith("cipherwill.factor.") && !valid.contains(it) }.forEach { name -> store.deleteEntry(name); preferences.edit().remove(name).commit() }
    }
    fun clear() {
        store.aliases().toList().filter { it.startsWith("cipherwill.factor.") }.forEach { store.deleteEntry(it) }
        preferences.edit().clear().commit()
    }
}
