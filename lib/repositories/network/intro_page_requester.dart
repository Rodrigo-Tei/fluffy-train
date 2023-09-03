import 'package:fluffy_train/models/charDialog.dart';
import 'package:fluffy_train/models/dialogElement.dart';
import 'package:just_audio/just_audio.dart';

class IntroPageRequester {
  static Future<List<CharDialog>> getCharDialogs() {
    return Future.value(charDialogMock);
  }
}

List<CharDialog> charDialogMock = [
  CharDialog(
    'Petunia',
    [
      DialogElement('Olá, meu nome é Petunia', 0),
      DialogElement('Eu gosto de tocar bateria', 1),
      DialogElement('Hoje vou te ensinar um pouco sobre ritmo', 2),
      DialogElement('Cante a letra a seguir enquanto eu toco a batera', 3),
      DialogElement('Fátima Bernardes cheirando cola', 4),
      DialogElement('Fátima Bernardes com a pica dura', 5),
      DialogElement('Fátima Bernardes experiência', 6),
      DialogElement('Fátima Bernardes também é cultura', 7),
      DialogElement('Incrível!', 8),
      DialogElement('Agora vamos para os exercício de verdade', 8),
    ],
  )
];
