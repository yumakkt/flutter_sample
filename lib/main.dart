import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './widgets/new_tramsaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() async {
  // 日本語による日付表示の設定
  Intl.defaultLocale = 'ja_JP';
  runApp(MyAppTop());
}

class MyAppTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEMO APP KUKITA',
      home: MyApp(),
      theme: ThemeData(
          // swatchはshadeも自動で生成してくれるらしい
          primarySwatch: Colors.pink,
          fontFamily: 'Quicksand'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en"),
        const Locale("ja"),
      ],
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addNewTx: _addNewTransaction);
        });
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        id: selectedDate.toString());
    setState(() {
      _transactions.add(newTx);
    });
  }

  void _deleteTransaction(Transaction targetTransaction) {
    setState(() {
      _transactions
          .removeWhere((transaction) => transaction.id == targetTransaction.id);
    });
  }

  List<Transaction> get _recentTransaction {
    return _transactions
        .where(
            (t) => t.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final appBar = AppBar(
      title: Text('DEMO APP KUKITA', style: TextStyle(color: primaryColor)),
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context))
      ],
    );
    return Scaffold(
      appBar: appBar,
      // 画面スクロールを設定する。これがないとテキスト入力とかで隠れてしまう
      // ListViewを使うとchildren(配列)を入れることができる
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            // decoration: BoxDecoration(color: Colors.pink),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.4,
                      child: Chart(_recentTransaction)),
                  Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.6,
                      child: TransactionList(
                          transactions: _transactions,
                          onDelete: _deleteTransaction))
                ])),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
