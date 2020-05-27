import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import './widgets/user_transaction.dart';

void main() async {
  // 日本語による日付表示の設定
  Intl.defaultLocale = 'ja_JP';
  await initializeDateFormatting('ja_JP');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('でもアプリ', style: TextStyle(color: Colors.blue)),
              backgroundColor: Colors.white,
            ),
            // 画面スクロールを設定する。これがないとテキスト入力とかで隠れてしまう
            // ListViewを使うとchildren(配列)を入れることができる
            body: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 20.0),
                  decoration: BoxDecoration(color: Colors.blue[500]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.black26,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            '横幅マックスの書き方',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                            children: ['a', 'b', 'c']
                                .map((x) => Card(
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(x))))
                                .toList()),
                        Row(
                            children: ['d', 'e', 'f']
                                .map((x) => Card(
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(x))))
                                .toList()),
                        UserTransaction()
                      ])),
            )));
  }
}
