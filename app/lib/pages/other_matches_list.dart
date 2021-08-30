import 'package:app/controllers/match_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherMatchesList extends StatefulWidget {
  const OtherMatchesList({Key key}) : super(key: key);

  @override
  _OtherMatchesListState createState() => _OtherMatchesListState();
}

class _OtherMatchesListState extends State<OtherMatchesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MatchController.fetchMatches(onlyMines: false),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              for (var match in snapshot.data) Text(match['location'])
            ]);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
