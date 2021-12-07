// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:expenses/widgets/new_transaction.dart';
import 'package:expenses/widgets/transactions_list.dart';
import '../models/transactions.dart';

/*
--> To add the the details of new Transctions '_addNewTx' function is defined
--> '_addNewTx' will take input as parameter, here the inputs are amount and title
--> To add the new Transaction and reflect it on UI setState is used which is inside the '_addNewTx'
--> 'add' is a method we can call on a List to add a new elemnt to that List,
    so that will change the existing List.
--> To ensure that new Transaction will reflect on 'onPressed' we have to pass '_addNewTx' to the 'onPressed'.
    But '_addNewTx' is a private function which can't be directly use in other file.
--> So, we will pass it through 'NewTransaction' without (), if we put () it will immediately execute it,
    without () we just pass down the pointer, to accept this pointer we define a Function 'addTX' in 'new_transaction.dart'
*/

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTx),
        TransactioList(_userTransactions)
      ],
    );
  }
}
