import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/base.dart';
import '../state/auth/auth.dart';
import 'home.dart';
import 'login.dart';
import 'splash.dart';

class Boilerplate extends StatefulWidget {
  Boilerplate({@required this.auth}) : assert(auth != null);

  final BaseAuth auth;

  @override
  _BoilerplateState createState() => _BoilerplateState();
}

class _BoilerplateState extends State<Boilerplate> {
  AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc(auth: widget.auth);
    _authBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        builder: (BuildContext context) => _authBloc,
        child: MaterialApp(
            title: 'Flutter Boilerplate Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: BlocBuilder<AuthEvent, AuthState>(
              bloc: _authBloc,
              builder: (BuildContext context, AuthState state) {
                if (state is AuthUninitialized) {
                  return SplashScreen();
                }
                if (state is AuthAuthenticated) {
                  return HomeScreen();
                }
                // if (state is AuthUnauthenticated) {
                return LoginScreen(auth: widget.auth);
                //}
              },
            )));
  }
}
