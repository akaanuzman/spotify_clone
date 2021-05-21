import 'package:flutter/material.dart';

class LinearGradientContainer extends StatelessWidget {
  final List<Color> colors;
  final Widget child;

  const LinearGradientContainer(
      {Key? key, required this.colors, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
    );
  }
}
