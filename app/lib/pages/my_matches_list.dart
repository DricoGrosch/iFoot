import 'package:app/controllers/match_controller.dart';
import 'package:app/models/match.dart';
import 'package:app/pages/match_creation.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widgets/match_list_item.dart';
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
        onPressed: () =>
            {Utils.changePage(context, (context) => MatchCreation())},
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
