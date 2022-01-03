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
--> 'FittedBox' widget forced its child into the avilable space and if the child is text, it shrinks the text
--> 'Text(label)' is used to display the weekdays
--> 'LayoutBuilder' tskes an argument builder() which gives 2 argument 1 is 'context' and 2nd is 'constraints',
    'context' is self call be flutter, 'constraints' define how a widget is render on the screen, it takes height and width
--> By 'constraints' we can dynamically calculate the height and width of elements inside that widget, 
    by constraints.maxHeight and constraints.maxWidth we will get the max height avilable for it,
    and we can devide into fractions which all add up to 1.
*/

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: constraints.maxWidth,
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
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            child: FittedBox(child: Text(label)),
            height: constraints.maxHeight * 0.15,
          ),
        ],
      );
    });
  }
}
