
import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _showChart = false;

  List<Transaction> get _recentTransactions{
    return _transactions.where((tr){
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String titulo, double valor, DateTime data){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: titulo,
      value: valor,
      date: data
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id){
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
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
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
        title: Text("Despesas pessoais - By: PPeres",
        style: TextStyle(fontSize: 18 * mediaQuery.textScaleFactor, ),
        ), 
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white,), 
            onPressed: () => _openTransactionForm(context),
          ),
          if(isLandscape)
          IconButton(
            icon: Icon(_showChart ? Icons.list : Icons.bar_chart), 
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
          )
        ],
      );

    final availableHeight = mediaQuery.size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_showChart || !isLandscape) 
            Container(height: availableHeight * (isLandscape ? 0.8 : 0.25 ),
            child: Chart(_recentTransactions)),
            if(!_showChart || !isLandscape) 
              Container(
                alignment: Alignment.center,
              height: availableHeight * 0.75,
              child: TransactionList(_transactions, _removeTransaction)),            
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