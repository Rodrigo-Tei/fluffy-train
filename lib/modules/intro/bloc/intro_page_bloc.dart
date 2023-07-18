import 'package:fluffy_train/models/charDialog.dart';
import 'package:fluffy_train/modules/intro/bloc/intro_page_event.dart';
import 'package:fluffy_train/modules/intro/bloc/intro_page_state.dart';
import 'package:fluffy_train/repositories/intro_page_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPageBloc extends Bloc<IntroPageEvent, IntroPageState> {
  final IntroPageRepository introPageRepository;

  IntroPageBloc(this.introPageRepository) : super(IntroPageLoading()) {
    on<FetchIntroPage>((event, emit) async {
      emit(IntroPageLoading());
      List<CharDialog> charDialogList =
          await introPageRepository.getCharDialogs();

      emit(IntroPageLoaded(charDialogList));
    });
  }
}
