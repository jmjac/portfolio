import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvestmentAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "Add new investement",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Padding(
              padding: EdgeInsets.only(left: 12, bottom: 8.0),
              child: Text("STOCK TICKER:")),
          SizedBox(
              child: Container(color: Colors.white, child: TextFormField())),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 12, bottom: 8.0),
            child: Text("COMAPNY NAME:"),
          ),
          SizedBox(width: 600,
              child: Container(color: Colors.white, child: Text("", style: TextStyle(fontSize: 24),))),
        ],
      ),
    );
  }
}
