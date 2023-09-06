import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatefulWidget {
  const FriendCard({
    super.key,
  });

  @override
  State<FriendCard> createState() => _FriendCardState();
}

@override
class _FriendCardState extends State<FriendCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2.0,
            color: DefaultTheme.grayscale[Grayscale.gray]!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: Container(
            height: 189,
            width: 152,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
