import 'package:fluffy_train/models/friend.dart';

class ProfilePageRequester {
  static Future<List<Friend>> getFollowers() {
    return Future(() => friendsMock);
  }

  static final List<Friend> friendsMock = [
    Friend('João da Silva'),
    Friend('José Santos'),
    Friend('Antônio Pereira'),
    Friend('Luiz Souza'),
    Friend('Pedro Oliveira'),
    Friend('Maria da Silva'),
    Friend('Ana Santos'),
    Friend('Francisca Pereira'),
    Friend('Adriana Souza'),
    Friend('Juliana Oliveira'),
  ];
}
