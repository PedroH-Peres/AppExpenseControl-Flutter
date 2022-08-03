import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onRemove;
  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      child: transactions.isEmpty ?
        Column(
          children: [
            SizedBox(height: 80,),
            Text('Nenhuma transação cadastrada!', style: TextStyle(color: Colors.grey),),
            SizedBox(height: 40,),
            Container( height: 250,
              child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover, color: Colors.grey,))
          ],
        )
      :ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(3), 
                  child: FittedBox(child: Text('R\$${tr.value.toStringAsFixed(2)}', style: TextStyle(color: Colors.white),)),
                  ),
              ),
              title: Container(alignment: Alignment.centerLeft,height: 28, child: FittedBox(child: Text(tr.title, style: Theme.of(context).textTheme.headline6,)),),
              subtitle: Text(DateFormat('d MMM y').format(tr.date)),
              trailing: IconButton(
                icon: Icon(Icons.delete), 
                color: Theme.of(context).errorColor,
                onPressed: () => onRemove(tr.id),
              ),
            )
          );
        },
      ),
    );
  }
}