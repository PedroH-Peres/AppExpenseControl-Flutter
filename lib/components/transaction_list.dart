import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            children: transactions.map((tr){
              return Card(
                elevation: 2,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                        color: Colors.deepPurpleAccent, 
                        width: 2
                        )
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepPurpleAccent
                        ),
                        ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(DateFormat("d MMM  y").format(tr.date), style: TextStyle(color: Colors.grey),)
                      ],
                    )
                  ],
                )
              );
            }).toList(),
          ),
    );
  }
}