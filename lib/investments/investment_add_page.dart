import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:portfolio/investments/store/investment_add_store.dart';
import 'package:provider/provider.dart';

class InvestmentAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InvestmentAddStore investmentAddStore =
        Provider.of<InvestmentAddStore>(context);
    final BlackRockStore blackRockStore = Provider.of<BlackRockStore>(context);

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 8.0),
                  child: Text("STOCK TICKER:")),
              SizedBox(
                  child: Container(
                      padding: EdgeInsets.only(left: 12),
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText:
                                "Abbriviation used to identify the comapny e.g APPL"),
                        onChanged: (String value) => investmentAddStore
                            .setCompanyTicker(value.toUpperCase()),
                      ))),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 12, bottom: 8.0),
                child: Text("COMAPNY NAME:"),
              ),
              SizedBox(
                  width: 600,
                  child: Container(
                      padding: EdgeInsets.only(left: 12),
                      color: Colors.white,
                      child: Observer(
                          builder: (_) => Text(
                                "${investmentAddStore.companyName}",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              )))),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefix: Text("\$ "),
                          labelText: "The price of the stock",
                          hintText: "Initial amount of money invested"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) =>
                          investmentAddStore.setPrice(double.parse(value)),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ])),
              Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefix: Text("\% "),
                          labelText: "Quantity purchased",
                          hintText:
                              "How big part of your portfolio is this new stock"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) => investmentAddStore.setPercentage(double.parse(value)),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ])),
              Padding(
                  padding: EdgeInsets.all(24.0),
                  child: SizedBox(
                      width: 500,
                      height: 40,
                      child: RaisedButton(
                        child: Text("Done"),
                        color: Colors.black,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onPressed: () {
                          bool success = investmentAddStore
                              .validateAndSubmit(blackRockStore);
                          if (success) {
                            Navigator.pop(context);
                          }
                        },
                      ))),
            ],
          ),
        ));
  }
}
