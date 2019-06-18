part of 'login.dart';

class LoginEmailInput extends StatelessWidget {
  const LoginEmailInput({this.onSaved});

  final StringCallback onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email',
            icon: const Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (String value) =>
            value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: onSaved,
      ),
    );
  }
}
