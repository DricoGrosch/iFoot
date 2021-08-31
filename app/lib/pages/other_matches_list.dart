import 'package:app/controllers/match_controller.dart';
import 'package:app/models/match.dart';
import 'package:app/pages/sport_selector.dart';
import 'package:app/widgets/match_list_item.dart';
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
    return Scaffold(
      body: FutureBuilder(
          future: MatchController.fetchMatches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children: snapshot.data.map<Widget>((json) {
                return MatchListItem(match: Match.fromJson(json));
              }).toList());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SportSelector()))
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
