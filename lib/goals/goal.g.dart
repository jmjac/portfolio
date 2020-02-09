// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return Goal(
    name: json['name'] as String,
    description: json['description'] as String,
    startDate: json['startDate'] as int,
    endDate: json['endDate'] as int,
    goalPrice: (json['goalPrice'] as num)?.toDouble(),
    initialInvestment: (json['initialInvestment'] as num)?.toDouble(),
    icon: json['icon'] as int,
    positions: (json['positions'] as List)?.map((e) => e as String)?.toList(),
    positionsInvestment: (json['positionsInvestment'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
  )
    ..currentValue = (json['currentValue'] as num)?.toDouble()
    ..fulfilled = (json['fulfilled'] as num)?.toDouble()
    ..positionsToFeedToAPI =
        (json['positionsToFeedToAPI'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    );
}

Map<String, dynamic> _$GoalToJson(Goal instance) => <String, dynamic>{
      'name': instance.name,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'goalPrice': instance.goalPrice,
      'initialInvestment': instance.initialInvestment,
      'currentValue': instance.currentValue,
      'fulfilled': instance.fulfilled,
      'icon': instance.icon,
      'positions': instance.positions,
      'positionsInvestment': instance.positionsInvestment,
      'positionsToFeedToAPI': instance.positionsToFeedToAPI,
    };
