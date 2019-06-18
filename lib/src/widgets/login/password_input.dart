part of 'login.dart';

class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({this.onSaved});

  final StringCallback onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: const Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (String value) =>
            value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: onSaved,
      ),
    );
  }
}
