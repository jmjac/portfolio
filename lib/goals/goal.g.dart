// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return Goal(
    name: json['name'] as String,
    description: json['description'] as String,
    beginDate: json['beginDate'] as int,
    endDate: json['endDate'] as int,
    goalPrice: (json['goalPrice'] as num)?.toDouble(),
    initialInvestment: (json['initialInvestment'] as num)?.toDouble(),
    icon: json['icon'] as int,
    positions: (json['positions'] as List)?.map((e) => e as String)?.toList(),
  )..fullfiled = (json['fullfiled'] as num)?.toDouble();
}

Map<String, dynamic> _$GoalToJson(Goal instance) => <String, dynamic>{
      'name': instance.name,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'goalPrice': instance.goalPrice,
      'initialInvestment': instance.initialInvestment,
      'fullfiled': instance.fullfiled,
      'icon': instance.icon,
      'positions': instance.positions,
    };
