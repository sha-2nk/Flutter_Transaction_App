// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:expenses/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

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
--> To make the overall content scrollable  we have to use 'SingleChildScrollView()'
    i.e, just wrap the content in the SingleChildScrollView() widget

*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //late String
  //  titleInput; // while using late before variables make sure that, variable must be initialized later
  //late String amtInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Expenses'),
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
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
