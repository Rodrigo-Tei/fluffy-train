import 'package:equatable/equatable.dart';

abstract class IntroPageEvent extends Equatable {
  final List? _props;

  const IntroPageEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchIntroPage extends IntroPageEvent {
  FetchIntroPage() : super([]);
}
