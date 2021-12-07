// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_const_constructors

import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
--> '$' is a keyword (reserved key) in Dart is used for interpolation of any value as here we are doing string interpolation
--> To use any reserved key as a chracter we have to use '\' as '\$'
--> import 'package:intl/intl.dart'; is used here to validate the 'DateFormat()'
--> 'DateFormat()' is used to get a convienient form of Date and timme instead of just in string form
--> 'TextField()' is used to get the Text input from the user
--> 'onfield' is called when the user initiates a change to the TextField's value: when they have inserted or deleted text.
*/

class TransactioList extends StatelessWidget {
  final List<Transaction> transctions;

  TransactioList(this.transctions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transctions.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.indigo),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.teal,
                  width: 2,
                )),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(250, 75, 50, 110)),
                  ),
                  Text(DateFormat().format(tx.date),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(250, 150, 50, 110),
                      )),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
