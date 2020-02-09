import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';
import 'package:portfolio/goals/store/goalStore.dart';
import 'package:portfolio/goals/store/goal_form_store.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddGoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final goalStore = Provider.of<GoalStore>(context);
    final goalFormStore = Provider.of<GoalFormStore>(context);
    final BlackRockStore blackRockStore = Provider.of<BlackRockStore>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Text(
              "New Goal",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Observer(
                builder: (_) => CircularPercentIndicator(
                    radius: 160,
                    backgroundColor: Colors.white,
                    percent: (goalFormStore.initialInvestment == null ||
                            goalFormStore.goalPrice == null)
                        ? 0
                        : goalFormStore.goalPrice <
                                goalFormStore.initialInvestment
                            ? 1
                            : goalFormStore.initialInvestment /
                                goalFormStore.goalPrice,
                    progressColor: Colors.red,
                    lineWidth: 10.0,
                    animation: true,
                    startAngle: 0,
                    center: GestureDetector(
                      child: Icon(
                        IconData(
                            (goalFormStore.icon != null)
                                ? goalFormStore.icon
                                : Icons.touch_app.codePoint,
                            fontFamily: "MaterialIcons"),
                        size: 100,
                        color: Colors.black26,
                      ),
                      onTap: () {},
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
                        onChanged: (String value) =>
                            goalFormStore.setName(value),
                        decoration: InputDecoration(
                          labelText: 'Goal name*',
                          hintText: 'Your goal name',
                        )))),
            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Observer(
                    builder: (_) => TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (String value) =>
                            goalFormStore.setName(value),
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Description, notes etc.',
                        )))),
            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Observer(
                  builder: (_) => TextFormField(
                      decoration: InputDecoration(
                          labelText: "Initial amount invested*",
                          hintText: "Initial amount of money invested"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) => goalFormStore
                          .setInitialInvestment(double.parse(value)),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ]),
                )),
            Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Observer(
                    builder: (_) => TextFormField(
                            decoration: InputDecoration(
                                labelText: "Goal amount*",
                                hintText:
                                    "Amount of money need to achive the goal"),
                            onChanged: (String value) =>
                                goalFormStore.setGoalPrice(double.parse(value)),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              WhitelistingTextInputFormatter.digitsOnly
                            ]))),
            FlatButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      child: AlertDialog(
                          content: SizedBox(
                              width: 200,
                              height: 300,
                              child: ListView.builder(
                                  itemCount: blackRockStore
                                      .portfolio.positionsNames.length,
                                  itemBuilder: (context, index) => Observer(
                                        builder: (_) => CheckboxListTile(
                                          title: Text(
                                              "${blackRockStore.portfolio.positionsNames[index]}"),
                                          onChanged: (bool value) {
                                            goalFormStore.changePositions(
                                                blackRockStore.portfolio
                                                    .positionsNames[index],
                                                index);
                                          },
                                          value: (goalFormStore.positions
                                              .contains(blackRockStore.portfolio
                                                  .positionsNames[index])),
                                        ),
                                      )))));
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("Chose which investments to follow")
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      chooseStartingDate("Start", goalFormStore, context),
                      chooseEndDate("End", goalFormStore, context),
                    ])),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 300,
                  child: RaisedButton(
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      bool success = goalFormStore.validateAndSubmit(goalStore);
                      if (success) {
                        Navigator.pop(context);
                      }
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                )),
            Observer(
                builder: (_) => goalFormStore.error != null
                    ? Text("${goalFormStore.error}")
                    : Container())
          ],
        )));
  }

  Widget chooseStartingDate(String text, GoalFormStore goalFormStore, context) {
    var formatter = new DateFormat('yyyy-MM-dd');
    return Observer(
      builder: (_) => RaisedButton(
        onPressed: () async {
          DateTime date = await showRoundedDatePicker(
              context: context,
              firstDate: DateTime.fromMicrosecondsSinceEpoch(1),
              description: "$text date of portfolio tracking",
              theme: Theme.of(context),
              initialDatePickerMode: DatePickerMode.year);
          if (date != null) {
            goalFormStore.setStartDate(date.toUtc().millisecondsSinceEpoch);
          }
        },
        child: Text(
          goalFormStore.startDate != null
              ? "${formatter.format(DateTime.fromMillisecondsSinceEpoch(goalFormStore.startDate, isUtc: true))}"
              : "Add starting date",
          style: TextStyle(fontSize: 20),
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }

  Widget chooseEndDate(String text, GoalFormStore goalFormStore, context) {
    var formatter = new DateFormat('yyyy-MM-dd');
    return Observer(
        builder: (_) => RaisedButton(
              onPressed: () async {
                DateTime date = await showRoundedDatePicker(
                    context: context,
                    firstDate: DateTime.fromMicrosecondsSinceEpoch(1),
                    description: "$text date of portfolio tracking",
                    theme: Theme.of(context),
                    initialDatePickerMode: DatePickerMode.year);
                if (date != null) {
                  goalFormStore.setEndDate(date.toUtc().millisecondsSinceEpoch);
                }
              },
              child: Text(
                goalFormStore.endDate != null
                    ? "${formatter.format(DateTime.fromMillisecondsSinceEpoch(goalFormStore.endDate, isUtc: true))}"
                    : "Add end date",
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ));
  }
}
