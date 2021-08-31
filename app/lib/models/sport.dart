class Sport {
  static const Map<String, dynamic> SOCCER = {
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
    'name': 'BASQUETEBOL',
    'positions': {},
    'icon': 'assets/images/basketball.png',
  };
  static const Map<String, dynamic> TENIS = {
    'name': 'TÊNIS',
    'positions': {},
    'icon': 'assets/images/tenis.png',
  };
  static const Map<String, dynamic> BIKE = {
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
}
