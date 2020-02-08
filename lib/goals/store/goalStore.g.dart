// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goalStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoalStore on _GoalStore, Store {
  final _$goalsAtom = Atom(name: '_GoalStore.goals');

  @override
  ObservableList<Goal> get goals {
    _$goalsAtom.context.enforceReadPolicy(_$goalsAtom);
    _$goalsAtom.reportObserved();
    return super.goals;
  }

  @override
  set goals(ObservableList<Goal> value) {
    _$goalsAtom.context.conditionallyRunInAction(() {
      super.goals = value;
      _$goalsAtom.reportChanged();
    }, _$goalsAtom, name: '${_$goalsAtom.name}_set');
  }
}
