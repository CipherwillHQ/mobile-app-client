// Tracks whether returning to the app requires account authentication.
// Owns the lock state for accounts with no vault security factor.
// Does not store credentials or approve biometric secret retrieval.
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReturnAuthentication extends Notifier<bool> {
  @override
  bool build() => false;
  void require(bool value) => state = value;
}

final returnAuthenticationProvider =
    NotifierProvider<ReturnAuthentication, bool>(ReturnAuthentication.new);
