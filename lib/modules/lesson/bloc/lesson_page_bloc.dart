import 'package:fluffy_train/modules/lesson/bloc/lesson_page_event.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_state.dart';
import 'package:fluffy_train/repositories/lesson_page_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPageBloc extends Bloc<LessonPageEvent, LessonPageState> {
  final LessonPageRepository lessonPageRepository;

  List<Widget> _generateList() {
    return [
      const Text('EXERCÍCIO 1'),
      const Text('EXERCÍCIO 2'),
      const Text('EXERCÍCIO 3'),
      const Text('EXERCÍCIO 4'),
      const Text('EXERCÍCIO 5'),
      const Text('EXERCÍCIO 6'),
      const Text('EXERCÍCIO 7'),
      const Text('EXERCÍCIO 8'),
      const Text('EXERCÍCIO 9'),
      const Text('EXERCÍCIO 10'),
    ];
  }

  LessonPageBloc(this.lessonPageRepository) : super(LessonPageLoading()) {
    on<FetchLessonPage>((event, emit) async {
      emit(LessonPageLoading());
      List<Widget> list = _generateList();
      list.shuffle();

      emit(LessonPageLoaded(list.sublist(1, 5)));
    });
  }
}
