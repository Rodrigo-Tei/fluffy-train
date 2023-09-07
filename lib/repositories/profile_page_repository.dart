import 'package:fluffy_train/models/friend.dart';
import 'package:fluffy_train/repositories/network/profile_page_requester.dart';

class ProfilePageRepository {
  Future<List<Friend>> getFollowers() async {
    return ProfilePageRequester.getFollowers();
  }
}
