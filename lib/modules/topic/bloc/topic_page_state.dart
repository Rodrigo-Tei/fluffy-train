import 'package:equatable/equatable.dart';

abstract class TopicPageState extends Equatable {
  final List _props;

  const TopicPageState(this._props);

  @override
  List get props => _props;
}

class TopicPageLoading extends TopicPageState {
  TopicPageLoading() : super([]);

  @override
  String toString() => 'TopicPageLoading';
}
