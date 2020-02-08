// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'black_rock.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlackRockStore on _BlackRockStore, Store {
  final _$seriesPerMonthAtom = Atom(name: '_BlackRockStore.seriesPerMonth');

  @override
  List<Charts.Series<DataPoint, DateTime>> get seriesPerMonth {
    _$seriesPerMonthAtom.context.enforceReadPolicy(_$seriesPerMonthAtom);
    _$seriesPerMonthAtom.reportObserved();
    return super.seriesPerMonth;
  }

  @override
  set seriesPerMonth(List<Charts.Series<DataPoint, DateTime>> value) {
    _$seriesPerMonthAtom.context.conditionallyRunInAction(() {
      super.seriesPerMonth = value;
      _$seriesPerMonthAtom.reportChanged();
    }, _$seriesPerMonthAtom, name: '${_$seriesPerMonthAtom.name}_set');
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
}
