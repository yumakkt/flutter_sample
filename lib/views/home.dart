import 'package:flutter/material.dart';

import '../externals/auth.dart';

class Home extends StatelessWidget {
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Text('Home'),
        FlatButton(
            onPressed: () {
              _auth.signout();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (Route<dynamic> route) => false);
            },
            child: Text('sign out')),
      ],
    ));
  }
}
