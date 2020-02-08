import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/goals/store/goalStore.dart';
import 'package:provider/provider.dart';

class GoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoalStore goalStore = Provider.of<GoalStore>(context);

    return Container(
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
          itemCount: goalStore.goals.length ~/ 2,
          itemBuilder: (context, index) => Row(children: [
            CircularPercentIndicator(),
            CircularPercentIndicator()
          ]),
        ));
  }
}
