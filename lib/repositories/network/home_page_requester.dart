import 'package:fluffy_train/models/lesson.dart';
import 'package:fluffy_train/models/unit.dart';

class HomePageRequester {
  static Future<List<Unit>> getLessons() {
    return Future(() => unitsMock);
  }

  static Future<Unit> changeUnit(index) {
    return Future(() => unitsMock[index]);
  }

  static final List<Unit> unitsMock = [
    Unit('Unidade 1', ['Topico 1', 'Topico 2', 'Topico 3'], 0.65, lessonsMock1),
    Unit('Unidade 2', ['Topico 1', 'Topico 2', 'Topico 3'], 1.00, lessonsMock2),
    Unit('Unidade 3', ['Topico 1', 'Topico 2', 'Topico 3'], 0.03, lessonsMock3),
    Unit('Unidade 4', ['Topico 1', 'Topico 2', 'Topico 3'], 0.20, lessonsMock4),
  ];
  static final List<Lesson> lessonsMock1 = [
    Lesson('Colcheias 1', [], 1, Subject.sheet, 100),
    Lesson('Escalas 1', [], 2, Subject.perception, 20),
    Lesson('Ritmo 1', [], 1, Subject.rythm, 15),
    Lesson('Dó Central', [], 4, Subject.perception, 25),
    Lesson('Pitágoras', [], 5, Subject.history, 100),
    Lesson('Colcheias 1', [], 2, Subject.sheet, 12.5),
    Lesson('Escalas 1', [], 2, Subject.perception, 75),
    Lesson('Ritmo 1', [], 1, Subject.rythm, 90),
    Lesson('Dó Central', [], 4, Subject.perception, 50),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Colcheias 1', [], 2, Subject.sheet, 20),
    Lesson('Escalas 1', [], 4, Subject.perception, 45),
    Lesson('Ritmo 1', [], 1, Subject.rythm, 50),
    Lesson('Dó Central', [], 2, Subject.perception, 15),
    Lesson('Pitágoras', [], 1, Subject.history, 25),
  ];

  static final List<Lesson> lessonsMock2 = [
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Colcheias 1', [], 2, Subject.sheet, 20),
    Lesson('Escalas 1', [], 4, Subject.perception, 45),
    Lesson('Ritmo 1', [], 1, Subject.rythm, 50),
    Lesson('Dó Central', [], 2, Subject.perception, 15),
    Lesson('Pitágoras', [], 1, Subject.history, 25),
  ];

  static final List<Lesson> lessonsMock3 = [
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
  ];

  static final List<Lesson> lessonsMock4 = [
    Lesson('Ritmo 1', [], 1, Subject.rythm, 50),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Ritmo 1', [], 1, Subject.rythm, 50),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Ritmo 1', [], 1, Subject.rythm, 50),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Ritmo 1', [], 1, Subject.rythm, 50),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
    Lesson('Ritmo 1', [], 1, Subject.rythm, 50),
    Lesson('Pitágoras', [], 5, Subject.history, 85),
  ];
}
