import 'package:fluffy_train/modules/home/ui/home_page.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_bloc.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_event.dart';
import 'package:fluffy_train/modules/lesson/bloc/lesson_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonPage extends StatefulWidget {
  final List<Widget>? exercisesList;
  const LessonPage(this.exercisesList, {super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

@override
class _LessonPageState extends State<LessonPage> {
  late List<Widget> exercisesList;
  bool _loading = true;
  late LessonPageBloc _lessonPageBloc;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonPageBloc, LessonPageState>(
      listener: _handleListener,
      builder: (BuildContext context, LessonPageState state) {
        return Scaffold(
          body: _loading
              ? Container()
              : widget.exercisesList != null && widget.exercisesList!.isEmpty
                  ? Center(
                      child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => HomePage()),
                          ),
                        );
                      },
                      child: const Text('próxima'),
                    ))
                  : Center(
                      child: Column(
                        children: [
                          exercisesList[0],
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => LessonPage(
                                        exercisesList..removeAt(0),
                                      )),
                                ),
                              );
                            },
                            child: const Text('próxima'),
                          )
                        ],
                      ),
                    ),
        );
      },
    );
  }
}
