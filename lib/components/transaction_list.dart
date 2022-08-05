import 'package:expenses/components/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onRemove;
  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty 
      ?LayoutBuilder(
        builder: (ctx, constraints){
          return Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.1),
              Text('Nenhuma transação cadastrada!', style: TextStyle(color: Colors.grey),),
              SizedBox(height: constraints.maxHeight * 0.1),
              Container( height: constraints.maxHeight * 0.6,
                child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover, color: Colors.grey,))
            ],
         );
        } 
      )
      
    :ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return TransactionItem(tr: tr, onRemove: onRemove);
      },
    );
  }
}

