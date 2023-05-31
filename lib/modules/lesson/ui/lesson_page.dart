import 'package:fluffy_train/models/alternative.dart';
import 'package:fluffy_train/models/exercise.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_bloc.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_event.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPage extends StatefulWidget {
  final List<Exercise>? exercisesList;
  const LessonPage(this.exercisesList, {super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

@override
class _LessonPageState extends State<LessonPage> {
  late List<Exercise> exercisesList;
  bool _loading = true;
  late LessonPageBloc _lessonPageBloc;

  @override
  void initState() {
    super.initState();
    _initExerciseList();
  }

  void _initExerciseList() {
    if (widget.exercisesList == null) {
      _lessonPageBloc = context.read<LessonPageBloc>();
      _lessonPageBloc.add(FetchLessonPage());
    } else {
      exercisesList = widget.exercisesList!;
      _loading = false;
    }
  }

  Future<void> _handleListener(
      BuildContext context, LessonPageState state) async {
    if (state is LessonPageLoading) {
      _loading = true;
    }
    if (state is LessonPageLoaded) {
      exercisesList = state.exercisesList;
      _loading = false;
    }
  }

  bool isLastExercise() {
    return widget.exercisesList != null && widget.exercisesList!.isEmpty;
  }

  void _handleCorrectAlternative() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => LessonPage(
              exercisesList..removeAt(0),
            )),
      ),
    );
  }

  void _handleIncorrectAlternative() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Resposta incorreta!'),
                ElevatedButton(
                    child: const Text('Próxima questão'),
                    onPressed: () => {
                          Navigator.pop(context),
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => LessonPage(
                                    exercisesList..removeAt(0),
                                  )),
                            ),
                          ),
                        }),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildAlternative(List<Alternative> alternatives) {
    List<Widget> list = [];
    for (Alternative alt in alternatives) {
      list.add(
        Container(
          margin: const EdgeInsets.all(16.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              side: const BorderSide(width: 2, color: Colors.blue),
            ),
            onPressed: alt.isCorrect
                ? _handleCorrectAlternative
                : _handleIncorrectAlternative,
            child: Text(
              alt.text,
              style: const TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonPageBloc, LessonPageState>(
      listener: _handleListener,
      builder: (BuildContext context, LessonPageState state) {
        return Scaffold(
          body: _loading
              ? Container()
              : isLastExercise()
                  ? Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Voltar para Home Page'),
                      ),
                    )
                  : SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.all(16.0),
                              child: Text(
                                exercisesList[0].question,
                                style: const TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                          GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(24),
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            children:
                                buildAlternative(exercisesList[0].alternatives),
                          ),
                        ],
                      ),
                    ),
        );
      },
    );
  }
}
