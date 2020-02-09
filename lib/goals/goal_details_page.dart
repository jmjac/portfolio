import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';
import 'package:portfolio/goals/goal.dart';
import 'package:portfolio/goals/store/goalStore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:fl_chart/fl_chart.dart' as flCharts;

class GoalDetailsPage extends StatelessWidget {
  int index;
  var formatter = new DateFormat('yyyy-MM-dd');

  GoalDetailsPage({@required this.index});

  @override
  Widget build(BuildContext context) {
    final goalStore = Provider.of<GoalStore>(context);
    final BlackRockStore blackRockStore = Provider.of<BlackRockStore>(context);
    Goal goal = goalStore.goals[index];
    if(goal.startDate == 0) {
      goal.startDate = 1580515200;
    }
    BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(
        positions: goal.positionsToFeedToAPI,
        startDate: goal.startDate,
        calculatePerformance: true,
        onlyMonthEndPerfChart: true);
    blackRockStore.mainData(portfolio: portfolio);
    blackRockStore.initialInvestment = goal.initialInvestment;
    goal.changeFulfilled(blackRockStore.profit);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              decoration:
                  BoxDecoration(boxShadow: [BoxShadow(blurRadius: 10.0)]),
              child: SizedBox(
                height: 330,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  width: 1000,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 32.0, bottom: 8.0),
                          child: Text(
                            goal.name.length < 17
                                ? "${goal.name}"
                                : "${goal.name.substring(0, 15)}...",
                            style: TextStyle(
                                fontSize: 38, fontWeight: FontWeight.bold),
                          )),
                      Observer(
                          builder: (_) => Hero(
                                tag: "details$index",
                                child: Material(
                                    color: Colors.transparent,
                                    child: CircularPercentIndicator(
                                      radius: 160,
                                      backgroundColor: Colors.white,
                                      percent: goal.fulfilled,
                                      progressColor: goal.fulfilled == 1
                                          ? Colors.green
                                          : Colors.red,
                                      lineWidth: 10.0,
                                      animation: false,
                                      startAngle: 0,
                                      center: Icon(
                                        IconData(goal.icon,
                                            fontFamily: "MaterialIcons"),
                                        size: 100,
                                        color: Colors.white,
                                      ),
                                    )),
                              )),
                      Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              coveredBy("Initial investment", Colors.red),
                              coveredBy("Investments gains", Colors.pink),
                              coveredBy("Left", Colors.white)
                            ],
                          )),
                    ],
                  ),
                ),
              )),
          // Padding(padding: EdgeInsets.all(8.0)),
          Text("${goal.description}"),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              "Goal Start Date:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              goal.startDate != null
                  ? "${formatter.format(DateTime.fromMillisecondsSinceEpoch(goal.startDate, isUtc: true))}"
                  : "Release",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              "Goal End Date:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "${formatter.format(DateTime.fromMillisecondsSinceEpoch(goal.endDate, isUtc: true))}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
          SizedBox(
              child: Observer(
            builder: (_) => Container(
                child: Column(children: [
              Text(
                  "You are \$ ${(blackRockStore.profit).toDouble().toStringAsFixed(2)} closer to ${goal.name}",
                  style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.only(
                    right: 18.0, left: 2, top: 8, bottom: 12),
                child: flCharts.LineChart(
                  blackRockStore.lineChartData,
                ),
              )
            ])),
          )),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
                width: 100,
                child: RaisedButton(
                  child: Text("Back"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                  textColor: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                )),
            RaisedButton(
                child: Text("Remove goal"),
                onPressed: () {
                  goalStore.removeGoal(index);
                  Navigator.pop(context);
                },
                color: Colors.red,
                textColor: Colors.white,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0))),
            RaisedButton(
                child: Text("Complete"),
                onPressed: () {},
                color: Colors.amber,
                textColor: Colors.white,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)))
          ])
        ],
      ),
    ));
  }

  Widget coveredBy(String text, Color color) {
    return Row(children: <Widget>[
      SizedBox(
        height: 20,
        width: 20,
        child: Container(
          color: color,
        ),
      ),
      Text("  $text")
    ]);
  }
}
