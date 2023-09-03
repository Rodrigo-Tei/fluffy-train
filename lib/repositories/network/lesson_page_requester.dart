import 'package:fluffy_train/models/alternative.dart';
import 'package:fluffy_train/models/exercise.dart';

class LessonPageRequester {
  static Future<List<Exercise>> getExercises() {
    return Future.value(exercisesMock);
  }
}

List<Exercise> exercisesMock = [
  Exercise(
    'Qual destas letras corresponde à nota Dó?',
    [
      Alternative('A', false),
      Alternative('B', false),
      Alternative('C', true),
      Alternative('D', false),
    ],
  ),
  Exercise(
    'Qual destas letras corresponde à nota Ré?',
    [
      Alternative('A', false),
      Alternative('B', false),
      Alternative('C', false),
      Alternative('D', true),
    ],
  ),
  Exercise(
    'Qual destas letras corresponde à nota Mi?',
    [
      Alternative('E', true),
      Alternative('B', false),
      Alternative('G', false),
      Alternative('A', false),
    ],
  ),
  Exercise(
    'Qual destas letras corresponde à nota Fá?',
    [
      Alternative('D', false),
      Alternative('F', true),
      Alternative('A', false),
      Alternative('B', false),
    ],
  ),
  Exercise(
    'Qual destas letras corresponde à nota Sol?',
    [
      Alternative('C', false),
      Alternative('E', false),
      Alternative('G', true),
      Alternative('B', false),
    ],
  ),
  Exercise(
    'Qual destas letras corresponde à nota Lá?',
    [
      Alternative('A', true),
      Alternative('B', false),
      Alternative('C', false),
      Alternative('D', false),
    ],
  ),
  Exercise(
    'Qual destas letras corresponde à nota Si?',
    [
      Alternative('E', false),
      Alternative('G', false),
      Alternative('A', false),
      Alternative('B', true),
    ],
  ),
];
