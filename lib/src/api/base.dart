import 'package:meta/meta.dart';

abstract class BaseAuth<T> {
  Future<String> signIn({@required String email, @required String password});

  Future<String> signUp({@required String email, @required String password});

  Future<T> getCurrentUser();

  Future<bool> userExists();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}
