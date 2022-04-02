enum Language {
  EN,
  FR,
  DE,
  AR,
}

enum Layout {
  QWERTY,
  QWERTZ,
  AZERTY,
  ARABIC,
}

var languageConfig = {
  Language.EN: englishConfig,
  Language.FR: frenchConfig,
  Language.DE: germanConfig,
  Language.AR: arabicConfig,
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
