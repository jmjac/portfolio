import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:charts_flutter/flutter.dart' as Charts;
import 'package:portfolio/settings/store/settings.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart' as flCharts;

class BlackRockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlackRockStore blackRockStore = Provider.of<BlackRockStore>(context);
    blackRockStore.loadPieChartData();
    blackRockStore.mainData();

    return Scaffold(
        appBar: AppBar(
          title: Text("Portfolio Summary"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Observer(
                  builder: (_) => Charts.PieChart(blackRockStore.pieChartData,
                      animate: true,
                      defaultRenderer: Charts.ArcRendererConfig(
                          arcWidth: 60,
                          arcRendererDecorators: [
                            Charts.ArcLabelDecorator()
                          ]))),
            ),
            Observer(
              builder: (_) => Container(
                  child: Column(children: [
                Text("Total Profit: \$" + "${blackRockStore.profit}", style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 2, top: 24, bottom: 12),
                  child: flCharts.LineChart(
                    blackRockStore.lineChartData,
                  ),
                )
              ])),
            )
          ])),
        ));
  }
}
