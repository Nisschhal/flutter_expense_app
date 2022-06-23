// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addHandler;

  // ignore: use_key_in_widget_constructors
  NewTransaction(this.addHandler);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            FlatButton(
              onPressed: () => addHandler(
                  titleController.text, double.parse(amountController.text)),
              textColor: Colors.purple,
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
