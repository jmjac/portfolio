import 'package:flutter/material.dart';

class Goal {
  Goal({this.name, this.beginDate, this.goalDate, this.price, this.contributed, this.riskLevel, this.color = Colors.blue});

  String name;
  int beginDate;
  int goalDate;
  double price;
  double contributed;
  String riskLevel;
  MaterialColor color;
}