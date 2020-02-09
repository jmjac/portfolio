import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:portfolio/goals/goal.dart';

part 'goalStore.g.dart';

class GoalStore extends _GoalStore with _$GoalStore {
  GoalStore({@required preferences}) : super(preferences: preferences);
}

abstract class _GoalStore with Store {
  final SharedPreferences _preferences;
  static Goal addNewGoalButton = Goal(
      name: "NEW GOAL",
      startDate: 0,
      goalPrice: 1,
      initialInvestment: 0,
      positions: [],
      endDate: 0,
      icon: Icons.add.codePoint);

  _GoalStore({@required SharedPreferences preferences})
      : _preferences = preferences;

  @observable
  ObservableList<Goal> goals = ObservableList.of([addNewGoalButton]);

  @action
  void addGoal(Goal goal) {
    goals.removeLast();
    goals.add(goal);
    goals.add(addNewGoalButton);
    _preferences.setString(
        'goals', jsonEncode(goals.map((goal) => goal.toJson()).toList()));
  }

  @action
  void removeGoal(int index) {
    print("Remove goal");
    goals.removeAt(index);
    _preferences.setString(
        'goals', jsonEncode(goals.map((goal) => goal.toJson()).toList()));
  }

  void loadGoals() async {
    try {
      List<dynamic> json = await jsonDecode(_preferences?.getString("goals"));
      goals = ObservableList.of(json.map((task) => Goal.fromJson(task)));
    } catch (_) {
      goals = null;
    }
    if (goals == null) {
      goals = ObservableList.of([addNewGoalButton]);
    }
  }
}
