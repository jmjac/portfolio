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
          itemCount: (5) ~/ 2,
          itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GoalProgress(),
                    GoalProgress(),
                  ])),
        ));
  }

  Widget GoalProgress() {
    return CircularPercentIndicator(
      radius: 160,
      backgroundColor: Colors.white,
      progressColor: Colors.red,
      percent: 0.40,
      lineWidth: 10.0,
    );
  }
}
