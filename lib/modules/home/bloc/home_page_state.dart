import 'package:equatable/equatable.dart';

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
