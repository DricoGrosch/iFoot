import 'package:app/controllers/team_controller.dart';
import 'package:app/models/team.dart';
import 'package:app/pages/team_detail.dart';
import 'package:app/pages/team_form.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class TeamList extends StatefulWidget {
  const TeamList({Key key}) : super(key: key);

  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TeamController.fetchTeams(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: 1), () {
                      setState(() {});
                    });
                  },
                  child: Scaffold(
                      body: ListView(
                          children: snapshot.data.map<Widget>((data) {
                        Team team = Team.fromJson(data);
                        return Card(
                          child: ListTile(
                            onTap: () => {
                              Utils.changePage(
                                  context, (context) => TeamDetail(team.id))
                            },
                            leading: Container(
                              width: 60,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: team.getImage()),
                              ),
                            ),
                            title: Text(team.description),
                          ),
                        );
                      }).toList()),
                      floatingActionButton: FloatingActionButton(
                        onPressed: () => {
                          Utils.changePage(context, (context) => TeamForm())
                        },
                        backgroundColor: Colors.black,
                        child: Icon(Icons.add),
                      )))
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
