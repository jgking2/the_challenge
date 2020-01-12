import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_challenge/auth/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:the_challenge/public/public.dart';

import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthProvider.userStream),
        Provider<AuthProvider>.value(
          value: AuthProvider(),
        )
      ],
      child: AuthSwitch(),
    );
  }
}

class AuthSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    Widget child;
    if (user != null) {
      child = App();
    } else {
      child = Public();
    }
    return child;
  }
}
