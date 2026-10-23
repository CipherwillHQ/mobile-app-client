// Provides account identities for session-boundary tests.
// Owns a controllable Firebase current-user substitute.
// Does not call Firebase plugins.
import 'package:firebase_auth/firebase_auth.dart';

class FakeUser implements User {
  @override
  final String uid;
  FakeUser(this.uid);
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class FakeAuth implements FirebaseAuth {
  User? user = FakeUser('firebase_account');
  @override
  User? get currentUser => user;
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
