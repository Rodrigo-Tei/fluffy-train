import 'package:equatable/equatable.dart';

abstract class ProfilePageEvent extends Equatable {
  final List? _props;

  const ProfilePageEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchProfilePage extends ProfilePageEvent {
  FetchProfilePage() : super([]);
}
