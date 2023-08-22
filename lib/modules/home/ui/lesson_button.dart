import 'package:fluffy_train/models/lesson.dart';
import 'package:fluffy_train/theme/color_utils.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class LessonButton extends StatelessWidget {
  final Function toggleDialog;
  final Lesson lesson;
  const LessonButton(
      {required this.toggleDialog, required this.lesson, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SimpleCircularProgressBar(
              progressColors: [DefaultTheme.golden[Golden.level5]!],
              backStrokeWidth: 6,
              progressStrokeWidth: 6,
              valueNotifier: ValueNotifier(20),
              backColor: DefaultTheme.transparent,
            ),
            RawMaterialButton(
              onPressed: () {
                final buttonContext = context.findRenderObject() as RenderBox;
                final buttonPosition = buttonContext.globalToLocal(Offset.zero);
                toggleDialog(buttonPosition);
              },
              elevation: 0.0,
              fillColor:
                  ColorUtils.getColor(lesson.subject, lesson.currentLevel),
              padding: const EdgeInsets.all(16.0),
              shape: const CircleBorder(),
              child: Icon(
                Icons.pause,
                size: 48.0,
                color: ColorUtils.getIconColor(
                    lesson.subject, lesson.currentLevel),
                shadows: const [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 6.0),
                  )
                ],
              ),
            ),
          ],
        ),
        Text(
          lesson.name,
          style: const TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ],
    );
  }
}
