import 'package:flutter/material.dart';

import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transactions,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
      elevation: 7,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          foregroundColor: Colors.deepPurple[900],
          backgroundColor: Colors.red[100],
          child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('\$${transactions.amount}'))),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_rounded),
          color: Colors.red[900],
          onPressed: () => deleteTx(transactions.id),
        ),
        title: Text(
          transactions.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions.date),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
