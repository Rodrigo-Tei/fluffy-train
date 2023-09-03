import 'package:fluffy_train/models/alternative.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Exercise {
  Exercise(this.question, this.alternatives);

  String question;
  List<Alternative> alternatives;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  @override
  String toString() {
    return 'Exercise{question: $question, alternatives: $alternatives}';
  }
}
