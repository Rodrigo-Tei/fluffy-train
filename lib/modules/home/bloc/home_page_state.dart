import 'package:equatable/equatable.dart';
import 'package:fluffy_train/models/unit.dart';

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
  final Unit unit;
  final List<Unit> unitList;

  HomePageLoaded(this.unit, this.unitList) : super([unit, unitList]);

  @override
  String toString() => 'HomePageLoaded';
}

class ChangeUnitLoading extends HomePageState {
  ChangeUnitLoading() : super([]);

  @override
  String toString() => 'ChangeUnitLoading';
}

class ChangeUnitLoaded extends HomePageState {
  final Unit unit;

  ChangeUnitLoaded(this.unit) : super([unit]);

  @override
  String toString() => 'ChangeUnitLoaded';
}
