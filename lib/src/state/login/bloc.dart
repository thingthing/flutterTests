part of './login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.auth,
    @required this.authBloc,
  })  : assert(auth != null),
        assert(authBloc != null);

  final BaseAuth auth;
  final AuthBloc authBloc;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        // final token = await auth.authenticate(
        //   username: event.username,
        //   password: event.password,
        // );
        if (event.register == true) {
          print('Dispatch register');
          authBloc.dispatch(
              Registered(username: event.username, password: event.password));
        } else {
          authBloc.dispatch(
              LoggedIn(username: event.username, password: event.password));
        }
        // await Future<void>.delayed(Duration(seconds: 2));
        yield LoginInitial();
      } catch (error) {
        print('Error cathc in login');
        yield LoginFailure(error: error);
      }
    }
  }
}
