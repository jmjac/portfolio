import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/black_rock/black_rock_api_portfolio.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:portfolio/goals/add_goal_page.dart';
import 'package:portfolio/goals/goal_details_page.dart';
import 'package:portfolio/goals/goal.dart';
import 'package:portfolio/goals/store/goalStore.dart';
import 'package:portfolio/goals/store/goal_form_store.dart';
import 'package:provider/provider.dart';

class GoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoalStore goalStore = Provider.of<GoalStore>(context);
    goalStore.loadGoals();
//
    return Container(
        color: Theme.of(context).primaryColor,
        child: Observer(
            builder: (_) => ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: (goalStore.goals.length + 1) ~/ 2,
                  itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            goalProgressIndicator(
                                (index == 0) ? index : index * 2,
                                goalStore,
                                context),
                            ((index == 0) ? index + 1 : index * 2 + 1) <
                                    goalStore.goals.length
                                ? goalProgressIndicator(
                                    (index == 0) ? index + 1 : index * 2 + 1,
                                    goalStore,
                                    context)
                                : Container(
                                    width: 160,
                                    height: 0,
                                  )
                          ])),
                )));
  }

  Widget goalProgressIndicator(
      int index, GoalStore goalStore, BuildContext context) {
    Goal goal = goalStore.goals[index];
    BlackRockAPIPortfolio portfolio = BlackRockAPIPortfolio(
        positions: goal.positionsToFeedToAPI,
        startDate: goal.startDate,
        calculatePerformance: true,
        onlyMonthEndPerfChart: true);
    BlackRockStore blackRockStore = BlackRockStore(portfolio);
    blackRockStore.mainData(portfolio: portfolio);
    goal.changeFulfilled(blackRockStore.profit);

    return Column(children: [
      Observer(
          builder: (_) => CircularPercentIndicator(
              radius: 160,
              backgroundColor: Colors.white,
              progressColor: Colors.red,
              percent: goal?.fulfilled ?? 0,
              lineWidth: 10.0,
              animation: true,
              startAngle: 0,
              center: GestureDetector(
                child: Hero(
                    tag: "details$index",
                    child: goal.name == "NEW GOAL"
                        ? Container(
                            height: 160,
                            width: 160,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              IconData(goal.icon, fontFamily: "MaterialIcons"),
                              size: 100,
                              color: Colors.black87,
                            ))
                        : Icon(
                            IconData(goal.icon, fontFamily: "MaterialIcons"),
                            size: 100,
                            color: Colors.white,
                          )),
                onTap: () {
                  if (goal.name == "NEW GOAL") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddGoalPage()));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoalDetailsPage(index: index)),
                    );
                  }
                },
              ))),
      Text(
        goal.name.length < 20
            ? "${goal.name}"
            : "${goal.name.substring(0, 18)}...",
        style: TextStyle(fontSize: 18),
      )
    ]);
  }
}
