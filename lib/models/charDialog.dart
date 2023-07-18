import 'package:fluffy_train/models/dialogElement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'charDialog.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CharDialog {
  CharDialog(this.character, this.dialogElements);

  String character;
  List<DialogElement> dialogElements;

  factory CharDialog.fromJson(Map<String, dynamic> json) =>
      _$CharDialogFromJson(json);

  Map<String, dynamic> toJson() => _$CharDialogToJson(this);

  @override
  String toString() {
    return 'CharDialog{character: $character, elements: $dialogElements}';
  }
}
