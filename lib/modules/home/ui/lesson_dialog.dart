import 'package:fluffy_train/commons/text_styles.dart';
import 'package:fluffy_train/modules/lesson/ui/lesson_page.dart';
import 'package:fluffy_train/modules/intro/ui/intro_page.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

class LessonDialog extends StatelessWidget {
  final Offset dialogPosition;
  final bool appbarIsToggled;
  const LessonDialog(
      {required this.dialogPosition, required this.appbarIsToggled, Key? key})
      : super(key: key);

  double _handleVerticalPosition(
    BuildContext context,
    double initialPositionDy,
  ) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (initialPositionDy > screenHeight * 0.65) {
      return appbarIsToggled ? screenHeight * 0.45 : screenHeight * 0.65;
    }
    return appbarIsToggled
        ? initialPositionDy - 200.0
        : initialPositionDy - 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _handleVerticalPosition(context, -dialogPosition.dy),
      left: MediaQuery.of(context).size.width * 0.1,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: DefaultTheme.grayscale[Grayscale.lightestGray],
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2.0,
              offset: Offset(0, 0.5),
            )
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'AULA 1',
              style: TextStyles.title3,
            ),
            const SizedBox(height: 12.0),
            Text(
              'Aprenda sobre tópico 1, tópico 2, tópico 3, tópico 4, tópico 5',
              style: TextStyles.paragraph3,
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultTheme.reds[Reds.sangria],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const IntroPage(null)),
                        ),
                      );
                    },
                    child: Text(
                      'Visitar matéria',
                      style: TextStyles.highlight3White,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DefaultTheme.reds[Reds.sangria],
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const LessonPage(null)),
                        ),
                      )
                    },
                    child: Text(
                      'Ir para a aula',
                      style: TextStyles.highlight3White,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
