import 'package:flutter/material.dart';

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
    'color': Colors.green,
    'icon': Icons.sports_soccer,
    'backgroundImage': 'assets/images/soccer_background.jpg',
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
    'color': Colors.blue,
    'icon': Icons.sports_soccer,
    'backgroundImage': 'assets/images/indoor_soccer_background.jpg',
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
    'color': Colors.yellow,
    'icon': Icons.sports_volleyball,
    'backgroundImage': 'assets/images/volei_background.jpg',
  };
  static const Map<String, dynamic> BASKETBALL = {
    'id': 4,
    'name': 'BASQUETEBOL',
    'positions': {},
    'color': Colors.orange,
    'icon': Icons.sports_basketball,
    'backgroundImage': 'assets/images/basketball_background.jpg',
  };
  static const Map<String, dynamic> TENIS = {
    'id': 5,
    'name': 'TÊNIS',
    'positions': {},
    'color': Colors.green,
    'icon': Icons.sports_tennis,
    'backgroundImage': 'assets/images/tenis_background.jpg',
  };
  static const Map<String, dynamic> BIKE = {
    'id': 6,
    'name': 'BIKE',
    'positions': {},
    'color': Colors.brown,
    'icon': Icons.directions_bike,
    'backgroundImage': 'assets/images/bike_background.jpg',
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
    return null;
  }
}
