import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/black_rock/black_rock_page.dart';
import 'package:portfolio/investments/store/investment_store.dart';
import 'package:provider/provider.dart';

class InvestmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InvestmentStore investmentStore = Provider.of<InvestmentStore>(context);
    investmentStore.calculateChange();
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300,
          child: Container(
            color: Colors.amber,
            width: 10000,
            child: Column(
              children: [
                Observer(
                  builder: (_) => Padding(
                      padding: EdgeInsets.only(top: 51.0),
                      child: Text(
                          "\$${investmentStore.totalGain.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 48))),
                ),
                Observer(
                  builder: (_) => Text(
                      "\$${investmentStore.monthChange.toStringAsFixed(2)} this month"),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                        width: 280,
                        height: 54,
                        child: FlatButton(
                          child: Text(
                            "DETAILS",
                            style: TextStyle(fontSize: 24),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, "home/portfolio");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0)),
                        ))),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Text(
                  "My Investments",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
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
