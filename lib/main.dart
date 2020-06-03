import 'package:flutter/material.dart';

import

import './layouts/deffault_scaffold.dart';
import './views/home.dart';
import './views/login.dart';
import './views/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '承認欲求うるおいあぷり',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DefaultScaffold(Home()),
        '/login': (context) => DefaultScaffold(Login()),
        '/users': (context) => DefaultScaffold(Users()),
      },
    );
  }
}
