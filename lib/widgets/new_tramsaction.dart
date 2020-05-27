import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function addNewTx;

  NewTransaction({this.addNewTx});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'タイトル'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: '価格'),
                controller: amountController,
              ),
              FlatButton(
                child: Text('決定！'),
                textColor: Colors.purple,
                onPressed: () {
                  addNewTx(titleController.text,
                      double.parse(amountController.text));
                },
              )
            ],
          )),
    );
  }
}
