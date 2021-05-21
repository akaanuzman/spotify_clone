import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ImageContainer extends StatelessWidget {
  final double height;
  final double? width;
  final String path;
  final BoxFit? fit;
  final double? radius;

  const ImageContainer(
      {Key? key,
      required this.height,
      this.width,
      required this.path,
      this.fit,
      this.radius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? context.dynamicWidth(0.32),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              path,
            ),
            fit: fit ?? BoxFit.contain),
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
    );
  }
}
