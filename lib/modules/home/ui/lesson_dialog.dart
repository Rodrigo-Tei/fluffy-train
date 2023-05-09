import 'package:flutter/material.dart';

class LessonDialog extends StatelessWidget {
  final Offset dialogPosition;
  const LessonDialog({required this.dialogPosition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: dialogPosition.dy - 50,
      left: dialogPosition.dx,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(12),
        child: Text('ARRRIBA'),
      ),
    );
  }
}
