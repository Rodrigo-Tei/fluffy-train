import 'package:fluffy_train/models/exercise.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Lesson {
  Lesson(this.name, this.exercises, this.currentLevel, this.subject);

  String name;
  List<Exercise> exercises;
  int currentLevel;
  Subject subject;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);

  @override
  String toString() {
    return 'Lesson{question: $name, alternatives: $exercises}';
  }
}

enum Subject {
  history,
  perception,
  rythm,
  sheet,
}
