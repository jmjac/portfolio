import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/investments/store/investment_store.dart';

class InvestmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InvestmentStore investmentStore = InvestmentStore();
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300,
          child: Container(
            color: Colors.amber,width: 10000,
            child: Column(
              children: [
                Text("\$${0.00}", style: TextStyle(fontSize: 48)),
                Text("this month"),
                FlatButton(
                  child: Text("DETAILS",),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => Column(children: [
            ListTile(
                title:
                    Text("${investmentStore.portfolio.positionsNames[index]}"),
                subtitle: Text(
                    "${investmentStore.portfolio.positionsMap[investmentStore.portfolio.positionsNames[index]]}")),
            Divider(
              height: 0,
            )
          ]),
          itemCount: investmentStore.portfolio.positionsNames.length,
        )),
      ],
    );
  }
}
