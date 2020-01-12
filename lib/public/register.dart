import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_challenge/auth/auth_provider.dart';

var formKey = GlobalKey<FormState>();

const int PASSWORD_LENGTH = 8;
// Form.
String _name;
String _email;
String _password;

class RegisterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Register')),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) => value == '' ? 'Name required' : null,
                    onSaved: (val) => _name = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email Address"),
                    validator: (value) => value == '' ? 'Email required' : null,
                    onSaved: (val) => _email = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: 'At least 8 characters'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      bool validLength = value.length >= PASSWORD_LENGTH;
                      return validLength
                          ? null
                          : "Password must be at least 8 characters";
                    },
                    onSaved: (val) => _password = val,
                  ),
                  RaisedButton(
                    child: Text('Login'),
                    onPressed: () async {
                      var form = formKey.currentState;
                      form.save();
                      if (form.validate()) {
                        var result =
                            await auth.register(_email, _password, _name);
                      }
                    },
                  )
                ],
              )),
        ));
  }
}
