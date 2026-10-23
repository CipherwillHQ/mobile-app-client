// Calls native biometric-protected key storage and passkey adapters
// Owns platform channel contracts.
// Does not store passwords or accept a boolean biometric bypass.
import 'package:flutter/services.dart';

class DeviceSecurity {
  final MethodChannel channel;
  const DeviceSecurity({
    this.channel = const MethodChannel('cipherwill/security'),
  });
  Future<void> save(String id, String secret) =>
      channel.invokeMethod<void>('saveKey', {'id': id, 'secret': secret});
  Future<String?> read(String id) =>
      channel.invokeMethod<String>('readKey', {'id': id});
  Future<void> delete(String id) =>
      channel.invokeMethod<void>('deleteKey', {'id': id});
  Future<void> prune(List<String> ids) =>
      channel.invokeMethod<void>('pruneKeys', {'ids': ids});
  Future<void> clear() => channel.invokeMethod<void>('clearKeys');
  Future<Map<String, dynamic>> passkey(
    Map<String, dynamic> options, {
    bool create = false,
  }) async => Map<String, dynamic>.from(
    (await channel.invokeMethod<Map>(
      create ? 'createPasskey' : 'getPasskey',
      options,
    ))!,
  );
}
