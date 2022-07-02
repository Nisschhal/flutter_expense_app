import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double spendngPctOfTotal;

  // const ChartBar({Key? key}) : super(key: key);

  ChartBar(this.label, this.amount, this.spendngPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * 0.1,
            child: FittedBox(
              child: Text("\$$amount"),
            ),
          ),
          // const SizedBox(height: 4),
          Container(
            height: constraints.maxHeight * 0.7,
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
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(child: Text("${label}")))
        ],
      );
    });
  }
}
