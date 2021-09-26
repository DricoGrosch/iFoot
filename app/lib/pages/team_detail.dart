import 'package:app/controllers/team_controller.dart';
import 'package:app/models/User.dart';
import 'package:app/pages/team_form.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamDetail extends StatelessWidget {
  final int id;
  const TeamDetail(this.id, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TeamController.fetchDetails(id),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  appBar: AppBar(),
                  body: Column(children: [
                    Text(snapshot.data.name),
                    TextButton(
                        onPressed: () {
                          Utils.changePage(
                              context,
                              (context) => TeamForm(
                                    team: snapshot.data,
                                  ));
                        },
                        child: Icon(Icons.edit))
                  ]),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
