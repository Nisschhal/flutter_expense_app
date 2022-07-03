import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userList;
  final Function deleteHandler;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.userList, this.deleteHandler);

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context);
    // ignore: sized_box_for_whitespace
    return userList.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  "No transactions yet!!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            );
          })
        : ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TransactionItem(
                  transaction: userList[index],
                  deviceData: deviceData,
                  deleteHandler: deleteHandler);
            },
            itemCount: userList.length,
          );
  }
}
