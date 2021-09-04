class Sport {
  static const Map<String, dynamic> SOCCER = {
    'id': 1,
    'name': 'FUTEBOL DE CAMPO',
    'positions': {
      'GK': 'Goleiro',
      'DEF': 'Defensor',
      'MID': 'Meio de campo',
      'ATA': 'Atacante',
      'ANY': 'Indiferente'
    },
    'icon': 'assets/images/soccer.png',
  };
  static const Map<String, dynamic> INDOOR_SOCCER = {
    'id': 2,
    'name': 'FUTSAL',
    'positions': {
      'GK': 'Goleiro',
      'DEF': 'Defensor',
      'ATA': 'Atacante',
      'ANY': 'Indiferente'
    },
    'icon': 'assets/images/soccer.png',
  };

  static const Map<String, dynamic> VOLLEYBAL = {
    'id': 3,
    'name': 'VOLEIBOL',
    'positions': {
      'LEV': 'Levantador',
      'LIB': 'Líbero',
      'CEN': 'Central',
      'PON': 'Ponteiro',
      'ANY': 'Indiferente'
    },
    'icon': 'assets/images/volei.png',
  };
  static const Map<String, dynamic> BASKETBALL = {
    'id': 4,
    'name': 'BASQUETEBOL',
    'positions': {},
    'icon': 'assets/images/basketball.png',
  };
  static const Map<String, dynamic> TENIS = {
    'id': 5,
    'name': 'TÊNIS',
    'positions': {},
    'icon': 'assets/images/tenis.png',
  };
  static const Map<String, dynamic> BIKE = {
    'id': 6,
    'name': 'BIKE',
    'positions': {},
    'icon': 'assets/images/bike.png',
  };

  static List getSports() {
    return [
      INDOOR_SOCCER,
      SOCCER,
      VOLLEYBAL,
      BASKETBALL,
      TENIS,
      BIKE,
    ];
  }

  static Map<String, dynamic> get(String name) {
    switch (name) {
      case '1':
        {
          return Sport.SOCCER;
        }
      case '2':
        {
          return Sport.INDOOR_SOCCER;
        }
      case '3':
        {
          return Sport.VOLLEYBAL;
        }
      case '4':
        {
          return Sport.BASKETBALL;
        }
      case '5':
        {
          return Sport.TENIS;
        }
      case '6':
        {
          return Sport.BIKE;
        }
    }
  }
}
