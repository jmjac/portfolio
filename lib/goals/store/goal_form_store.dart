import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../goal.dart';
import 'goalStore.dart';

part 'goal_form_store.g.dart';

class GoalFormStore = _GoalFormStore with _$GoalFormStore;

abstract class _GoalFormStore with Store {
  @observable
  String name;
  @observable
  int startDate;
  @observable
  int endDate;
  @observable
  double goalPrice;
  @observable
  double initialInvestment;
  @observable
  String description;
  @observable
  int icon;
  @observable
  List<String> positions = [];
  @observable
  ObservableList<bool> positionsFollowed =
      ObservableList.of(List.filled(15, false));

  @observable
  String error;

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setStartDate(int value) {
    startDate = value;
  }

  @action
  void setDescription(String value) {
    description = value;
  }

  @action
  void setEndDate(int value) {
    endDate = value;
  }

  @action
  void setGoalPrice(double value) {
    goalPrice = value;
  }

  @action
  void setInitialInvestment(double value) {
    initialInvestment = value;
  }

  @action
  void setIcon(int value) {
    icon = value;
  }

  @action
  void changePositions(String position, int index) {
    if (positions.contains(position)) {
      positions.remove(position);
    } else {
      positions.add(position);
    }
    positionsFollowed[index] = !positionsFollowed[index];
  }

  @action
  bool validateAndSubmit(GoalStore goalStore) {
    if (positions.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        goalPrice != null &&
        initialInvestment != null) {
      goalStore.addGoal(Goal(
          initialInvestment: initialInvestment,
          icon: Icons.card_giftcard.codePoint,
          description: description != null ? description : "",
          positions: positions,
          beginDate: startDate != null ? startDate : 0,
          endDate: endDate != null
              ? endDate
              : DateTime.now().toUtc().millisecondsSinceEpoch,
          goalPrice: goalPrice,
          name: name));
      return true;
    } else {
      error = "Please fill in all required fields";
    }
    return false;
  }
}
