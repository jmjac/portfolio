import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvestmentAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Add new investement"),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text("STOCK TICKER:"),
          SizedBox(child: Container(child: TextFormField())),
        ],
      ),
    );
  }
}
