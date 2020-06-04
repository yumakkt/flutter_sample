import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget child;

  DefaultScaffold(this.child);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('承認欲求うるおいあぷり', style: TextStyle(color: primaryColor)),
        backgroundColor: Colors.white,
      ),
      body: Center(child: child),
    );
  }
}
