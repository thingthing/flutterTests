library login_widget;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/auth/auth.dart';
import '../../state/login/login.dart';

part 'email_input.dart';
part 'form.dart';
part 'form_mode.dart';
part 'logo.dart';
part 'password_input.dart';
part 'primary_button.dart';
part 'secondary_button.dart';

typedef StringCallback = void Function(String);
