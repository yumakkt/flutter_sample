import 'package:flutter/material.dart';

import './layouts/deffault_scaffold.dart';
import './views/home.dart';
import './views/login.dart';
import './views/users.dart';

import './externals/auth.dart';

Future<void> init() async {
  final auth = Auth();
  final isLogin = await auth.isLogin;
  print(isLogin);
  runApp(MyApp(isLogin));
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  MyApp(this.isLogin);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '承認欲求うるおいあぷり',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isLogin ? '/' : '/login',
      routes: {
        '/': (context) => DefaultScaffold(Home()),
        '/login': (context) => DefaultScaffold(Login()),
        '/users': (context) => DefaultScaffold(Users()),
      },
    );
  }
}
