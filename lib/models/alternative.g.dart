// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alternative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alternative _$AlternativeFromJson(Map<String, dynamic> json) => Alternative(
      json['text'] as String,
      json['is_correct'] as bool,
    );

Map<String, dynamic> _$AlternativeToJson(Alternative instance) =>
    <String, dynamic>{
      'text': instance.text,
      'is_correct': instance.isCorrect,
    };
