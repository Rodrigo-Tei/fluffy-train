import 'package:fluffy_train/models/unit.dart';
import 'package:fluffy_train/repositories/network/home_page_requester.dart';

class HomePageRepository {
  Future<List<Unit>> getLessons() async {
    return HomePageRequester.getLessons();
  }

  Future<Unit> changeUnit(int index) async {
    return HomePageRequester.changeUnit(index);
  }
}
