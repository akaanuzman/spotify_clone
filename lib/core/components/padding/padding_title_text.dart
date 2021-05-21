import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PaddingTitleText extends StatelessWidget {
  final Widget widget;
  final double? topValue;
  final double? leftValue;

  const PaddingTitleText(
      {Key? key, required this.widget, this.topValue, this.leftValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftValue ?? context.normalValue,
          topValue ?? context.mediumValue, context.normalValue, 0),
      child: widget,
    );
  }
}
