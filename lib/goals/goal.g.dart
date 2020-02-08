// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return Goal(
    name: json['name'] as String,
    beginDate: json['beginDate'] as int,
    endDate: json['endDate'] as int,
    goalPrice: (json['goalPrice'] as num)?.toDouble(),
    initialInvestment: (json['initialInvestment'] as num)?.toDouble(),
    icon: json['icon'] as int,
    positions: (json['positions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$GoalToJson(Goal instance) => <String, dynamic>{
      'name': instance.name,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'goalPrice': instance.goalPrice,
      'initialInvestment': instance.initialInvestment,
      'icon': instance.icon,
      'positions': instance.positions,
    };
