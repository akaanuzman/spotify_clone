import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/align/align_center_left_text.dart';
import '../../../core/components/column/play_list_column.dart';
import '../../../core/components/container/linear_gradient_container.dart';
import '../../../core/components/padding/padding_title_text.dart';
import '../../../core/components/row/app_bar_row.dart';
import '../../../core/components/single_child_scroll_view/album.dart';
import '../../../core/constants/home_page/home_page_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/icon/app_icon.dart';

class HomePageView extends StatelessWidget {
  ImageConstants get _imageConstants => ImageConstants.init();
  HomePageConstants get _constants => HomePageConstants.init();
  AppIcon get _appIcon => AppIcon.init();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Stack _buildBody(BuildContext context) => Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: context.dynamicHeight(0.32),
          ),
          _buildSingleChildScrollView(context),
        ],
      );

  SingleChildScrollView _buildSingleChildScrollView(BuildContext context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildTopAreaBackground(context),
            AlignCenterLeft(text: _constants.goodEvening),
            _buildPlayListColumn(context),
            AlignCenterLeft(text: _constants.basedOnUrListening),
            _buildAlbumCard(
                _imageConstants.albumList.length,
                context.dynamicHeight(0.25),
                context.dynamicWidth(0.42),
                _imageConstants.albumListV2,
                _constants.albumDescription,
                [
                  context.colorSchemeOnSecondary,
                  context.colorSchemeSecondary,
                  context.colorSchemeSecondaryVariant,
                  context.colorSchemeSurface,
                  context.colorSchemeSurface,
                ],
                context),
            AlignCenterLeft(
              text: _constants.recommendedRadio,
              topPaddingValue: 0,
            ),
            _buildAlbumCard(
                _imageConstants.albumList.length,
                context.dynamicHeight(0.25),
                context.dynamicWidth(0.42),
                _imageConstants.radioList,
                _constants.radioDescription,
                [
                  context.colorSchemeSurface,
                  context.colorSchemeOnError,
                  context.primaryColor,
                  context.colorSchemeSurface,
                  context.colorSchemeError,
                ],
                context)
          ],
        ),
      );

  Container _buildTopAreaBackground(BuildContext context) => Container(
        height: context.dynamicHeight(0.33),
        decoration: BoxDecoration(
          color: context.accentColor,
        ),
        child: LinearGradientContainer(
          colors: [context.blackWithOpacity(0), context.blackWithOpacity(0.9)],
          child: _buildTopArea(context),
        ),
      );

  SafeArea _buildTopArea(BuildContext context) => SafeArea(
        child: Column(
          children: [
            _buildAppBar,
            _buildAlbumCard(
                _imageConstants.albumList.length,
                context.dynamicHeight(0.2),
                context.dynamicWidth(0.32),
                _imageConstants.albumList,
                _constants.recentlyPlayedText,
                [
                  context.colorSchemeOnError,
                  context.colorSchemeOnSecondary,
                  context.colorSchemeOnSurface,
                  context.colorSchemeOnBackground,
                  context.colorSchemeOnPrimary
                ],
                context)
          ],
        ),
      );

  PaddingTitleText get _buildAppBar => PaddingTitleText(
        widget: AppBarRow(
            text: _constants.recently,
            spacing: 15,
            firstIcon: _appIcon.replayIcon,
            secondIcon: _appIcon.settingsIcon),
      );

  PlayListColumn _buildPlayListColumn(BuildContext context) => PlayListColumn(
        columnCount: 3,
        rowCount: 2,
        padding: EdgeInsets.fromLTRB(context.normalValue, context.lowValue,
            context.normalValue, context.lowValue),
        width: context.dynamicWidth(0.424),
        height: context.dynamicHeight(0.075),
        radius: context.lowValue,
        color: context.colorSchemePrimaryVariant,
        path: _imageConstants.playList,
        text: _constants.playListText,
        sizedBox: context.emptySizedWidthBoxLow,
      );

  AlbumCard _buildAlbumCard(
          int lenght,
          double height,
          double width,
          List<String> paths,
          List<String> texts,
          List<Color> colors,
          BuildContext context) =>
      AlbumCard(
        lenght: lenght,
        paddingLeftValue: context.normalValue,
        paddingRightValue: context.lowValue,
        padding: context.horizontalPaddingLow,
        height: height,
        width: width,
        path: paths,
        text: texts,
        colorList: colors,
      );
}
