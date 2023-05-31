import 'package:fluffy_train/models/exercise.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_event.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_state.dart';
import 'package:fluffy_train/repositories/lesson_page_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPageBloc extends Bloc<LessonPageEvent, LessonPageState> {
  final LessonPageRepository lessonPageRepository;

  LessonPageBloc(this.lessonPageRepository) : super(LessonPageLoading()) {
    on<FetchLessonPage>((event, emit) async {
      emit(LessonPageLoading());
      List<Exercise> exerciseList = await lessonPageRepository.getExercises();
      exerciseList.shuffle();

      emit(LessonPageLoaded(exerciseList.sublist(1, 5)));
    });
  }
}
