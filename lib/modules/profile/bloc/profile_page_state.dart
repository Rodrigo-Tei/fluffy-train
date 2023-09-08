import 'package:equatable/equatable.dart';
import 'package:fluffy_train/models/friend.dart';

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
  final List<Friend> followers;
  ProfilePageLoaded(
    this.followers,
  ) : super([
          followers,
        ]);

  @override
  String toString() => 'ProfilePageLoaded{followers: $followers}';
}
