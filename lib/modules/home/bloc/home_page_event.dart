import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {
  final List? _props;

  const HomePageEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchHomePage extends HomePageEvent {
  FetchHomePage() : super([]);
}
