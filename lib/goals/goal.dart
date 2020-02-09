import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goal.g.dart';

@JsonSerializable()
class Goal {
  Goal(
      {this.name,
      this.description,
      this.beginDate,
      this.endDate,
      this.goalPrice,
      this.initialInvestment,
      this.icon,
      this.positions}) {
    fullfiled = initialInvestment / goalPrice;
    if (fullfiled > 1) {
      fullfiled = 1;
    }
  }

  String name;
  int beginDate;
  int endDate;
  String description;
  double goalPrice;
  double initialInvestment;
  double fullfiled;
  int icon;
  List<String> positions;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

  Map<String, dynamic> toJson() => _$GoalToJson(this);
}
