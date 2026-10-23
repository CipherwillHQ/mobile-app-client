// Signs in and links providers through the existing Firebase project
// Owns native email, Google and Apple authentication.
// Does not unlock Cipherwill vault factors.
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

  Future<void> google({bool link = false, bool reauthenticate = false}) async {
    final google = GoogleSignIn.instance;
    await (googleInitialization ??= google.initialize(
      serverClientId: googleServerClientId.isEmpty
          ? null
          : googleServerClientId,
    ));
    final account = await google.authenticate();
    final credential = GoogleAuthProvider.credential(
      idToken: account.authentication.idToken,
    );
    if (reauthenticate) {
      await firebase.currentUser!.reauthenticateWithCredential(credential);
    } else if (link) {
      await firebase.currentUser!.linkWithCredential(credential);
    } else {
      await firebase.signInWithCredential(credential);
    }
  }

  Future<void> apple({bool link = false, bool reauthenticate = false}) async {
    final provider = AppleAuthProvider()
      ..addScope('email')
      ..addScope('name');
    if (reauthenticate) {
      await firebase.currentUser!.reauthenticateWithProvider(provider);
    } else if (link) {
      await firebase.currentUser!.linkWithProvider(provider);
    } else {
      await firebase.signInWithProvider(provider);
    }
  }
}
