import 'package:equatable/equatable.dart';

abstract class TopicPageEvent extends Equatable {
  final List? _props;

  const TopicPageEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchTopicPage extends TopicPageEvent {
  FetchTopicPage() : super([]);
}
