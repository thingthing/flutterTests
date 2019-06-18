part of './login.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed({
    @required this.username,
    @required this.password,
    this.register = false,
  }) : super(<dynamic>[username, password, register]);

  final String username;
  final String password;
  final bool register;

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}
