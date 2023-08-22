import 'package:equatable/equatable.dart';
import 'package:fluffy_train/models/lesson.dart';

abstract class HomePageState extends Equatable {
  final List _props;

  const HomePageState(this._props);

  @override
  List get props => _props;
}

class HomePageLoading extends HomePageState {
  HomePageLoading() : super([]);

  @override
  String toString() => 'HomePageLoading';
}

class HomePageLoaded extends HomePageState {
  final List<Lesson> lessons;

  HomePageLoaded(this.lessons) : super([lessons]);

  @override
  String toString() => 'HomePageLoaded';
}
