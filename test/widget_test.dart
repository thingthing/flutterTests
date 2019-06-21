import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_boilerplate/src/api/firebase.dart';
import 'package:flutter_boilerplate/src/state/auth/auth.dart';

class MockApi extends Mock implements Auth {}

void main() {
  AuthBloc authBloc;
  MockApi auth;

  setUp(() {
    auth = MockApi();
    authBloc = AuthBloc(auth: auth);
  });

  test('initial state is correct', () {
    expect(authBloc.initialState, AuthUninitialized());
  });

  test('dispose does not emit new states', () {
    expectLater(authBloc.state, emitsInOrder(<AuthState>[]));
    authBloc.dispose();
  });

  group('AppStarted', () {
    test('emits [uninitialized, unauthicated] for invalid token', () {
      final List<AuthState> expectedResponse = [
        AuthUninitialized(),
        AuthUnauthenticated()
      ];

      when(auth.userExists()).thenAnswer((_) => Future<bool>.value(false));

      expectLater(authBloc.state, emitsInOrder(expectedResponse));

      authBloc.dispatch(AppStarted());
    });
  });

  group('LoggedIn', () {
    test('emits [uninitialized, loading, authenticated] when user log in', () {
      final List<AuthState> expectedResponse = [
        AuthUninitialized(),
        AuthLoading(),
        AuthAuthenticated(),
      ];

      expectLater(
        authBloc.state,
        emitsInOrder(expectedResponse),
      );

      authBloc.dispatch(LoggedIn(username: 'valid.username', password: 'valid.password'));
    });
  });

  group('LoggedOut', () {
    test(
        'emits [uninitialized, loading, unauthenticated] when user is logged out',
        () {
      final List<AuthState> expectedResponse = [
        AuthUninitialized(),
        AuthLoading(),
        AuthUnauthenticated(),
      ];

      expectLater(
        authBloc.state,
        emitsInOrder(expectedResponse),
      );

      authBloc.dispatch(LoggedOut());
    });
  });
}
