part of './login.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super(props);
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

class LoginFailure extends LoginState {
  LoginFailure({@required this.error}) : super(<dynamic>[error]);

  final dynamic error;

  @override
  String toString() => 'LoginFailure { error: ${error.toString()} }';
}
