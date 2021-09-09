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
    print('object');
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView(
          children: Sport.getSports().map<Widget>((sport) {
        return Card(
          child: ListTile(
            selected: match.sport != null ? match.sport == sport : false,
            selectedTileColor: Colors.grey,
            onTap: () => {setState(() => match.sport = sport)},
            leading: Image.asset(sport['icon']),
            title: Text(sport['name']),
          ),
        );
      }).toList()),
    );
  }
}
