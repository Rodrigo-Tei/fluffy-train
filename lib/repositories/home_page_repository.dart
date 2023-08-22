import 'package:fluffy_train/models/lesson.dart';
import 'package:fluffy_train/repositories/network/home_page_requester.dart';

class HomePageRepository {
  Future<List<Lesson>> getLessons() async {
    return HomePageRequester.getLessons();
  }
}
