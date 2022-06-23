import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userList;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.userList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userList.map(
        (tx) {
          return Card(
            child: Row(
              children: [
                Container(
                  width: 80,
                  padding: const EdgeInsets.all(2),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "Rs.${tx.amount.toString()}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    tx.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ]),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
