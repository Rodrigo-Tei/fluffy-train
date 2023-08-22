import 'package:fluffy_train/models/lesson.dart';

class HomePageRequester {
  static Future<List<Lesson>> getLessons() {
    return Future(() => lessonsMock);
  }

  static final List<Lesson> lessonsMock = [
    Lesson('Colcheias 1', [], 1, Subject.sheet),
    Lesson('Escalas 1', [], 2, Subject.perception),
    Lesson('Ritmo 1', [], 1, Subject.rythm),
    Lesson('Dó Central', [], 4, Subject.perception),
    Lesson('Pitágoras', [], 5, Subject.history),
    Lesson('Colcheias 1', [], 2, Subject.sheet),
    Lesson('Escalas 1', [], 2, Subject.perception),
    Lesson('Ritmo 1', [], 1, Subject.rythm),
    Lesson('Dó Central', [], 4, Subject.perception),
    Lesson('Pitágoras', [], 5, Subject.history),
    Lesson('Colcheias 1', [], 2, Subject.sheet),
    Lesson('Escalas 1', [], 4, Subject.perception),
    Lesson('Ritmo 1', [], 1, Subject.rythm),
    Lesson('Dó Central', [], 2, Subject.perception),
    Lesson('Pitágoras', [], 1, Subject.history),
  ];
}
