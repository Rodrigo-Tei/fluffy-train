// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      json['title'] as String,
      (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
      (json['complete_percentage'] as num).toDouble(),
      (json['lessons'] as List<dynamic>)
          .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'title': instance.title,
      'topics': instance.topics,
      'complete_percentage': instance.completePercentage,
      'lessons': instance.lessons,
    };
