import 'package:fluffy_train/commons/text_styles.dart';
import 'package:fluffy_train/models/lesson.dart';
import 'package:fluffy_train/theme/color_utils.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

class LessonButton extends StatelessWidget {
  final Function toggleDialog;
  final Lesson lesson;
  const LessonButton(
      {required this.toggleDialog, required this.lesson, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 2.6,
              child: CircularProgressIndicator(
                color: DefaultTheme.golden[Golden.level5],
                strokeWidth: 2.0,
                value: lesson.percentageCompletion / 100,
              ),
            ),
            RawMaterialButton(
              onPressed: () {
                final buttonContext = context.findRenderObject() as RenderBox;
                final buttonPosition = buttonContext.globalToLocal(Offset.zero);
                toggleDialog(buttonPosition);
              },
              elevation: 0.0,
              fillColor: ColorUtils.getColor(
                lesson.subject,
                lesson.currentLevel,
              ),
              padding: const EdgeInsets.all(16.0),
              shape: const CircleBorder(),
              child: Icon(
                Icons.pause,
                size: 48.0,
                color: ColorUtils.getIconColor(
                  lesson.subject,
                  lesson.currentLevel,
                ),
                shadows: const [
                  Shadow(
                    color: Colors.black26,
                    blurRadius: 16.0,
                    offset: Offset(0.0, 6.0),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
              top: lesson.percentageCompletion < 40 ? 0.0 : 12.0),
          child: Text(
            lesson.name,
            style: TextStyles.title3,
          ),
        ),
      ],
    );
  }
}
