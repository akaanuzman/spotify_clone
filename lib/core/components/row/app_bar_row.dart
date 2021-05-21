import 'package:flutter/material.dart';

import '../text/headline6_text_copy.dart';

class AppBarRow extends StatelessWidget {
  final String text;
  final double spacing;
  final IconData firstIcon;
  final IconData secondIcon;

  const AppBarRow(
      {Key? key,
      required this.text,
      required this.spacing,
      required this.firstIcon,
      required this.secondIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Headline6TextCopy(text: text),
        Wrap(
          spacing: spacing,
          children: [Icon(firstIcon), Icon(secondIcon)],
        )
      ],
    );
  }
}
