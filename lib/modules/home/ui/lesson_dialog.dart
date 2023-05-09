import 'package:fluffy_train/modules/topic/ui/topic_page.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

class LessonDialog extends StatelessWidget {
  final Offset dialogPosition;
  const LessonDialog({required this.dialogPosition, Key? key})
      : super(key: key);

  double _handleVerticalPosition(
    BuildContext context,
    double initialPositionDy,
  ) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (initialPositionDy > screenHeight * 0.8) {
      return screenHeight * 0.75;
    }
    return initialPositionDy;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _handleVerticalPosition(context, -(dialogPosition.dy - 50)),
      left: MediaQuery.of(context).size.width * 0.1,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: DefaultTheme.grayscale[Grayscale.lightestGray],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text('AULA 1'),
            const SizedBox(height: 12.0),
            const Text(
                'Aprenda sobre tópico 1, tópico 2, tópico 3, tópico 4, tópico 5'),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => TopicPage())));
                    },
                    child: const Text('Visitar matéria'),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text('Praticar aula'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
