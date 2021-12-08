// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:expenses/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transactions.dart';
import 'widgets/transactions_list.dart';

/*
--> 'Column' has main axis Vertical and Cross axis horizontal, and vice-versa for Row
--> In 'Column' we can change the alignment of main axis by calling 'mainAxisAlignment'
    which futher gives the choice for different positions.
--> Cross axis alignment can also be changed by calling 'crossAxisAlignment' which gives different choices.
--> 'Card' is a kind of pre-defined 'Container'
--> 'Card' widget doesn't have anything for width of widget, so we had put 'Card' inside the 'Container'.
--> Here we have put 1 'Card' inside the 'Container' while other is not, 
    so 1 'Card' has parent 'Container' and other has 'Column' as its parent
--> 'Container' gives the flexibility of width, actually it gives all types of styling flexibility
--> 'elevation' inside the 'Card' controls the drop shadow
--> To make the overall content scrollable  we have to use the widget 'SingleChildScrollView()'
    i.e, just wrap the content in the SingleChildScrollView() widget
--> 'actions:' is a List of Widget
--> 'IconButtton' is type of button which returns icon, Icon buttons are commonly used in the AppBar.actions field, but they can be used in many other places as well.
--> Inside the'IconButtton', 'icon' takes positional argument 'Icon' which takes 'Icons' which is a class. 
--> 'FloatingActionButton' is defined under the 'scafflod' section
--> 'floatingActionButtonLocation:' is used to set the loaction of floating Button
--> 'showModelBottemSheet' is used when we tap a button a model sheet should appear from bottem
--> In function 'startAddNewTransaction' we take 'ctx' as argument which will further pass as 'context' in 'showModelBottemSheet'
--> 'builder' is a function that needs to return the widget that should be inside that 'showModalBottomSheet'
--> 'onTap' inside 'Gesture Detector' widget is use to ensure that ModelBottemSheet will not disappear on clicking anywhere on the sheet.
--> 'primarySwatch' is more useful than 'primarycolor' as it generates all the shades of the color
--> Added custom fonts in assets>fonts and make the change in pubsec.yaml file,
    then in main file we change the 'fontfamily' name same as we declare in .yaml file
--> A custom appBarTheme is created, here which will take care of text styling of app bar 
--> Custom theme for rest of the text (except appBar) is also craeted
*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //used to remove the debug banner
      title: 'Daily Expenses',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          secondaryHeaderColor: Colors.redAccent,
          fontFamily: 'Quicksand',
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontStyle: FontStyle.italic))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //late String
  //  titleInput; // while using late before variables make sure that, variable must be initialized later
  //late String amtInput;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void _addNewTx(String title, double amt) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amt,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTx),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Expenses'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment(0.0, 3.0),
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Colors.purple[200],
                child: Text(
                  'CHART',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            TransactioList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
