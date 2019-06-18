part of 'login.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({this.formMode, this.onPress});

  final FormMode formMode;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: formMode == FormMode.LOGIN
          ? Text('Create an account',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : Text('Have an account? Sign in',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: onPress,
    );
  }
}
