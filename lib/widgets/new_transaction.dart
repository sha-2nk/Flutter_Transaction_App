// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

/*
--> 'TextEditingController()' is a controller for an editable text field.Whenever the user modifies a text field with an associated TextEditingController,
    the text field updates value. A 'TextEditingController' can also be used to provide an initial value for a text field.
--> To accept pointer 'addNewTx' from 'user_transaction', 'addTx' function is created.
--> Now 'addTx' should be set with the help of constructer of 'NewTransaction', because we are passing something to the constructer in 'user_transaction.dart'
--> Now 'addTx' is used as a pointer function in 'onPressed' which will take paarmetrs as the value of 'title' and 'amount'
--> Text always returns a string, so we convert it to the double as double.parse().
--> 'keyboardType: TextInputType.' gives flexibility to choose what type of keybord should appear for data insertion,
    here we had used number keyboard for amount entering
--> Assigning 'titleController' and 'amtController' to 'enteredtitle' and 'enteredamt' respectively
--> When the 'if()' condition becomes true the further function 'will not execute'
--> 'NewTransaction' is changed from stateless to statefull widget beacuse we lost our input data after re-evaluation in stateless widget
--> In statefull widget data stored in previous state will not lost if the widget  that belongs to it is re-evalueated
--> By 'widget.' we can access the properties and methods of the widget class instead of the state class,
    like with 'widget.addTx' we can access the 'addTx' prperty which has function reference even though we are in different class
--> 'widget.' is only available in stateclass and gives access to the conected widget
--> 'Navigator.of(context).pop()' used to to close the topmost screen that displayed, here it is modelsheet if it is opened
--> By'theme' we can setup a custome theme which will be used globally in the app


*/

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amtController = TextEditingController();

  void submitData() {
    final enteredtitle = titleController.text;
    final enteredamt = double.parse(amtController.text);

    if (enteredtitle.isEmpty || enteredamt <= 0) {
      return;
    }

    widget.addTx(titleController.text, double.parse(amtController.text));

    Navigator.of(context).pop();
  }

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
              onSubmitted: (value) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amtController,
              keyboardType: TextInputType.number,
              onSubmitted: (value) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
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
