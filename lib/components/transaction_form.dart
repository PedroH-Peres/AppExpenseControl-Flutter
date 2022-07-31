import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm(){
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;
    if(title.isEmpty || value <= 0){
      return;
    }

    widget.onSubmit(title, value);
  }

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
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                TextField(
                  controller: valueController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)'
                  ),
                ),
                TextButton(
                  child: Text('Nova Transação', style: TextStyle(color: Colors.deepPurpleAccent),),
                  onPressed: _submitForm, 
                )
              ],
            ),
            )
          )
    );
  }
}