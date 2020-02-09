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

  @observable
  BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(
    positions: {
      "PMADX": 24.38,
      "PBEAX": 333.79,
      "SUWBX": 44.76,
      "CATNX": 300.49,
      "AAPL": 100.00,
    },
    // startDate: 1546300800000,
    // calculatePerformance: true,
    // onlyMonthEndPerfChart: true);
  );
  BlackRockAPIPerformance performance;

  @observable
  double initialInvestment = 1000.0;

  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @observable
  double profit = 0;

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
  Future<void> mainData({BlackRockAPIPortfolio portfolio}) async {
    List<dynamic> perfChart = await portfolio.getPerfChart();
    List<FlSpot> perfChartData = [];
    int initialYear =
        DateTime.fromMillisecondsSinceEpoch(perfChart[0][0], isUtc: true).year;
    profit = double.parse(
        ((perfChart[perfChart.length - 1][1] - 1) * initialInvestment)
            .toStringAsFixed(2));
    monthChange = double.parse(
        ((1 - (perfChart[perfChart.length - 1][1] - perfChart[perfChart.length - 2][1])) * initialInvestment)
            .toStringAsFixed(2));
    for (List<dynamic> pair in perfChart) {
      DateTime currDateTime =
          DateTime.fromMillisecondsSinceEpoch(pair[0], isUtc: true);
      // months since started
      int month = currDateTime.month + 12 * (currDateTime.year % initialYear);
      perfChartData.add(FlSpot(month.toDouble(),
          double.parse((pair[1] * initialInvestment).toStringAsFixed(2))));
    }

    LineChartBarData liveData = LineChartBarData(
      spots: perfChartData,
      isCurved: true,
      colors: gradientColors,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: gradientColors.map((color) => color.withOpacity(0.5)).toList(),
      ),
    );

    lineChartData = LineChartData(
      lineTouchData: LineTouchData(touchTooltipData:
          LineTouchTooltipData(getTooltipItems: (touchedSpots) {
        if (touchedSpots == null) {
          return null;
        }
        return touchedSpots.map((LineBarSpot touchedSpot) {
          if (touchedSpot == null) {
            return null;
          }
          final TextStyle textStyle = TextStyle(
            color: touchedSpot.bar.colors[0],
            fontWeight: FontWeight.bold,
            fontSize: 14,
          );
          return LineTooltipItem(
              '\$${touchedSpot.y} \n +\$${double.parse((touchedSpot.y - initialInvestment).toStringAsExponential(2))}',
              textStyle);
        }).toList();
      })),
      gridData: FlGridData(
        verticalInterval: 1,
        horizontalInterval: profit / 10,
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: .5,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: .5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 10,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8),
          getTitles: (value) {
            if (value.floor().toInt() % 12 == 1 ||
                value.floor().toInt() % 12 == 6) {
              // Formats the titles in the form m/yyyy
              return (value.toInt() % 12).toString() +
                  '/' +
                  (initialYear + value.toInt() ~/ 12).toString();
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          getTitles: (value) {
            if (value % (profit / 10) == 0) {
              return "\$" + value.toInt().toString();
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
      // minX: 0,
      // maxX: 24,
      minY: 0,
      maxY: initialInvestment * 2,
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
