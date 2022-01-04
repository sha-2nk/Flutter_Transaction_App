// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

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
--> 'substring(0, 1)' will give only first character coz it will start at 0 and at 1
--> 'chart.dart' done everything now we just have to creates bar for store the information from 'chart.dart'
--> 'MainAxisAlignment.spaceAround' is used to Align the bars in the whole space avilable for it
--> Every bar has the equal space, so for a very large dits of amount there will be disturbance in allignment,
    so here we use 'Flexible', with 'FlexFit.tight' we force a child onto its assigned width and size, but this would 
    shrinken the line of bar so we have to take care of taht.
--> 'FittedBox' in chart_bar.dart would take care of that, it would shrink the amount 
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

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'] as String,
                data['amount'] as double,
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
