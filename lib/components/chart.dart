import 'package:expenses/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index ));

      double totalSum = 0.0;
      for(var i = 0; i < recentTransactions.length; i++){
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;
        if(sameDay && sameMonth && sameYear){
          totalSum += recentTransactions[i].value;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
       };
    }).reversed.toList();
  }

  

  double get _weekTotalValue{
    return groupedTransactions.fold(0.0, (sum, tr){
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr){
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['day'] as String,
                value: tr['value'] as double,
                percentage: _weekTotalValue==0 ? 0 :  (tr['value'] as double) / _weekTotalValue,
              )
            );
          }).toList(),
        ),
      ),
      
    );
  }
}