import 'package:flutter/material.dart';

class AppIcon {
  static AppIcon? _instance;
  static AppIcon get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = AppIcon.init();
      return _instance!;
    }
  }

  AppIcon.init();

  IconData get homeIcon => Icons.home_filled;
  IconData get searchIcon => Icons.search;
  IconData get libraryIcon => Icons.my_library_music_outlined;
  IconData get settingsIcon => Icons.settings;
  IconData get replayIcon => Icons.replay;
  IconData get leftArrowIcon => Icons.keyboard_arrow_left;
  IconData get shuffleIcon => Icons.shuffle;
  IconData get playIcon => Icons.play_arrow;
  IconData get favIcon => Icons.favorite;
  IconData get moreIcon => Icons.more_horiz;
}
