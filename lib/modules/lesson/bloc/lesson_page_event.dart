import 'package:equatable/equatable.dart';

abstract class LessonPageEvent extends Equatable {
  final List? _props;

  const LessonPageEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchLessonPage extends LessonPageEvent {
  FetchLessonPage() : super([]);
}
