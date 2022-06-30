// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addHandler;

  NewTransaction(this.addHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitDate() {
    final enteredTitle = titleController.text;
    final eneteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || eneteredAmount < 0) {
      return;
    }

    widget.addHandler(
        titleController.text, double.parse(amountController.text));

    Navigator.of(context).pop();
  }

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
              // onSubmitted: (_) => submitDate(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitDate(),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.purpleAccent,
                  // ignore: prefer_const_constructors
                  side: BorderSide(
                    color: Colors.purple,
                  )),
              onPressed: submitDate,
              child: const Text("Add Transaction"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 20,
                  // primary: Colors.purpleAccent,
                  side: const BorderSide(
                    color: Colors.purple,
                  )),
              // primary: Colors.purple,
              onPressed: submitDate,
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
