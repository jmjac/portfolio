// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InvestmentStore on _InvestmentStore, Store {
  final _$totalGainAtom = Atom(name: '_InvestmentStore.totalGain');

  @override
  double get totalGain {
    _$totalGainAtom.context.enforceReadPolicy(_$totalGainAtom);
    _$totalGainAtom.reportObserved();
    return super.totalGain;
  }

  @override
  set totalGain(double value) {
    _$totalGainAtom.context.conditionallyRunInAction(() {
      super.totalGain = value;
      _$totalGainAtom.reportChanged();
    }, _$totalGainAtom, name: '${_$totalGainAtom.name}_set');
  }

  final _$monthChangeAtom = Atom(name: '_InvestmentStore.monthChange');

  @override
  double get monthChange {
    _$monthChangeAtom.context.enforceReadPolicy(_$monthChangeAtom);
    _$monthChangeAtom.reportObserved();
    return super.monthChange;
  }

  @override
  set monthChange(double value) {
    _$monthChangeAtom.context.conditionallyRunInAction(() {
      super.monthChange = value;
      _$monthChangeAtom.reportChanged();
    }, _$monthChangeAtom, name: '${_$monthChangeAtom.name}_set');
  }

  final _$initialInvestmentAtom =
      Atom(name: '_InvestmentStore.initialInvestment');

  @override
  double get initialInvestment {
    _$initialInvestmentAtom.context.enforceReadPolicy(_$initialInvestmentAtom);
    _$initialInvestmentAtom.reportObserved();
    return super.initialInvestment;
  }

  @override
  set initialInvestment(double value) {
    _$initialInvestmentAtom.context.conditionallyRunInAction(() {
      super.initialInvestment = value;
      _$initialInvestmentAtom.reportChanged();
    }, _$initialInvestmentAtom, name: '${_$initialInvestmentAtom.name}_set');
  }

  final _$addedAtom = Atom(name: '_InvestmentStore.added');

  @override
  double get added {
    _$addedAtom.context.enforceReadPolicy(_$addedAtom);
    _$addedAtom.reportObserved();
    return super.added;
  }

  @override
  set added(double value) {
    _$addedAtom.context.conditionallyRunInAction(() {
      super.added = value;
      _$addedAtom.reportChanged();
    }, _$addedAtom, name: '${_$addedAtom.name}_set');
  }

  final _$_InvestmentStoreActionController =
      ActionController(name: '_InvestmentStore');

  @override
  void loadGeneralPortfolio() {
    final _$actionInfo = _$_InvestmentStoreActionController.startAction();
    try {
      return super.loadGeneralPortfolio();
    } finally {
      _$_InvestmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddToInvestment(double add) {
    final _$actionInfo = _$_InvestmentStoreActionController.startAction();
    try {
      return super.setAddToInvestment(add);
    } finally {
      _$_InvestmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToInvestment() {
    final _$actionInfo = _$_InvestmentStoreActionController.startAction();
    try {
      return super.addToInvestment();
    } finally {
      _$_InvestmentStoreActionController.endAction(_$actionInfo);
    }
  }
}
