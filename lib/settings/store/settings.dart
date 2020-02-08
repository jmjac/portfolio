import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings.g.dart';

class SettingsStore extends _SettingsStore with _$SettingsStore {
  SettingsStore({@required preferences}) : super(preferences: preferences);
}

abstract class _SettingsStore with Store {
  //TODO: Change SharedPreferences to use Hive
  final SharedPreferences _preferences;

  _SettingsStore({@required SharedPreferences preferences})
      : _preferences = preferences;

  final List<MaterialColor> colors = Colors.primaries;
  int colorIndex = 2;

  @observable
  bool darkMode = false;

  //TODO: Make it better so the color don't rely on two variables
  @observable
  MaterialColor color = Colors.amber;

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
    colorIndex = _preferences?.getInt("color") ?? Colors.primaries.indexOf(Colors.amber);
    color = colors[colorIndex];
  }

  SharedPreferences getPreferences(){
    return _preferences;
  }
}
