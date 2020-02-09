import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/black_rock/black_rock_page.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:portfolio/investments/investment_add_page.dart';
import 'package:portfolio/investments/store/investment_store.dart';
import 'package:provider/provider.dart';

class InvestmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InvestmentStore investmentStore =
        Provider.of<InvestmentStore>(context);
    final BlackRockStore blackRockStore = Provider.of<BlackRockStore>(context);

    // investmentStore.calculateChange();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              decoration:
                  BoxDecoration(boxShadow: [BoxShadow(blurRadius: 10.0)]),
              child: SizedBox(
                height: 300,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  width: 10000,
                  child: Column(
                    children: [
                      Observer(
                        builder: (_) => Padding(
                            padding: EdgeInsets.only(top: 51.0),
                            child: Text(
                                "\$${investmentStore.monthChange.toStringAsFixed(2)} this month",
                                style: TextStyle(fontSize: 35))),
                      ),
                      // Observer(
                      //   builder: (_) => Text(
                      //       "\$${investmentStore.monthChange.toStringAsFixed(2)} this month"),
                      // ),
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
                                  Navigator.pushNamed(
                                      context, "home/portfolio");
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                              ))),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Text(
                        "My Investments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      )
                    ],
                  ),
                ),
              )),
          Expanded(
              child: ListView.builder(
            itemCount: investmentStore.portfolio.positionsNames.length,
            itemBuilder: (context, index) => Dismissible(
                background: Container(color: Colors.red),
                key: UniqueKey(),
                onDismissed: (_) {
                  Map<String, double> positions =
                      investmentStore.portfolio.positionsMap;
                  investmentStore.setAddToInvestment(0 - positions[investmentStore.portfolio.positionsNames[index]]);
                  investmentStore.addToInvestment();
                  positions
                      .remove(investmentStore.portfolio.positionsNames[index]);
                  investmentStore.portfolio.positionsNames.removeAt(index);
                  investmentStore.portfolio.changePositions(positions);
                  investmentStore.portfolio.getReturnsMap();
                  blackRockStore.mainData();
                  // investmentStore.calculateChange();
                },
                child: Column(children: [
                  ListTile(
                      key: UniqueKey(),
                      title: Text(
                          "${investmentStore.portfolio.positionsNames[index]}"),
                      subtitle: Text(
                          "\$${investmentStore.portfolio.positionsMap[investmentStore.portfolio.positionsNames[index]]}")),
                  Divider(
                    height: 0,
                  )
                ])),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 50,
        ),
        tooltip: "Add new stock to follow :D",
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InvestmentAddPage()));
        },
      ),
    );
  }
}
