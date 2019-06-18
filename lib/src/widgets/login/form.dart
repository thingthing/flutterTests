part of 'login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isIos;
  String _email;
  String _password;

  FormMode _formMode = FormMode.SIGNUP;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    super.initState();
  }

  bool _validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _validateAndSubmit() async {
    if (_validateAndSave()) {
      if (_formMode == FormMode.LOGIN) {
        _loginBloc.dispatch(
            LoginButtonPressed(username: _email, password: _password));
      } else {
        _loginBloc.dispatch(LoginButtonPressed(
            username: _email, password: _password, register: true));
      }
    }
  }

  void _onSecondaryButtonPress() {
    _formKey.currentState.reset();
    setState(() {
      if (_formMode == FormMode.LOGIN) {
        _formMode = FormMode.SIGNUP;
      } else {
        _formMode = FormMode.LOGIN;
      }
    });
  }

  Widget _showBody() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(shrinkWrap: true, children: <Widget>[
            LoginLogo(),
            LoginEmailInput(
              onSaved: (String value) => _email = value,
            ),
            LoginPasswordInput(
              onSaved: (String value) => _password = value,
            ),
            LoginPrimaryButton(
              formMode: _formMode,
              onPress: _validateAndSubmit,
            ),
            SecondaryButton(
              formMode: _formMode,
              onPress: _onSecondaryButtonPress,
            ),
          ]),
        ));
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: BlocListener<AuthEvent, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthFailure) {
            _onWidgetDidBuild(() {
              String errorMessage = '';
              if (_isIos) {
                errorMessage = state.error.details;
              } else
                errorMessage = state.error.message;
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('$errorMessage'),
                  backgroundColor: Colors.red,
                ),
              );
            });
          }
        },
        child: BlocBuilder<AuthEvent, AuthState>(
          bloc: authBloc,
          builder: (BuildContext context, AuthState state) {
            return Stack(children: <Widget>[
              _showBody(),
              if (state is AuthLoading)
                Center(child: const CircularProgressIndicator())
            ]);
          },
        ),
      ),
    );
  }
}
