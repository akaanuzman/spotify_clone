class AlbumConstants {
  static AlbumConstants? _instance;
  static AlbumConstants get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = AlbumConstants.init();
      return _instance!;
    }
  }

  AlbumConstants.init();
  final String spotify = "Spotify";

  List<String> get likesAndHours => [
        "18 likes 52h 43m",
        "556 likes 23h 12m",
        "6530 likes 11h 21m",
        "34 likes 44h 14m",
        "126 likes 145h 45m"
      ];
  List<String> get albumTitleV1 => [
        "The Weekend",
        "Eclipse",
      ];
  List<String> get albumTitleV2 => ["The Weekend", "Free World"];
  List<String> get albumTitleV3 => ["Kid Cudi", "David Guetta"];

  final String loremIpsum =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";
  final String fansAlsoLike = "Fans also like";
}
