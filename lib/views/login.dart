import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../externals/auth.dart';
import '../utils/validator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _auth = Auth();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _showMyDialog(message) async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ログインエラー'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('ユーザー情報を取得できませんでした'),
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
        height: (MediaQuery.of(context).size.height) * 0.5,
        width: (MediaQuery.of(context).size.width) * 0.9,
        child: Card(
          shadowColor: primaryColor,
          elevation: 6,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'メールアドレス'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty) {
                          return '入力してください';
                        }
                        if (!isValidEmailFormat(value)) {
                          return 'フォーマットがおかしいです';
                        }
                        return null;
                      },
                      controller: _emailController,
                    )),
                Container(
                  margin:
                      EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'パスワード'),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                    controller: _passwordController,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: 30, left: 20, right: 20, bottom: 0),
                    child: FlatButton(
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        final email = _emailController.text;
                        final password = _passwordController.text;

                        final Response<FirebaseUser> res = await _auth
                            .signInWithEmailAndPassword(email, password);

                        if (res.error != null) {
                          _showMyDialog(res.error.description);
                          return;
                        }
                        print(res.response);

                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (Route<dynamic> route) => false);
                      },
                      child: Text('ログイン'),
                      color: primaryColor,
                    ))
              ],
            ),
          ),
        ));
  }
}
