import 'package:fluffy_train/models/exercise.dart';
import 'package:fluffy_train/repositories/network/lesson_page_requester.dart';

class LessonPageRepository {
  Future<List<Exercise>> getExercises() async {
    return LessonPageRequester.getExercises();
  }
}
