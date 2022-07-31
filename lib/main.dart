
import 'package:expenses/components/transaction_user.dart';
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
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Despesas pessoais"), backgroundColor: Colors.deepPurpleAccent,),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              elevation: 5, 
              color: Colors.deepPurpleAccent,
              child: Text("Gráfico"),
            )
          ),
          const TransactionUser()
        ],
      ),
    );
  }
}