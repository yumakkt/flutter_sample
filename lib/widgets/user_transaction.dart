import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_list.dart';
import './new_tramsaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル1',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル2',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル3',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル4',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル1',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル2',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル3',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル4',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル1',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル2',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル3',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル4',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル1',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル2',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル3',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル4',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル1',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル2',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル3',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル4',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル1',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル2',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル3',
        amount: 999,
        date: DateTime.now()),
    Transaction(
        id: 'ksalskdjfaksjflk1',
        title: 'タイトル4',
        amount: 999,
        date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    var nowDate = DateTime.now();
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: nowDate,
        id: nowDate.toString());
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(addNewTx: _addNewTransaction),
      TransactionList(transactions: _transactions)
    ]);
  }
}
