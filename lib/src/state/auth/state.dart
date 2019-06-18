part of './auth.dart';

abstract class AuthState extends Equatable {
  AuthState([List props = const <dynamic>[]]) : super(props);
}

class AuthUninitialized extends AuthState {
  @override
  String toString() => 'AuthUninitialized';
}

class AuthAuthenticated extends AuthState {
  @override
  String toString() => 'AuthAuthenticated';
}

class AuthUnauthenticated extends AuthState {
  @override
  String toString() => 'AuthUnauthenticated';
}

class AuthLoading extends AuthState {
  @override
  String toString() => 'AuthLoading';
}

class AuthFailure extends AuthState {
  AuthFailure({@required this.error}) : super(<dynamic>[error]);

  final dynamic error;

  @override
  String toString() => 'AuthFailure { error: ${error.toString()} }';
}
