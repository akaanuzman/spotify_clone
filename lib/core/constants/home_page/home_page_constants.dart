class HomePageConstants {
  static HomePageConstants? _instance;
  static HomePageConstants get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = HomePageConstants.init();
      return _instance!;
    }
  }

  HomePageConstants.init();

  final String recently = "Recently Played";
  final String goodEvening = "Good Evening";
  final String basedOnUrListening = "Based on your recent listening";
  final String recommendedRadio = "Recommended Radio";
  List<String> get recentlyPlayedText => [
        "Beast Mode",
        "Chill",
        "Mot6ivation Mix",
        "Power Gaming",
        "RapCaviar",
      ];
  List<String> get playListText => [
        "Power Gaming",
        "Satisfying",
        "RapCaviar",
        "Gaming Music",
        "RapCaviar",
        "Darkness",
        "Power Gaming",
        "Gaming Music",
        "Electro",
        "Satisfying",
        "Darkness",
        "Elekcro",
      ];
  List<String> get albumDescription => [
        "Hibshi, Rochelle, MIIA\n"
            "Elephante, bearbare, Al...\n",
        "Eminem, Akon, will.i.am\n"
            "Big Sean, Post Malone\n",
        "Halsey, Mostus,Veorra\n"
            "Doja Cat, Icona Pop\n",
        "Dwin, Gaullin, Alok\n"
            "Aero Chord, Echo, Drop...\n",
        "David Guetta, Sia\n"
            "Nicki Minaj, Usher, Lil...\n",
      ];

  List<String> get radioDescription => [
        "Lo-Fang, Vera Sola\n"
            "whenyoung, Odina, Vera...\n",
        "Axile, Elisha Sounds, ELEX\n"
            "CPX, Britt Lari, SOMMA...\n",
        "EQRIC, Emdi, Veorra\n"
            "Player1, Alpha Hex, Poy...\n",
        "Alok, Sevennn, VINAI\n"
            "3LAU, Ninja, MEDUZA...\n",
        "The Weekend, Travis Scott\n"
            "Nicki Minaj, 6ix9nine, Lil...\n",
      ];
}
