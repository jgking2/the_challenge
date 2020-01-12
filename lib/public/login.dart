import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_challenge/auth/auth_provider.dart';

var formKey = GlobalKey<FormState>();

// Form.
String _email;
String _password;

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Column(children: [
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email Address'),
                  validator: (value) => value == '' ? 'Email required' : null,
                  onSaved: (val) => _email = val,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) =>
                      value == '' ? 'Password required' : null,
                  onSaved: (val) => _password = val,
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () async {
                    var form = formKey.currentState;
                    form.save();
                    if (form.validate()) {
                      var result = await auth.login(_email, _password);
                      print(result);
                    }
                  },
                )
              ],
            ),
          ),
          GestureDetector(
            child: Text('Go to Register'),
            onTap: () => Navigator.pushNamed(context, 'register'),
          )
        ]));
  }
}
