import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../padding/padding_title_text.dart';
import '../text/headline6_text_copy.dart';

class AlignCenterLeft extends StatelessWidget {
  final String text;
  final double? topPaddingValue;
  final double? leftPaddingValue;
  const AlignCenterLeft(
      {Key? key,
      required this.text,
      this.topPaddingValue,
      this.leftPaddingValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: PaddingTitleText(
        topValue: topPaddingValue ?? context.mediumValue,
        leftValue: leftPaddingValue ?? context.normalValue,
        widget: Headline6TextCopy(text: text),
      ),
    );
  }
}
