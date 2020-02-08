// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goalStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoalStore on _GoalStore, Store {
  final _$darkModeAtom = Atom(name: '_GoalStore.darkMode');

  @override
  bool get darkMode {
    _$darkModeAtom.context.enforceReadPolicy(_$darkModeAtom);
    _$darkModeAtom.reportObserved();
    return super.darkMode;
  }

  @override
  set darkMode(bool value) {
    _$darkModeAtom.context.conditionallyRunInAction(() {
      super.darkMode = value;
      _$darkModeAtom.reportChanged();
    }, _$darkModeAtom, name: '${_$darkModeAtom.name}_set');
  }

  final _$colorAtom = Atom(name: '_GoalStore.color');

  @override
  MaterialColor get color {
    _$colorAtom.context.enforceReadPolicy(_$colorAtom);
    _$colorAtom.reportObserved();
    return super.color;
  }

  @override
  set color(MaterialColor value) {
    _$colorAtom.context.conditionallyRunInAction(() {
      super.color = value;
      _$colorAtom.reportChanged();
    }, _$colorAtom, name: '${_$colorAtom.name}_set');
  }

  final _$_GoalStoreActionController = ActionController(name: '_GoalStore');

  @override
  void toggleDarkMode() {
    final _$actionInfo = _$_GoalStoreActionController.startAction();
    try {
      return super.toggleDarkMode();
    } finally {
      _$_GoalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(Color newColor) {
    final _$actionInfo = _$_GoalStoreActionController.startAction();
    try {
      return super.setColor(newColor);
    } finally {
      _$_GoalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadSettings() {
    final _$actionInfo = _$_GoalStoreActionController.startAction();
    try {
      return super.loadSettings();
    } finally {
      _$_GoalStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  SharedPreferences getPreferences() {
    final _$actionInfo = _$_GoalStoreActionController.startAction();
    try {
      return super.getPreferences();
    } finally {
      _$_GoalStoreActionController.endAction(_$actionInfo);
    }
  }
}
