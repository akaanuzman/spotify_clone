import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/align/align_center_left_text.dart';
import '../../../core/components/container/circle_button_container.dart';
import '../../../core/components/container/linear_gradient_container.dart';
import '../../../core/components/single_child_scroll_view/album.dart';
import '../../../core/components/text/headline6_text_copy.dart';
import '../../../core/components/text/subtitle_one_text_copy.dart';
import '../../../core/constants/album/album_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/icon/app_icon.dart';

class AlbumPageView extends StatefulWidget {
  final String path;
  final String text;
  final String likesAndHours;
  final Color color;
  final List<Color>? colors;
  const AlbumPageView(
      {Key? key,
      required this.path,
      required this.text,
      required this.likesAndHours,
      required this.color,
      this.colors})
      : super(key: key);

  @override
  _AlbumPageViewState createState() => _AlbumPageViewState();
}

class _AlbumPageViewState extends State<AlbumPageView> {
  late ScrollController _controller;
  double imageSize = 0;
  double initialSize = 240;
  double imageOpacity = 1;
  bool isAppBarHidden = false;
  ImageConstants get _imageConstants => ImageConstants.init();
  AlbumConstants get _constants => AlbumConstants.init();
  AppIcon get _appIcon => AppIcon.init();

  @override
  void initState() {
    imageSize = initialSize;
    _controller = ScrollController()
      ..addListener(() {
        imageSize = initialSize - _controller.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        if (_controller.offset > 200) {
          isAppBarHidden = true;
        } else {
          isAppBarHidden = false;
        }
        imageOpacity = imageSize / initialSize;
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildAnimatedImageContainer(context),
          _buildSafeArea(context),
          _buildAnimatedAppBarContainer(context)
        ],
      ),
    );
  }

  Container _buildAnimatedImageContainer(BuildContext context) => Container(
        color: widget.color,
        height: context.dynamicHeight(0.7),
        child: Padding(
          padding: context.verticalPaddingHigh,
          child: Opacity(
            opacity: imageOpacity.clamp(0, 1),
            child: _buildImageContainer(context),
          ),
        ),
      );

  Container _buildImageContainer(BuildContext context) => Container(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: context.blackWithOpacity(0.5),
                offset: Offset(0, 20),
                blurRadius: 32,
                spreadRadius: 16,
              )
            ],
          ),
          child: Image(
            image: AssetImage(widget.path),
            width: imageSize,
            height: imageSize,
          ),
        ),
      );

  SafeArea _buildSafeArea(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          child: _buildbAllColumn(context),
        ),
      );

  Column _buildbAllColumn(BuildContext context) => Column(
        children: [
          LinearGradientContainer(
            child: Padding(
              padding: EdgeInsets.only(top: context.lowValue),
              child: _buildMidArea(context),
            ),
            colors: [
              context.blackWithOpacity(0),
              context.blackWithOpacity(0),
              context.blackWithOpacity(1),
            ],
          ),
          _buildAlbumCardsContainer(context)
        ],
      );

  Column _buildMidArea(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: initialSize + 32,
          ),
          AlignCenterLeft(text: widget.text),
          context.emptySizedHeightBoxLow,
          Padding(
            padding: context.horizontalPaddingNormal,
            child: _buildSpotifyLogoAndText(context),
          ),
          _buildLikesAndHours(context),
          _buildIconsAndButtons(context)
        ],
      );

  Wrap _buildSpotifyLogoAndText(BuildContext context) => Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image(
            image: AssetImage(_imageConstants.logo),
            width: context.dynamicWidth(0.1),
          ),
          SubtitleOneTextCopy(text: _constants.spotify)
        ],
      );

  Padding _buildLikesAndHours(BuildContext context) => Padding(
        padding: context.paddingNormal,
        child: SubtitleOneTextCopy(
          text: widget.likesAndHours,
          color: context.whiteWithOpacity(0.8),
        ),
      );

  Stack _buildIconsAndButtons(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: context.horizontalPaddingNormal,
            child: _buildFavAndMoreIcon(context),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: _buildPlayAndShuffleButton(context),
          )
        ],
      );

  Row _buildFavAndMoreIcon(BuildContext context) => Row(
        children: [
          Icon(_appIcon.favIcon),
          context.emptySizedWidthBoxLow,
          Icon(_appIcon.moreIcon),
        ],
      );

  Stack _buildPlayAndShuffleButton(BuildContext context) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleButtonContainer(
            width: context.dynamicWidth(0.2),
            height: context.dynamicHeight(0.07),
            containerColor: context.errorColor,
            iconColor: context.colorSchemeBackground,
            icon: _appIcon.playIcon,
            iconSize: context.dynamicWidth(0.08),
          ),
          CircleButtonContainer(
            width: context.dynamicWidth(0.11),
            height: context.dynamicHeight(0.027),
            containerColor: context.blackWithOpacity(0.8),
            iconColor: context.errorColor,
            icon: _appIcon.shuffleIcon,
            iconSize: context.dynamicWidth(0.04),
          )
        ],
      );

  Container _buildAlbumCardsContainer(BuildContext context) => Container(
        height: context.dynamicHeight(1),
        color: context.colorSchemeBackground,
        padding: context.paddingNormal,
        child: _buildBottomColumn(context),
      );

  Column _buildBottomColumn(BuildContext context) => Column(
        children: [
          SubtitleOneTextCopy(
            text: _constants.loremIpsum,
            fontWeight: FontWeight.normal,
          ),
          context.emptySizedHeightBoxLow3x,
          AlignCenterLeft(
            text: _constants.fansAlsoLike,
            topPaddingValue: 0,
            leftPaddingValue: context.lowValue - 4,
          ),
          _buildAlbumCard(
              _imageConstants.albumListV3.length,
              _imageConstants.albumListV3,
              _constants.albumTitleV1,
              [context.colorSchemeError, context.colorSchemeOnSecondary],
              context),
          _buildAlbumCard(
              _imageConstants.albumListV4.length,
              _imageConstants.albumListV4,
              _constants.albumTitleV2,
              [context.colorSchemeSurface, context.colorSchemeSurface],
              context),
          _buildAlbumCard(
              _imageConstants.albumListV5.length,
              _imageConstants.albumListV5,
              _constants.albumTitleV3,
              [context.colorSchemeOnPrimary, context.colorSchemeSurface],
              context)
        ],
      );

  AlbumCard _buildAlbumCard(int lenght, List<String> paths, List<String> texts,
          List<Color> colors, BuildContext context) =>
      AlbumCard(
        lenght: lenght,
        paddingLeftValue: 0,
        paddingRightValue: context.lowValue,
        padding: context.horizontalPaddingLow,
        height: context.dynamicWidth(0.47),
        width: context.dynamicHeight(0.25),
        path: paths,
        text: texts,
        colorList: colors,
      );

  Positioned _buildAnimatedAppBarContainer(BuildContext context) => Positioned(
        child: AnimatedOpacity(
          duration: context.durationLow,
          opacity: isAppBarHidden ? 1 : 0,
          child: _buildAppBarContainer(context),
        ),
      );

  Container _buildAppBarContainer(BuildContext context) => Container(
        color: widget.color,
        child: SafeArea(
          child: Row(
            children: [
              _buildAppBarIconButton(context),
              _buildAppBarTitle(context)
            ],
          ),
        ),
      );

  IconButton _buildAppBarIconButton(BuildContext context) => IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          _appIcon.leftArrowIcon,
          size: context.dynamicWidth(0.08),
        ),
      );

  Padding _buildAppBarTitle(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: context.lowValue),
        child: Headline6TextCopy(text: widget.text),
      );
}
