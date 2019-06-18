part of 'login.dart';

class LoginPrimaryButton extends StatelessWidget {
  const LoginPrimaryButton({@required this.formMode, @required this.onPress})
      : assert(formMode != null && onPress != null);

  final FormMode formMode;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthEvent, AuthState>(
        bloc: BlocProvider.of<AuthBloc>(context),
        builder: (BuildContext context, AuthState state) {
          return Padding(
              padding: const EdgeInsets.only(top: 45),
              child: MaterialButton(
                elevation: 5.0,
                minWidth: 200.0,
                height: 42.0,
                color: Theme.of(context).accentColor,
                child: formMode == FormMode.LOGIN
                    ? Text('Login',
                        style: TextStyle(fontSize: 20.0, color: Colors.white))
                    : Text('Create account',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: state is! AuthLoading ? onPress : null,
              ));
        });
  }
}
