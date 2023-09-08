import 'package:json_annotation/json_annotation.dart';

part 'friend.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Friend {
  Friend(
    this.name,
  );

  String name;

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  Map<String, dynamic> toJson() => _$FriendToJson(this);

  @override
  String toString() {
    return 'Friend{name: $name}';
  }
}
