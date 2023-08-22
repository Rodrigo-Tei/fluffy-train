import 'package:fluffy_train/models/lesson.dart';

class HomePageRequester {
  static Future<List<Lesson>> getLessons() {
    return Future(() => lessonsMock);
  }

  static final List<Lesson> lessonsMock = [
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
}
