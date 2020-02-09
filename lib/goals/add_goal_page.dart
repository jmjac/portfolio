import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/goals/store/goalStore.dart';
import 'package:portfolio/goals/store/goal_form_store.dart';
import 'package:provider/provider.dart';

class AddGoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final goalStore = Provider.of<GoalStore>(context);
    final goalFormStore = Provider.of<GoalFormStore>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32),
            ),
            Observer(
                builder: (_) => CircularPercentIndicator(
                    radius: 160,
                    backgroundColor: Colors.white,
                    percent: (goalFormStore.initialInvestment == null ||
                            goalFormStore.goalPrice == null)
                        ? 0
                        : goalFormStore.initialInvestment /
                            goalFormStore.goalPrice,
                    progressColor: Colors.red,
                    lineWidth: 10.0,
                    animation: true,
                    startAngle: 0,
                    center: Icon(
                      IconData(
                          (goalFormStore.icon != null)
                              ? goalFormStore.icon
                              : Icons.star.codePoint,
                          fontFamily: "MaterialIcons"),
                      size: 100,
                      color: Colors.black26,
                    ))),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Observer(
                    builder: (_) => TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (String value) => goalFormStore.setName(value),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Your goal name',
                        )))),

            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Observer(
                    builder: (_) =>TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (String value) => goalFormStore.setName(value),
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Description, notes etc.',
                        )))),

            Padding(padding: EdgeInsets.all(8.0),),

          ],
        ));
  }
}
