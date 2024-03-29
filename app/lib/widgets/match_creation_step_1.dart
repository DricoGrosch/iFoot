import 'package:app/models/match.dart';
import 'package:app/models/sport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchCreationStep1 extends StatelessWidget {
  final Match match;
  final Function setState;
  const MatchCreationStep1(this.match, this.setState, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: Sport.getSports().map<Widget>((sport) {
        return Card(
          child: ListTile(
            selected: match.sport != null ? match.sport == sport : false,
            selectedTileColor: Colors.grey,
            onTap: () => {setState(() => match.sport = sport)},
            leading: Container(
              child: Icon(
                sport['icon'],
                color: Colors.black,
              ),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: sport['color'],
                  borderRadius: BorderRadius.circular(100)),
            ),
            title: Text(sport['name']),
          ),
        );
      }).toList()),
    );
  }
}
