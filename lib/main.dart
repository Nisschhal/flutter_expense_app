// ignore_for_file: deprecated_member_use

import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transactions_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.blue[50],
        // fontFamily: 'OpenSans',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //       headline6: const TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontSize: 18,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: "OpenSans",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  final amoutnController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(id: "01", title: "Shoe", amount: 1200, date: DateTime.now()),
    // Transaction(id: "02", title: "Shirt", amount: 120, date: DateTime.now()),
    // Transaction(id: "03", title: "Watch", amount: 12, date: DateTime.now()),
    // Transaction(id: "04", title: "Bag", amount: 1, date: DateTime.now()),
  ];

  // getter, gives the recent transactions of last 7 days

  List<Transaction> get _getRecentTransaction {
    // only return the transactions from userTransactions list which passes the isAfter() test
    return _userTransactions.where((tx) {
      // check the each transactions from the list and if the date is equal to last 7 day from now
      // then a transactions passes the condition and return that transaciton
      return tx.date.isAfter(
        // subtract the 7 days from now
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList(); // once the list is generated it return the where iterable value not list
    // to make them into list use toList() same like in map iterable
  }

// create the new transaction and add it into list.
  void _addNewTransaction(String txTitle, double txAmount, DateTime dateTime) {
    // creates the new object/instance of the Transaction class and passes the data into parameter
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: dateTime);
    // updaing the list value since it is stateful widget
    setState(() {
      // adding the new list into the totalTransactions list
      _userTransactions.add(newTx);
      print("Working fine");
    });
  }

  void _deleteTransactions(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          // making sure that only certain type of gesture or tap/touch works in the particular widget

          return GestureDetector(
            onTap: () {},
            // wigets inside the showModalBottonSheet()
            // it passes the _addNewTransaction fuction address which gets triger when task is compeleted
            child: NewTransaction(_addNewTransaction),
            // makinc sure that on the widgets nothing happes when touch/tap however, if touched/tapped outside the widget it gets closed
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  bool _showChart = false;

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txtList) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Show Chart:"),
          Switch(
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = !_showChart;
              });
            },
          ),
        ],
      ),
      _showChart
          ? Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: Chart(_getRecentTransaction),
            )
          : txtList,
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txtList) {
    return [
      Center(
          child: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.25,
            child: Chart(_getRecentTransaction),
          ),
          txtList
        ],
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text("Expense Tracker"),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _startNewTransaction(context),
        ),
      ],
    );
    final txtList = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.75,
        child: Container(
            child: TransactionList(_userTransactions, _deleteTransactions)));
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ignore: avoid_unnecessary_containers

            // if the orientation is in landscape
            if (isLandScape)
              ..._buildLandscapeContent(mediaQuery, appBar, txtList),

            // if the device is not in landscape
            if (!isLandScape)
              ..._buildPortraitContent(mediaQuery, appBar, txtList),

            // Center(
            //   child: Container(
            //     padding: const EdgeInsets.all(6),
            //     margin: const EdgeInsets.all(5),
            //     decoration: const BoxDecoration(
            //         border: Border(
            //             bottom:
            //                 BorderSide(width: 2, color: Colors.purpleAccent))),
            //     child: const Text(
            //       "Recent Expenses",
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.purple,
            //         fontStyle: FontStyle.italic,
            //       ),
            //       // textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
