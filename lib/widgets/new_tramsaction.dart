import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction({this.addNewTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    // StatefulWidgetへのpropにアクセスする。
    widget.addNewTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    final now = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: now,
      locale: const Locale("ja"),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return SingleChildScrollView(
      child: Card(
        child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'タイトル'),
                  controller: _titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '価格'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'No Date Chosen'
                              : DateFormat.yMd().format(_selectedDate),
                        ),
                      ),
                      FlatButton(
                          onPressed: () {
                            _presentDatePicker();
                          },
                          child: Text(
                            'Choose Date',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('決定'),
                  color: primaryColor,
                  textColor: Colors.white,
                  onPressed: _submitData,
                )
              ],
            )),
      ),
    );
  }
}
