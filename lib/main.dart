import 'package:expense_tracker/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

 

  final titleController = TextEditingController();
  final amoutnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            width: double.infinity,
            child: Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Text("Here goes chart!!"),
            ),
          ),
          const UserTransaction()
        ],
      ),
    );
  }
}
