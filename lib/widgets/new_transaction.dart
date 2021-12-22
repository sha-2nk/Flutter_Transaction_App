// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_null_comparison

import 'package:intl/intl.dart';
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
--> To accept the date we have to add a date picker, so created a function '_datePicker' which take inbuilt 'showDatePicker'
    to pop up the calender to pick yhe date.
--> Then we had passed the funcion '_datepicker' in onpressed of the button used for it without () because
    we  just want to pass a refenrence so that this is called by the button when it is pressed.
--> By 'showDatePicker()' we just open the calender to pick the date but we can't save it for future,
    so we ahve to use 'then()' method in 'showDatePicker()', then will triggered when the user picked up a date
--> We created a method '_selectedDate' which will take date everytime so it is not final, it is of DateTime attribute
--> We made '_selectedDate' equals to 'pickedDate' and put it in 'setstate' to reflect in UI 
--> Now we have to add date in transactions, so we firstly take '_selectedDate' in widget.addTx, now accept an argument
    fo date in function '_addNewTx()' in main.dart
*/

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amtController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitData() {
    final enteredtitle = _titleController.text;
    final enteredamt = double.parse(_amtController.text);

    if (enteredtitle.isEmpty || enteredamt <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredtitle,
      enteredamt,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime(2022))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              style: TextStyle(fontWeight: FontWeight.w600),
              controller: _titleController,
              onSubmitted: (value) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              style: TextStyle(fontWeight: FontWeight.w600),
              controller: _amtController,
              keyboardType: TextInputType.number,
              onSubmitted: (value) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Data: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.blueGrey[900]),
                    onPressed: _datePicker,
                    child: Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  primary: Colors.purple[800],
                  backgroundColor: Colors.pink[50],
                  textStyle:
                      TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            )
          ],
        ),
      ),
    );
  }
}
