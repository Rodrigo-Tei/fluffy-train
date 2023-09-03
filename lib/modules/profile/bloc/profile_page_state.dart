import 'package:equatable/equatable.dart';

abstract class ProfilePageState extends Equatable {
  final List _props;

  const ProfilePageState(this._props);

  @override
  List get props => _props;
}

class ProfilePageLoading extends ProfilePageState {
  ProfilePageLoading() : super([]);

  @override
  String toString() => 'ProfilePageLoading';
}

class ProfilePageLoaded extends ProfilePageState {
  ProfilePageLoaded() : super([]);

  @override
  String toString() => 'ProfilePageLoaded';
}
