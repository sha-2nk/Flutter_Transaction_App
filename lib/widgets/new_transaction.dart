// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

/*
--> 'TextEditingController()' is a controller for an editable text field.Whenever the user modifies a text field with an associated TextEditingController,
    the text field updates value. A 'TextEditingController' can also be used to provide an initial value for a text field.
--> To accept pointer 'addNewTx' from 'user_transaction', 'addTx' function is created.
--> Now 'addTx' should be set with the help of constructer of 'NewTransaction', because we are passing something to the constructer in 'user_transaction.dart'
--> Now 'addTx' is used as a pointer function in 'onPressed' which will take paarmetrs as the value of 'title' and 'amount'
--> Text always returns a string, so we convert it to the double as double.parse().
*/

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amtController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amtController,
            ),
            TextButton(
              onPressed: () {
                addTx(titleController.text, double.parse(amtController.text));
              },
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  primary: Colors.purple[800],
                  textStyle:
                      TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            )
          ],
        ),
      ),
    );
  }
}
