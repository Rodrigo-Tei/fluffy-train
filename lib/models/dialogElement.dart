import 'package:json_annotation/json_annotation.dart';

part 'dialogElement.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DialogElement {
  DialogElement(this.text, this.order);

  String text;
  int order;

  factory DialogElement.fromJson(Map<String, dynamic> json) =>
      _$DialogElementFromJson(json);

  Map<String, dynamic> toJson() => _$DialogElementToJson(this);

  @override
  String toString() {
    return 'DialogElement{text: $text, order: $order}';
  }
}
