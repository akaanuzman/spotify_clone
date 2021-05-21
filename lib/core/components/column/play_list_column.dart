import 'package:flutter/material.dart';

import '../container/image_container.dart';
import '../text/subtitle_one_text_copy.dart';

class PlayListColumn extends StatelessWidget {
  final int columnCount;
  final int rowCount;
  final EdgeInsets padding;
  final double width;
  final double height;
  final double? radius;
  final Color color;
  final List<String> path;
  final List<String> text;
  final Widget sizedBox;

  const PlayListColumn(
      {Key? key,
      required this.columnCount,
      required this.rowCount,
      required this.padding,
      required this.width,
      required this.height,
      required this.color,
      required this.path,
      required this.text,
      required this.sizedBox,
      this.radius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        columnCount,
        (count) {
          int counter = count;
          return Row(
            children: List.generate(
              rowCount,
              (index) => Padding(
                padding: padding,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(radius ?? 0)),
                  child: Row(
                    children: [
                      ImageContainer(
                        width: width / 3.15,
                        height: height,
                        path: path[counter += 3],
                        fit: BoxFit.cover,
                        radius: radius,
                      ),
                      sizedBox,
                      SubtitleOneTextCopy(
                        text: text[count += 3],
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
