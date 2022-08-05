import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdaptativeDatePicker extends StatelessWidget {

  final DateTime selectedDate;
  final Function (DateTime) onDateChange;

  const AdaptativeDatePicker({Key? key, required this.selectedDate, required this.onDateChange}) : super(key: key);

  _showDatePicker(BuildContext context){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      onDateChange(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? Container(
      height: 180,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime.now(),
        minimumDate: DateTime(2019),
        maximumDate: DateTime.now(),
        onDateTimeChanged: onDateChange,
        ),
    )
    : Container(
        height: 70,
        child: Row(
          children: [
            Text(selectedDate == null 
            ? 'Nenhuma data selecionada'
            : 'Data: ${DateFormat('dd/MM/y').format(selectedDate)}',
            ),
            TextButton(
              child: Text('Selecionar Data', 
              style: TextStyle(color: Colors.deepPurpleAccent),),
              onPressed: () => _showDatePicker(context),    
            )
          ],
        ),
      );
  }
}