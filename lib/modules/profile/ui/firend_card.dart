import 'package:fluffy_train/commons/text_styles.dart';
import 'package:fluffy_train/modules/profile/ui/profile_placeholder.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  const FriendCard(
    this.isFirst,
    this.isLast, {
    super.key,
  });

  @override
  State<FriendCard> createState() => _FriendCardState();
}

@override
class _FriendCardState extends State<FriendCard> {
  bool get isFirst => widget.isFirst;
  bool get isLast => widget.isLast;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.only(
          left: isFirst ? 12.0 : 4.0,
          right: isLast ? 12.0 : 4.0,
        ),
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
          child: SizedBox(
            height: 200,
            width: 152,
            child: isLast
                ? Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: DefaultTheme.reds[Reds.crismon],
                      ),
                      onPressed: () {},
                      child: Text(
                        'Ver mais',
                        style: TextStyles.highlight3White,
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          profilePlaceholder(64.0),
                          Text(
                            'Name Placeholder',
                            style: TextStyles.paragraph1,
                          ),
                          Text(
                            'Média diária: 30 horas',
                            style: TextStyles.paragraph4,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: DefaultTheme.reds[Reds.crismon],
                        ),
                        onPressed: () {},
                        child: Text(
                          'Ver estatísticas',
                          style: TextStyles.highlight3White,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
