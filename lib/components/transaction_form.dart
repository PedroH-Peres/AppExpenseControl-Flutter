import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
            elevation: 4,
            child: Padding( padding: EdgeInsets.all(10),
              child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                TextField(
                  controller: valueController,
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)'
                  ),
                ),
                TextButton(
                  child: Text('Nova Transação', style: TextStyle(color: Colors.deepPurpleAccent),),
                  onPressed: (){
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0;
                    onSubmit(title, value);
                  }, 
                )
              ],
            ),
            )
          )
    );
  }
}