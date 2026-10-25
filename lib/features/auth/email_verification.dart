// Sends verification links and confirms fresh server account status.
// Owns delivery acceptance and Firebase reload/token refresh before checking.
// Does not mark accounts verified or change the active route.
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/api/api_client.dart';

Future<void> sendVerificationEmail(ApiClient api) async {
  final result = await api.run('SEND_EMAIL_VERIFICATION');
  if (result['sendEmailVerification'] != true) {
    throw StateError('Unable to send verification email. Please try again.');
  }
}

Future<bool> checkEmailVerification(ApiClient api, FirebaseAuth auth) async {
  final user = auth.currentUser;
  if (user == null) {
    throw StateError('Sign in again to check your email verification.');
  }
  await user.reload();
  await user.getIdToken(true);
  return (await api.account()).email_verified;
}
