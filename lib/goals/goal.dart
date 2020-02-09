import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goal.g.dart';

@JsonSerializable()
class Goal {
  Goal(
      {this.name,
      this.description,
      this.startDate,
      this.endDate,
      this.goalPrice,
      this.initialInvestment,
      this.icon,
      this.positions,
      this.positionsInvestment}) {
    currentValue = initialInvestment;
    fulfilled = currentValue / goalPrice;
    if (fulfilled > 1) {
      fulfilled = 1;
    }
    for (int i = 0; i < this.positions.length; i++) {
      positionsToFeedToAPI[positions[i]] = positionsInvestment[i];
    }
  }

  String name;
  int startDate;
  int endDate;
  String description;
  double goalPrice;
  double initialInvestment;
  double currentValue;
  double fulfilled;
  int icon;
  List<String> positions;
  List<double> positionsInvestment;
  Map<String, double> positionsToFeedToAPI = {};

  void changeFulfilled(double gain) {
    if (currentValue == null) {
      currentValue = initialInvestment;
    }
    currentValue += gain;
    fulfilled = (currentValue) / goalPrice;
    if (fulfilled > 1) {
      fulfilled = 1;
    }
  }

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

  Map<String, dynamic> toJson() => _$GoalToJson(this);
}
