import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Text('user'),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('戻る'))
      ],
    ));
  }
}
