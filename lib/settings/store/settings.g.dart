// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$darkModeAtom = Atom(name: '_SettingsStore.darkMode');

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

  final _$colorAtom = Atom(name: '_SettingsStore.color');

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

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  void toggleDarkMode() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.toggleDarkMode();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(Color newColor) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.setColor(newColor);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadSettings() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.loadSettings();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }
}
