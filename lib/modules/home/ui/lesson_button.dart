import 'package:flutter/material.dart';

class LessonButton extends StatelessWidget {
  final Function toggleDialog;
  const LessonButton({required this.toggleDialog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        final buttonContext = context.findRenderObject() as RenderBox;
        final buttonPosition = buttonContext.globalToLocal(Offset.zero);
        toggleDialog(buttonPosition);
      },
      elevation: 2.0,
      fillColor: Colors.amber,
      padding: const EdgeInsets.all(24.0),
      shape: const CircleBorder(),
      child: const Icon(
        Icons.pause,
        size: 35.0,
      ),
    );
  }
}
