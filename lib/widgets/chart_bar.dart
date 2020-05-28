import 'package:flutter/material.dart';

// import 'package:flutter_sample/models/transaction.dart';
// import '../models/transaction.dart';
// import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Column(children: <Widget>[
      FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
      SizedBox(height: 4),
      Container(
        height: 60,
        width: 12,
        child: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.circular(20))),
            FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20))))
          ],
        ),
      ),
      SizedBox(height: 4),
      Text(label)
    ]);
  }
}
