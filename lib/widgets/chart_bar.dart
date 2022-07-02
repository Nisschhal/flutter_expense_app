import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double spendngPctOfTotal;

  // const ChartBar({Key? key}) : super(key: key);

  ChartBar(this.label, this.amount, this.spendngPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text("\$$amount"),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
              heightFactor: spendngPctOfTotal,
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10))),
            )
          ]),
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(height: 4),
        Text("${label}")
      ],
    );
  }
}
