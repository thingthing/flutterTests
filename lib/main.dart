import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'src/api/firebase.dart';
import 'src/screen/boilerplate.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('$error, $stacktrace');
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(Boilerplate(auth: Auth()));
}
