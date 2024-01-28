enum Language {
  EN,
  FR,
  DE,
  AR,
  TR,
}

enum Layout {
  QWERTY,
  QWERTZ,
  AZERTY,
  ARABIC,
  FTURKISH,

  /// Layout which includes only turkish alphabet letters, for games and educational content
  PURETURKISH,
}

var languageConfig = {
  Language.EN: englishConfig,
  Language.FR: frenchConfig,
  Language.DE: germanConfig,
  Language.AR: arabicConfig,
  Language.TR: turkishConfig,
};

// Languages Configurations

var englishConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopasdfghjklzxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
  Layout.QWERTZ: <String, String>{
    'layout': 'qwertzuiopasdfghjklyxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
};

var frenchConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopasdfghjklzxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
  Layout.AZERTY: <String, String>{
    'layout': 'azertyuiopqsdfghjklmwxcvbn',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
};

var germanConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopüasdfghjklöäzxcvbnmß',
    'horizontalSpacing': '2.5',
    'topLength': '11',
    'middleLength': '11',
  },
  Layout.QWERTZ: <String, String>{
    'layout': 'qwertzuiopüasdfghjklöäyxcvbnmß',
    'horizontalSpacing': '2.5',
    'topLength': '11',
    'middleLength': '11',
  },
};

var arabicConfig = {
  Layout.ARABIC: <String, String>{
    'layout': 'ثةورزدذطظكمنتالبيسشجحخهعغفقصض',
    'horizontalSpacing': '2.8',
    'topLength': '11',
    'middleLength': '10',
  },
};

var turkishConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuıopğüasdfghjklşizxcvbnmöç',
    'horizontalSpacing': '2.0',
    'topLength': '12',
    'middleLength': '11',
  },
  Layout.FTURKISH: <String, String>{
    'layout': 'fgğıodrnhpqwuieaütkmlyşxjövcçzsb',
    'horizontalSpacing': '2.0',
    'topLength': '12',
    'middleLength': '12',
  },
  Layout.PURETURKISH: <String, String>{
    'layout': 'ertyuıopğüasdfghjklşizcvbnmöç',
    'horizontalSpacing': '2.0',
    'topLength': '10',
    'middleLength': '11',
  },
};
