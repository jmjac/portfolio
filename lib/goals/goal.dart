import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'goal.g.dart';

@JsonSerializable()
class Goal {
  Goal(
      {this.name,
      this.beginDate,
      this.endDate,
      this.goalPrice,
      this.initialInvestment,
      this.icon,
      this.positions});

  String name;
  int beginDate;
  int endDate;
  double goalPrice;
  double initialInvestment;
  int icon;
  List<String> positions;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

  Map<String, dynamic> toJson() => _$GoalToJson(this);
}
