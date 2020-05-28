import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction({this.addNewTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    
    // StatefulWidgetへのpropにアクセスする。
    widget.addNewTx(
        enteredTitle,
        enteredAmount
    );

    Navigator.of(context).pop();
  }

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
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                child: Text('決定'),
                textColor: Theme.of(context).primaryColor,
                onPressed: submitData,
              )
            ],
          )),
    );
  }
}
