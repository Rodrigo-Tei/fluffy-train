import 'package:fluffy_train/models/lesson.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_event.dart';
import 'package:fluffy_train/modules/home/bloc/home_page_state.dart';
import 'package:fluffy_train/repositories/home_page_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageRepository homePageRepository;

  HomePageBloc(this.homePageRepository) : super(HomePageLoading()) {
    on<FetchHomePage>((event, emit) async {
      List<Lesson> lessons = await homePageRepository.getLessons();
      emit(HomePageLoaded(lessons));
    });
  }
}
