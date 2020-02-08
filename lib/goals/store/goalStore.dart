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

  List<MaterialColor> colors = Colors.primaries;
  int colorIndex = 2;

  List<Goal> goalList;

  @observable
  bool darkMode = false;

  //TODO: Make it better so the color don't rely on two variables
  @observable
  MaterialColor color = Colors.blue;

  @action
  void toggleDarkMode() {
    darkMode = !darkMode;
    _preferences.setBool("darkMode", darkMode);
  }

  @action
  void setColor(Color newColor) {
    color = newColor;
    colorIndex = colors.indexOf(color);
    _preferences.setInt("color", colorIndex);
  }

  @action
  void loadSettings() {
    darkMode = _preferences?.getBool("darkMode") ?? false;
    colorIndex = _preferences?.getInt("color") ?? 2;
    color = colors[colorIndex];
  }

  @action
  SharedPreferences getPreferences(){
    return _preferences;
  }
}
