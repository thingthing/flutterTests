import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/auth/auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Sign out'),
              onPressed: () {
                authBloc.dispatch(LoggedOut());
              },
            )
          ],
        ),
        body: Container(child: const Text('Home screen')));
  }
}
