import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'base.dart';

class Auth implements BaseAuth<FirebaseUser> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> userExists() async {
    return (await getCurrentUser()) != null;
  }

  @override
  Future<String> signIn(
      {@required String email, @required String password}) async {
    final FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.uid;
  }

  @override
  Future<String> signUp(
      {@required String email, @required String password}) async {
    final FirebaseUser user = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  @override
  Future<FirebaseUser> getCurrentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> sendEmailVerification() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  @override
  Future<bool> isEmailVerified() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}
