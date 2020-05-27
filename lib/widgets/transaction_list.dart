import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) => Container(
    height: 300,
    child: ListView.builder(
          itemBuilder: (BuildContext ctxt, int index) {
            final t = transactions[index];
            return Card(
              child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2.0)),
                  child: Text(
                    "\$ ${t.amount.toString()}",
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(t.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(DateFormat().format(t.date),
                      style: TextStyle(fontSize: 12)),
                ])
              ]),
            );
          },
          itemCount: transactions.length,
        ),
  );
}
