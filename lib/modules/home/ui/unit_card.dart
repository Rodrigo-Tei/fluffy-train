import 'package:fluffy_train/commons/text_styles.dart';
import 'package:fluffy_train/models/unit.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';

class UnitCard extends StatefulWidget {
  final bool isExpanded;
  final bool isFirst;
  final bool isLast;
  final Unit unit;
  const UnitCard({
    required this.isExpanded,
    required this.isFirst,
    required this.isLast,
    required this.unit,
    super.key,
  });

  @override
  State<UnitCard> createState() => _UnitCardState();
}

@override
class _UnitCardState extends State<UnitCard> {
  bool get isExpanded => widget.isExpanded;
  bool get isFirst => widget.isFirst;
  bool get isLast => widget.isLast;
  Unit get unit => widget.unit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.only(
          left: isFirst ? 24.0 : 16.0,
          right: isLast ? 24.0 : 0.0,
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
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              Text(
                unit.title,
                style: TextStyles.title2,
              ),
              const SizedBox(height: 6.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (String topic in unit.topics)
                    Text(
                      topic,
                      style: TextStyles.paragraph3,
                    ),
                  Container(
                    margin: const EdgeInsets.only(top: 6.0, bottom: 8.0),
                    width: 190,
                    height: isExpanded ? 8.0 : 0.0,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      child: LinearProgressIndicator(
                        value: unit.completePercentage,
                        valueColor: AlwaysStoppedAnimation(
                          DefaultTheme.rythm[Class.level4]!,
                        ),
                        backgroundColor:
                            DefaultTheme.grayscale[Grayscale.lightGray],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
