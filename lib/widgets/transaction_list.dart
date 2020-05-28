import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('No Data...',
                    style: Theme.of(context).textTheme.headline4),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                  height: 270,
                  margin: EdgeInsets.only(top: 20),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext ctxt, int index) {
                final t = transactions[index];

                // return Card(
                //   child: Row(children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                //       decoration: BoxDecoration(
                //           border: Border.all(color: primaryColor, width: 2.0)),
                //       child: Text(
                //         "\$ ${t.amount.toStringAsFixed(2)}",
                //         style: TextStyle(fontSize: 20, color: primaryColor),
                //       ),
                //     ),
                //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //       Text(t.title,
                //           style:
                //               TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                //       Text(DateFormat().format(t.date),
                //           style: TextStyle(fontSize: 12)),
                //     ])
                //   ]),
                // );
                return Card(
                    child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: FittedBox(
                          child: Text(
                        "\$${t.amount.toStringAsFixed(2)}",
                      )),
                    ),
                  ),
                  title: Text(t.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text(DateFormat().format(t.date),
                      style: TextStyle(fontSize: 12)),
                ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
