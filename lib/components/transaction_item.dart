import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
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
        trailing: MediaQuery.of(context).size.width < 450 
        ? IconButton(
          icon: Icon(Icons.delete), 
          color: Theme.of(context).errorColor,
          onPressed: () => onRemove(tr.id),
        )
        : TextButton.icon(onPressed:() => onRemove(tr.id),icon: Icon(Icons.delete, color: Colors.red,),label: Text('Excluir', style: TextStyle(color: Colors.red),),)
      )
    );
  }
}