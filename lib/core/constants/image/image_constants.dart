import '../app/app_constants.dart';

class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = ImageConstants.init();
      return _instance!;
    }
  }

  ImageConstants.init();

  String get logo => _getImagePath("logo.png");
  List<String> get albumList => _getAlbumList;
  List<String> get playList => _getPlayList;
  List<String> get albumListV2 => _getAlbumListV2;
  List<String> get radioList => _getRadioList;
  List<String> get albumListV3 =>
      [_getImagePath("album10.jpg"), _getImagePath("album12.jpg")];
        List<String> get albumListV4 =>
      [_getImagePath("album11.jpg"), _getImagePath("album13.jpg")];
              List<String> get albumListV5 =>
      [_getImagePath("album14.jpg"), _getImagePath("album19.jpg")];

  String _getImagePath(String name) =>
      "${ApplicationConstants.IMAGE_PATH}$name";

  List<String> get _getAlbumList {
    List<String> albumList = [];
    for (var i = 0; i < 5; i++) {
      String value = "album${i + 1}.jpg";
      albumList.add("${ApplicationConstants.IMAGE_PATH}$value");
    }
    return albumList;
  }

  List<String> get _getPlayList {
    List<String> playList = [];
    for (var i = 0; i < 14; i++) {
      String value = "album${i + 1}.jpg";
      playList.add("${ApplicationConstants.IMAGE_PATH}$value");
    }
    return playList;
  }

  List<String> get _getAlbumListV2 {
    List<String> albumListV2 = [];
    for (var i = 14; i < 19; i++) {
      String value = "album${i + 1}.jpg";
      albumListV2.add("${ApplicationConstants.IMAGE_PATH}$value");
    }
    return albumListV2;
  }

  List<String> get _getRadioList {
    List<String> radioList = [];
    for (var i = 5; i < 10; i++) {
      String value = "album${i + 1}.jpg";
      radioList.add("${ApplicationConstants.IMAGE_PATH}$value");
    }
    return radioList;
  }
}
