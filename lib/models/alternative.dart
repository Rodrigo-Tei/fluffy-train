import 'package:json_annotation/json_annotation.dart';

part 'alternative.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Alternative {
  Alternative(this.text, this.isCorrect);

  String text;
  bool isCorrect;

  factory Alternative.fromJson(Map<String, dynamic> json) =>
      _$AlternativeFromJson(json);

  Map<String, dynamic> toJson() => _$AlternativeToJson(this);

  @override
  String toString() {
    return 'Alternative{text: $text, isCorrect: $isCorrect}';
  }
}
