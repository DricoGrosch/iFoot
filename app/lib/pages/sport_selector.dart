import 'package:app/models/sport.dart';
import 'package:app/pages/match_creation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SportSelector extends StatelessWidget {
  const SportSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione a modalidade'),
      ),
      body: ListView(
          children: Sport.getSports().map<Widget>((group) {
        return Card(
          child: ListTile(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MatchCreation()))
            },
            leading: Image.asset(group['icon']),
            title: Text(group['name']),
          ),
        );
      }).toList()),
    );
  }
}
