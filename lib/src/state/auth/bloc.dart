part of './auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({@required this.auth}) : assert(auth != null);

  final BaseAuth auth;

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    try {
      if (event is AppStarted) {
        final bool hasToken = await auth.userExists();
        await Future<void>.delayed(Duration(seconds: 1));
        if (hasToken) {
          yield AuthAuthenticated();
        } else {
          yield AuthUnauthenticated();
        }
      }

      if (event is LoggedIn) {
        yield AuthLoading();
        await auth.signIn(email: event.username, password: event.password);
        yield AuthAuthenticated();
      }

      if (event is LoggedOut) {
        yield AuthLoading();
        await auth.signOut();
        yield AuthUnauthenticated();
      }

      if (event is Registered) {
        yield AuthLoading();
        await auth.signUp(email: event.username, password: event.password);
        yield AuthAuthenticated();
      }
    } catch (error) {
      print('Error cathc in auth $error');
      yield AuthFailure(error: error);
    }
  }
}
