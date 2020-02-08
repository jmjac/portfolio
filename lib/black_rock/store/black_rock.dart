import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/black_rock/black_rock_api_performence.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';
import 'package:charts_flutter/flutter.dart' as Charts;

part 'black_rock.g.dart';

class BlackRockStore extends _BlackRockStore with _$BlackRockStore {
  BlackRockStore(BlackRockAPIPortfolio portfolio) : super(portfolio);
}

abstract class _BlackRockStore with Store {
  _BlackRockStore(this.portfolio);

  BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(positions: {
    "PMADX": 24.38,
    "PBEAX": 333.79,
    "SUWBX": 44.76,
    "CATNX": 300.49,
    "AAPL": 100.00,
  });
  BlackRockAPIPerformance performance;

  double initialInvestment = 10000.0;

  @observable
  double monthChange = 0;

  @observable
  List<Charts.Series<DataPoint, DateTime>> seriesPerMonth = [];

  @observable
  List<Charts.Series<PieChartHolding, String>> pieChartData = [];

  // Uses level from resultsMap to calculate the portfolio performance per month
  // and convert it to LineSeries to feed to graph

  void loadLinearGraphData() async {
    Map<String, dynamic> returnsMap = await portfolio.getReturnsMap();
    List<DataPoint> data = [];
    for (String date in returnsMap.keys) {
      data.add(DataPoint(
          int.parse(date), returnsMap[date]["level"] * initialInvestment));
    }
    data.removeLast();
    seriesPerMonth = [
      Charts.Series<DataPoint, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => Charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DataPoint point, _) =>
            DateTime.fromMicrosecondsSinceEpoch(point.data),
        measureFn: (DataPoint point, _) => point.value,
        data: data,
      )
    ];
  }

  void loadPieChartData() {
    List<PieChartHolding> data = [];
    for (String name in portfolio.positionsMap.keys) {
      data.add(PieChartHolding(name, portfolio.positionsMap[name]));
    }
    pieChartData = [
      Charts.Series<PieChartHolding, String>(
          id: "Holdings",
          data: data,
          colorFn: (_, i) => Charts.ColorUtil.fromDartColor(Colors.yellow[
              i != null
                  ? (i + (10 - portfolio.positionsMap.length)) * 100
                  : 250]),
          domainFn: (PieChartHolding holding, _) => holding.name,
          measureFn: (PieChartHolding holding, _) => holding.value)
    ];
  }
}

class PieChartHolding {
  String name;
  double value;

  PieChartHolding(this.name, this.value);
}

class DataPoint {
  int data;
  double value;

  DataPoint(this.data, this.value);
}
