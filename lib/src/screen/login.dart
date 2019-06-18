import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/base.dart';
import '../state/auth/auth.dart';
import '../state/login/login.dart';
import '../widgets/login/login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key, @required this.auth})
      : assert(auth != null),
        super(key: key);

  final BaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      builder: (BuildContext context) =>
          LoginBloc(auth: auth, authBloc: BlocProvider.of<AuthBloc>(context)),
      child: LoginForm(),
    );
  }
}
