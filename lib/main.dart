import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  final _transactions = [
    Transaction(id: 't1', title: 'Novo Tenis', value: 310, date: DateTime.now()),
    Transaction(id: 't2', title: 'Novo celular', value: 920, date: DateTime.now())
  ];
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
          Column(
            children: _transactions.map((tr){
              return Card(
                elevation: 2,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                        color: Colors.deepPurpleAccent, 
                        width: 2
                        )
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepPurpleAccent
                        ),
                        ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(tr.date.toString(), style: TextStyle(color: Colors.grey),)
                      ],
                    )
                  ],
                )
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}