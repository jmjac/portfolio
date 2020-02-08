import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:portfolio/goals/store/goal.dart';

part 'goalStore.g.dart';

class GoalStore extends _GoalStore with _$GoalStore {
  GoalStore({@required preferences}) : super(preferences: preferences);
}

abstract class _GoalStore with Store {
  //TODO: Change SharedPreferences to use Hive
  final SharedPreferences _preferences;

  _GoalStore({@required SharedPreferences preferences})
      : _preferences = preferences;

  @observable
  ObservableList<Goal> goals = ObservableList();

  void addGoal(Goal goal) {
    goals.add(goal);
  }
}
