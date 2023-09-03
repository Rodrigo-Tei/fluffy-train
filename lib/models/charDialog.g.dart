// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charDialog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharDialog _$CharDialogFromJson(Map<String, dynamic> json) => CharDialog(
      json['character'] as String,
      (json['dialog_elements'] as List<dynamic>)
          .map((e) => DialogElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharDialogToJson(CharDialog instance) =>
    <String, dynamic>{
      'character': instance.character,
      'dialog_elements': instance.dialogElements,
    };
