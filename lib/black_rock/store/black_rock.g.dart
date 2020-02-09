// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'black_rock.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlackRockStore on _BlackRockStore, Store {
  final _$profitAtom = Atom(name: '_BlackRockStore.profit');

  @override
  double get profit {
    _$profitAtom.context.enforceReadPolicy(_$profitAtom);
    _$profitAtom.reportObserved();
    return super.profit;
  }

  @override
  set profit(double value) {
    _$profitAtom.context.conditionallyRunInAction(() {
      super.profit = value;
      _$profitAtom.reportChanged();
    }, _$profitAtom, name: '${_$profitAtom.name}_set');
  }

  final _$monthChangeAtom = Atom(name: '_BlackRockStore.monthChange');

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

  final _$pieChartDataAtom = Atom(name: '_BlackRockStore.pieChartData');

  @override
  List<Charts.Series<PieChartHolding, String>> get pieChartData {
    _$pieChartDataAtom.context.enforceReadPolicy(_$pieChartDataAtom);
    _$pieChartDataAtom.reportObserved();
    return super.pieChartData;
  }

  @override
  set pieChartData(List<Charts.Series<PieChartHolding, String>> value) {
    _$pieChartDataAtom.context.conditionallyRunInAction(() {
      super.pieChartData = value;
      _$pieChartDataAtom.reportChanged();
    }, _$pieChartDataAtom, name: '${_$pieChartDataAtom.name}_set');
  }

  final _$lineChartDataAtom = Atom(name: '_BlackRockStore.lineChartData');

  @override
  LineChartData get lineChartData {
    _$lineChartDataAtom.context.enforceReadPolicy(_$lineChartDataAtom);
    _$lineChartDataAtom.reportObserved();
    return super.lineChartData;
  }

  @override
  set lineChartData(LineChartData value) {
    _$lineChartDataAtom.context.conditionallyRunInAction(() {
      super.lineChartData = value;
      _$lineChartDataAtom.reportChanged();
    }, _$lineChartDataAtom, name: '${_$lineChartDataAtom.name}_set');
  }

  final _$mainDataAsyncAction = AsyncAction('mainData');

  @override
  Future<void> mainData() {
    return _$mainDataAsyncAction.run(() => super.mainData());
  }
}
