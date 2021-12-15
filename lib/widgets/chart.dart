// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

/*
--> Here we have used statelesswWidget  because we won't need to change and data in there.
--> getters are these properties which are calculated dynamically, here it is used to genrate 
    7 bars for every week day
--> getter 'groupedTransactionValues' will yield List becuase we need 7 bars, in those bars we 
    weekday and corresponding amount, so we have used Map with string and object
--> 'List' has a constructer 'generate' which generates us a new List, and for 'generate' we defined the length,
    and then there would be the function inside which will called for evry element and return the data.
--> Now we need List of out Trnasactions so we used 'List<Transaction>' from model folder.
--> 'DateFormat.E' gives shortcut for week days
--> 'if; loop here is ued to check wether the transaction happened today, this whole part is inside
    the for loop so it will check for all 7 days one by one
*/

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
