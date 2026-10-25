// Supplies controlled Firebase identities for authentication and bridge tests.
// Owns test tokens, auth-state events and sign-out counters.
// Does not contact Firebase or invoke provider plugins.
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class FakeTokenResult implements IdTokenResult {
  @override
  final String? token;
  @override
  final DateTime? expirationTime;
  FakeTokenResult({this.token = 'test-id-token', DateTime? expires})
    : expirationTime =
          expires ?? DateTime.fromMillisecondsSinceEpoch(2000000000000);
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class FakeUser implements User {
  @override
  final String uid;
  final Future<IdTokenResult>? pendingToken;
  FakeUser(this.uid, {this.pendingToken});
  @override
  String get email => 'owner@example.test';
  @override
  bool get emailVerified => true;
  @override
  bool get isAnonymous => false;
  @override
  String? get displayName => 'Test Owner';
  @override
  String? get photoURL => null;
  @override
  String? get phoneNumber => null;
  @override
  String? get tenantId => null;
  @override
  String get refreshToken => '';
  @override
  List<UserInfo> get providerData => [];
  @override
  Future<IdTokenResult> getIdTokenResult([bool forceRefresh = false]) async =>
      pendingToken ?? FakeTokenResult();
  @override
  Future<String?> getIdToken([bool forceRefresh = false]) async =>
      (await getIdTokenResult(forceRefresh)).token;
  @override
  Future<void> reload() async {}
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class FakeAuth implements FirebaseAuth {
  User? user = FakeUser('firebase_account');
  int signOuts = 0;
  final changes = StreamController<User?>.broadcast();
  @override
  User? get currentUser => user;
  @override
  Stream<User?> authStateChanges() async* {
    yield user;
    yield* changes.stream;
  }

  void setUser(User? value) {
    user = value;
    changes.add(value);
  }

  @override
  Future<void> signOut() async {
    signOuts++;
    setUser(null);
  }

  Future<void> dispose() => changes.close();
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
