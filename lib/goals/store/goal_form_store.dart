import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/black_rock/store/black_rock.dart';

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

  List<double> positionsInvestment = [];
  @observable
  ObservableList<bool> positionsFollowed =
      ObservableList.of(List.filled(15, false));

  @observable
  String error;

  @observable
  bool test = true;

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
    flipTest();
  }

  @action
  bool validateAndSubmit(GoalStore goalStore, BlackRockStore blackRockStore) {
    if (positions.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        goalPrice != null &&
        initialInvestment != null) {
      for (String position in positions) {
        positionsInvestment
            .add(blackRockStore.portfolio.positionsMap[position]);
      }
      goalStore.addGoal(Goal(
          initialInvestment: initialInvestment,
          icon: icon != null ? icon : Icons.panorama_fish_eye,
          description: description != null ? description : "",
          positions: positions,
          startDate: startDate != null ? startDate : 0,
          endDate: endDate != null
              ? endDate
              : DateTime.now().toUtc().millisecondsSinceEpoch,
          goalPrice: goalPrice,
          name: name,
          positionsInvestment: positionsInvestment));
      positions = [];
      positionsInvestment = [];
      name = null;
      startDate = null;
      endDate = null;
      positionsFollowed = ObservableList.of(List.filled(15, false));
      goalPrice = null;
      initialInvestment = null;
      description = null;
      error = null;
      return true;
    } else {
      error = "Please fill in all required fields";
    }
    return false;
  }

  @action
  void flipTest() {
    test = !test;
  }
}
