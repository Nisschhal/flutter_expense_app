// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addHandler;

  NewTransaction(this.addHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  DateTime? _selectedDate;
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitDate() {
    final enteredTitle = titleController.text;
    final eneteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || eneteredAmount < 0 || _selectedDate == null) {
      return;
    }

    widget.addHandler(titleController.text, double.parse(amountController.text),
        _selectedDate);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
              Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? "No Date choosen"
                        : "Picked Date: ${DateFormat.yMd().format(_selectedDate!)}"),
                  ),
                  TextButton(
                    // style: OutlinedButton.styleFrom(
                    //     side: BorderSide(color: Theme.of(context).primaryColor)),
                    onPressed: _showDatePicker,
                    child: Text("Choose a Date",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
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
      ),
    );
  }
}
