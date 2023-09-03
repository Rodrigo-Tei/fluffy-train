// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      json['name'] as String,
      (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['current_level'] as int,
      $enumDecode(_$SubjectEnumMap, json['subject']),
      (json['percentage_completion'] as num).toDouble(),
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'name': instance.name,
      'exercises': instance.exercises,
      'current_level': instance.currentLevel,
      'subject': _$SubjectEnumMap[instance.subject]!,
      'percentage_completion': instance.percentageCompletion,
    };

const _$SubjectEnumMap = {
  Subject.history: 'history',
  Subject.perception: 'perception',
  Subject.rythm: 'rythm',
  Subject.sheet: 'sheet',
};
