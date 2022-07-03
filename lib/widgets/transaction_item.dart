import "package:flutter/material.dart";

import "package:intl/intl.dart";

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deviceData,
    required this.deleteHandler,
  }) : super(key: key);

  final Transaction transaction;
  final MediaQueryData deviceData;
  final Function deleteHandler;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                  child: Text("\$${transaction.amount}"))),
        ),
        title: Text("\$${transaction.title}"),
        subtitle:
            Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: deviceData.size.width > 500
            ?
            // ignore: deprecated_member_use
            FlatButton.icon(
                icon: Icon(Icons.delete_forever_rounded),
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteHandler(
                 transaction.id,
                ),
                label: const Text("Delete"),
              )
            : IconButton(
                icon: const Icon(Icons.delete_forever_rounded),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteHandler(transaction.id),
              ),
      ),
    );
  }
}
