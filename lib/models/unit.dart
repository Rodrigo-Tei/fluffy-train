import 'package:fluffy_train/models/lesson.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unit.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Unit {
  Unit(this.title, this.topics, this.completePercentage, this.lessons);

  String title;
  List<String> topics;
  double completePercentage;
  List<Lesson> lessons;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);

  @override
  String toString() {
    return 'Unit{title: $title, topics: $topics, completePercentage: $completePercentage, lessons: $lessons}';
  }
}
