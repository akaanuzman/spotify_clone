import 'package:flutter/material.dart';

import '../../../feature/album_page/view/album_page_view.dart';
import '../../constants/album/album_constants.dart';
import '../container/image_container.dart';
import '../text/subtitle_one_text_copy.dart';

class AlbumCard extends StatelessWidget {
  final int lenght;
  final double paddingLeftValue;
  final double paddingRightValue;
  final EdgeInsets padding;
  final double height;
  final double? width;
  final List<String> path;
  final List<String> text;
  final List<Color> colorList;
  final FontWeight? fontWeight;

  AlbumConstants get _constants => AlbumConstants.init();

  const AlbumCard(
      {Key? key,
      required this.lenght,
      required this.paddingLeftValue,
      required this.paddingRightValue,
      required this.padding,
      required this.height,
      this.width,
      required this.colorList,
      required this.path,
      required this.text,
      this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          lenght,
          (index) => Padding(
            padding: index == 0
                ? EdgeInsets.fromLTRB(paddingLeftValue, 0, paddingRightValue, 0)
                : padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AlbumPageView(
                          path: path[index],
                          text: text[index],
                          likesAndHours: _constants.likesAndHours[index],
                          color: colorList[index],
                        ),
                      ),
                    );
                  },
                  child: ImageContainer(
                    height: height,
                    path: path[index],
                    width: width,
                  ),
                ),
                SubtitleOneTextCopy(
                  text: text[index],
                  fontWeight: fontWeight ?? FontWeight.normal,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
