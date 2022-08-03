import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm(){
    final title = titleController.text;
    final valorControl = valueController.text.replaceAll(',', '.');
    final value = double.tryParse(valorControl) ?? 0;
    if(title.isEmpty || value <= 0 || _selectedDate == null){
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Text(_selectedDate == null 
                      ? 'Nenhuma data selecionada'
                      : 'Data: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                      ),
                      TextButton(
                        child: Text('Selecionar Data', 
                        style: TextStyle(color: Colors.deepPurpleAccent),),
                        onPressed: _showDatePicker, 
                        
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                    child: Text('Nova Transação', style: TextStyle(color: Colors.white),),
                    onPressed: _submitForm, 
                  )
                ],)
              ],
            ),
            )
          )
    );
  }
}