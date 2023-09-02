import 'package:fluffy_train/models/unit.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_event.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_state.dart';
import 'package:fluffy_train/repositories/home_page_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageRepository homePageRepository;

  HomePageBloc(this.homePageRepository) : super(HomePageLoading()) {
    on<FetchHomePage>((event, emit) async {
      emit(HomePageLoading());
      Unit unit = await homePageRepository.getLessons();
      List<Unit> unitList = await homePageRepository.getUnitList();
      emit(HomePageLoaded(unit, unitList));
    });

    on<ChangeUnit>((event, emit) async {
      emit(ChangeUnitLoading());
      Unit unit = await homePageRepository.changeUnit(event.index);
      emit(ChangeUnitLoaded(unit));
    });
  }
}
