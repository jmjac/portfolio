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
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                color: const Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: flCharts.LineChart(
                mainData(),
              ),
            ),
        )
      ])),
    );
  }
}
