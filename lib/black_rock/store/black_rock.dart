import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/black_rock/black_rock_api_performence.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';
import 'package:charts_flutter/flutter.dart' as Charts;
import 'package:fl_chart/fl_chart.dart';

part 'black_rock.g.dart';

class BlackRockStore extends _BlackRockStore with _$BlackRockStore {
  BlackRockStore(BlackRockAPIPortfolio portfolio) : super(portfolio);
}

abstract class _BlackRockStore with Store {
  _BlackRockStore(this.portfolio);

  BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(
      positions: {
        "PMADX": 24.38,
        "PBEAX": 333.79,
        "SUWBX": 44.76,
        "CATNX": 300.49,
        "AAPL": 100.00,
      },
      startDate: 1546300800000,
      calculatePerformance: true,
      onlyMonthEndPerfChart: true);
  BlackRockAPIPerformance performance;

  double initialInvestment = 1000.0;

  @observable
  double monthChange = 0;

  @observable
  List<Charts.Series<PieChartHolding, String>> pieChartData = [];

  @observable
  LineChartData lineChartData = LineChartData();

  // Uses level from resultsMap to calculate the portfolio performance per month
  // and convert it to LineSeries to feed to graph

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

  List<Color> gradientColors = [
    Colors.amber[700],
    Colors.amber,
  ];

  @action
  Future<void> mainData() async {
    List<dynamic> perfChart = await portfolio.getPerfChart();
    List<FlSpot> perfChartData = [];
    int initialYear =
        DateTime.fromMillisecondsSinceEpoch(perfChart[0][0], isUtc: true).year;

    for (List<dynamic> pair in perfChart) {
      DateTime currDateTime =
          DateTime.fromMillisecondsSinceEpoch(pair[0], isUtc: true);
      // months since started
      int month = currDateTime.month + 12 * (currDateTime.year % initialYear);
      perfChartData.add(FlSpot(month.toDouble(), pair[1] * initialInvestment));
    }

    LineChartBarData liveData = LineChartBarData(
      // spots: perfChartData,
      spots: const [
        FlSpot(0, 3),
        FlSpot(2.6, 2),
        FlSpot(4.9, 5),
        FlSpot(6.8, 3.1),
        FlSpot(8, 4),
        FlSpot(9.5, 3),
        FlSpot(11, 4),
      ],
      isCurved: true,
      colors: gradientColors,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: const FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: gradientColors.map((color) => color.withOpacity(0.7)).toList(),
      ),
    );

    lineChartData = LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {},
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 5000,
      lineBarsData: [liveData],
    );
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
