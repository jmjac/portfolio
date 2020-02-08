import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:charts_flutter/flutter.dart' as Charts;

class BlackRockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlackRockStore blackRockStore = BlackRockStore();
    blackRockStore.loadLinearGraphData();
    blackRockStore.loadPieChartData();

    return Scaffold(
      body: Center(
          child: Column(children: [
        Text("Portfolio"),
//        SizedBox(
//          height: 200,
//          width: 200,
//          child: Observer(
//              builder: (_) => Charts.TimeSeriesChart(
//                    blackRockStore.seriesPerMonth,
//                    animate: true,
//                  )),
//        ),
        SizedBox(
          height: 250,
          width: 250,
          child: Observer(
              builder: (_) => Charts.PieChart(blackRockStore.pieChartData,
                  animate: true,
                  defaultRenderer: Charts.ArcRendererConfig(
                      arcWidth: 60,
                      arcRendererDecorators: [Charts.ArcLabelDecorator()]))),
        )
      ])),
    );
  }
}
