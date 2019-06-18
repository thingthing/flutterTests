part of './auth.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List<String> props = const <String>[]]) : super(props);
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  LoggedIn({@required this.username, @required this.password})
      : super(<String>[username, password]);

  final String username;
  final String password;

  @override
  String toString() => 'LoggedIn { token: $username }';
}

class LoggedOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}

class Registered extends AuthEvent {
  Registered({@required this.username, @required this.password})
      : super(<String>[username, password]);

  final String username;
  final String password;

  @override
  String toString() => 'Registered { username: $username }';
}
