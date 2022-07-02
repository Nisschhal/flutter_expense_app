import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userList;
  final Function deleteHandler;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.userList, this.deleteHandler);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return userList.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  "No transactions yet!!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            );
          })
        : ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text("\$${userList[index].amount}"))),
                  ),
                  title: Text("\$${userList[index].title}"),
                  subtitle:
                      Text(DateFormat.yMMMd().format(userList[index].date)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteHandler(userList[index].id),
                  ),
                ),
              );
            },
            itemCount: userList.length,
          );
  }
}
