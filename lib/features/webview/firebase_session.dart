// Supplies the native Firebase identity and a fresh short-lived ID token.
// Owns the minimal authentication payload passed to the trusted web page.
// Does not export refresh tokens or create Firebase custom tokens.
import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, dynamic>> firebaseSession(User user) async {
  final token = await user.getIdToken();
  if (token == null || token.isEmpty) {
    throw StateError('Your session is unavailable. Sign in again.');
  }
  return {'uid': user.uid, 'idToken': token};
}
