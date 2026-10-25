// Signs in through the existing Firebase project.
// Owns native email, Google and Apple authentication.
// Does not link web providers or unlock Cipherwill vault factors.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth firebase;
  final String googleServerClientId;
  Future<void>? googleInitialization;
  AuthService(this.firebase, this.googleServerClientId);

  Future<void> email(
    String email,
    String password, {
    bool signup = false,
  }) async {
    if (signup) {
      await firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      await firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
  }

  Future<void> google() async {
    final google = GoogleSignIn.instance;
    await (googleInitialization ??= google.initialize(
      serverClientId: googleServerClientId.isEmpty
          ? null
          : googleServerClientId,
    ));
    final account = await google.authenticate();
    await firebase.signInWithCredential(
      GoogleAuthProvider.credential(idToken: account.authentication.idToken),
    );
  }

  Future<void> apple() async {
    final provider = AppleAuthProvider()
      ..addScope('email')
      ..addScope('name');
    await firebase.signInWithProvider(provider);
  }
}
