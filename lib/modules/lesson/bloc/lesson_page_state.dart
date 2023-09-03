import 'package:equatable/equatable.dart';
import 'package:fluffy_train/models/exercise.dart';

abstract class LessonPageState extends Equatable {
  final List _props;

  const LessonPageState(this._props);

  @override
  List get props => _props;
}

class LessonPageLoading extends LessonPageState {
  LessonPageLoading() : super([]);

  @override
  String toString() => 'LessonPageLoading';
}

class LessonPageLoaded extends LessonPageState {
  final List<Exercise> exercisesList;
  LessonPageLoaded(this.exercisesList) : super([exercisesList]);

  @override
  String toString() => 'LessonPageLoaded';
}
