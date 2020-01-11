import 'package:flutter/material.dart';

class ChallengeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Challenge')),
      body: Center(
          child: RaisedButton(child: Text('Press Me'), onPressed: () {})),
    );
  }
}
