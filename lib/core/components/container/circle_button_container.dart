import 'package:flutter/material.dart';

class CircleButtonContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color containerColor;
  final Color iconColor;
  final IconData icon;
  final double iconSize;

  const CircleButtonContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.containerColor,
      required this.iconColor,
      required this.icon,
      required this.iconSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: containerColor, shape: BoxShape.circle),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
