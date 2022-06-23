import '../models/transaction.dart';
import './new_transaction.dart';
import './transactions_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "01", title: "Shoe", amount: 1200, date: DateTime.now()),
    Transaction(id: "02", title: "Shirt", amount: 120, date: DateTime.now()),
    Transaction(id: "03", title: "Watch", amount: 12, date: DateTime.now()),
    Transaction(id: "04", title: "Bag", amount: 1, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
      print("Working fine");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
