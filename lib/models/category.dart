import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  // final double amount;
  // final DateTime date;

  const Category(
      {@required this.id,
      // @required this.amount,
      @required this.color = Colors.pink,
      @required this.title});
}
