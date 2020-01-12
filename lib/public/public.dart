import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class Public extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginRoute(),
        'register': (context) => RegisterRoute()
      },
    );
  }
}
