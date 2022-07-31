
import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

main(){
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(home: HomePage(),
      theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(primary: Colors.deepPurpleAccent, secondary: Colors.amber
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold, color: Colors.black
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: 'Quicksand', fontSize: 20, fontWeight: FontWeight.bold)
        ),
      )
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  _addTransaction(String titulo, double valor){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: titulo,
      value: valor,
      date: DateTime.now()
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }
  
  _openTransactionForm(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas pessoais"), 
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white,), 
            onPressed: () => _openTransactionForm(context),
          )
        ],
      ),
    
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              elevation: 5, 
              color: Colors.deepPurpleAccent,
              child: Text("Gráfico"),
            )
          ),
          Column(
        children: [
          TransactionList(_transactions),
      ],
    )
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionForm(context),
      ) ,
    );
  }
}