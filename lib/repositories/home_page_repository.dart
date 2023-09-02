import 'package:fluffy_train/models/unit.dart';
import 'package:fluffy_train/repositories/network/home_page_requester.dart';

class HomePageRepository {
  Future<Unit> getLessons() async {
    return HomePageRequester.getLessons();
  }

  Future<List<Unit>> getUnitList() async {
    return HomePageRequester.getUnitList();
  }

  Future<Unit> changeUnit(int index) async {
    return HomePageRequester.changeUnit(index);
  }
}
