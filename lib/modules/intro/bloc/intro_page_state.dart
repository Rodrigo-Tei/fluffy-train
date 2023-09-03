import 'package:equatable/equatable.dart';
import 'package:fluffy_train/models/charDialog.dart';

abstract class IntroPageState extends Equatable {
  final List _props;

  const IntroPageState(this._props);

  @override
  List get props => _props;
}

class IntroPageLoading extends IntroPageState {
  IntroPageLoading() : super([]);

  @override
  String toString() => 'IntroPageLoading';
}

class IntroPageLoaded extends IntroPageState {
  final List<CharDialog> charDialogList;
  IntroPageLoaded(this.charDialogList) : super([charDialogList]);

  @override
  String toString() => 'IntroPageLoaded';
}
