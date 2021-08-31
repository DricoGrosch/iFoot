import 'package:app/controllers/match_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMatchesList extends StatefulWidget {
  const MyMatchesList({Key key}) : super(key: key);

  @override
  _MyMatchesListState createState() => _MyMatchesListState();
}

class _MyMatchesListState extends State<MyMatchesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MatchController.fetchMatches(),
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
