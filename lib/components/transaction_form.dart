import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_datepicker.dart';
import 'package:expenses/components/adaptative_textfield.dart';
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

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView (child: Card(
            elevation: 4,
            child: Padding( padding: EdgeInsets.only(top: 8, right: 10, left: 10, bottom: 10+ MediaQuery.of(context).viewInsets.bottom),
              child: Column(
              children: [
                AdaptativeTextField(
                  controller: titleController, 
                  onsubmit: (_) => _submitForm(), 
                  label: 'Título',
                ),
                AdaptativeTextField(
                  controller: valueController,
                  keyboardtype: TextInputType.numberWithOptions(decimal: true), 
                  onsubmit: (_) => _submitForm(), 
                  label: 'Valor (R\$)',
                ),
                AdaptativeDatePicker(selectedDate: _selectedDate, onDateChange: (newDate){
                  setState(() {
                    _selectedDate = newDate;
                  });
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButton(
                      label: 'Nova Transação',
                      onPressed: _submitForm,
                    )
                    
                ],)
              ],
            ),
            )
          )
      )
    );
  }
}