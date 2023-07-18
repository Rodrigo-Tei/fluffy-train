import 'package:fluffy_train/models/charDialog.dart';
import 'package:fluffy_train/repositories/network/intro_page_requester.dart';

class IntroPageRepository {
  Future<List<CharDialog>> getCharDialogs() async {
    return IntroPageRequester.getCharDialogs();
  }
}
