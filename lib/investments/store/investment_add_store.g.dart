// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_add_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InvestmentAddStore on _InvestmentAddStore, Store {
  Computed<String> _$companyNameComputed;

  @override
  String get companyName =>
      (_$companyNameComputed ??= Computed<String>(() => super.companyName))
          .value;

  final _$companyTickerAtom = Atom(name: '_InvestmentAddStore.companyTicker');

  @override
  String get companyTicker {
    _$companyTickerAtom.context.enforceReadPolicy(_$companyTickerAtom);
    _$companyTickerAtom.reportObserved();
    return super.companyTicker;
  }

  @override
  set companyTicker(String value) {
    _$companyTickerAtom.context.conditionallyRunInAction(() {
      super.companyTicker = value;
      _$companyTickerAtom.reportChanged();
    }, _$companyTickerAtom, name: '${_$companyTickerAtom.name}_set');
  }

  final _$priceAtom = Atom(name: '_InvestmentAddStore.price');

  @override
  double get price {
    _$priceAtom.context.enforceReadPolicy(_$priceAtom);
    _$priceAtom.reportObserved();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.context.conditionallyRunInAction(() {
      super.price = value;
      _$priceAtom.reportChanged();
    }, _$priceAtom, name: '${_$priceAtom.name}_set');
  }

  final _$percentageAtom = Atom(name: '_InvestmentAddStore.percentage');

  @override
  double get percentage {
    _$percentageAtom.context.enforceReadPolicy(_$percentageAtom);
    _$percentageAtom.reportObserved();
    return super.percentage;
  }

  @override
  set percentage(double value) {
    _$percentageAtom.context.conditionallyRunInAction(() {
      super.percentage = value;
      _$percentageAtom.reportChanged();
    }, _$percentageAtom, name: '${_$percentageAtom.name}_set');
  }

  final _$_InvestmentAddStoreActionController =
      ActionController(name: '_InvestmentAddStore');

  @override
  void setCompanyTicker(String value) {
    final _$actionInfo = _$_InvestmentAddStoreActionController.startAction();
    try {
      return super.setCompanyTicker(value);
    } finally {
      _$_InvestmentAddStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(double value) {
    final _$actionInfo = _$_InvestmentAddStoreActionController.startAction();
    try {
      return super.setPrice(value);
    } finally {
      _$_InvestmentAddStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPercentage(double value) {
    final _$actionInfo = _$_InvestmentAddStoreActionController.startAction();
    try {
      return super.setPercentage(value);
    } finally {
      _$_InvestmentAddStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateAndSubmit(BlackRockStore blackRockStore) {
    final _$actionInfo = _$_InvestmentAddStoreActionController.startAction();
    try {
      return super.validateAndSubmit(blackRockStore);
    } finally {
      _$_InvestmentAddStoreActionController.endAction(_$actionInfo);
    }
  }
}
