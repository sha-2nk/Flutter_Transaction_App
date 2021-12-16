// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

/*
--> 'spendingPctOfTotal' is the spending percentage of total cost,
    which will helped to fill the colors in bars accordingly
--> '.toStringAsFixed(0)' is used to remove the decimal places in amount
--> 'Stack' widget allows to place elemnts on top of each other in 3-D space, like overlapping eachother.
--> Inside 'Stack' we have 'container' in starting and 'FractionallySizedBox' after that.
--> 'FractionallySizedBox' this allows to create a box that is sized as a fraction of another value.
    'heightFactor:' tkes the height from 0 to 1, at 1 it eill takes the height of parent 'container' (here 60),
    but we wants height according to the spendings so we use 'spendingPctOfTotal'
--> 'Text(label)' is used to display the weekdays
*/

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
