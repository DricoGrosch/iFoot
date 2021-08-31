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
            return ListView(
                children: snapshot.data.map<Widget>((match) {
              return Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text(match['location']),
                  subtitle: Text(match['date']),
                  trailing: Icon(Icons.more_vert),
                ),
              );
            }).toList());
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
