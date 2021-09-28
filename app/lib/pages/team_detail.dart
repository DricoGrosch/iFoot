import 'package:app/controllers/team_controller.dart';
import 'package:app/pages/team_form.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widgets/rating_stars.dart';
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
                  appBar: AppBar(
                    title: Text('Detalhes'),
                  ),
                  body: SingleChildScrollView(
                    child: Center(
                      child: Column(children: [
                        TextButton(
                            onPressed: () => Utils.changePage(context,
                                (context) => TeamForm(team: snapshot.data)),
                            child: Icon(Icons.edit)),
                        Container(
                            width: 100,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: snapshot.data.getImage()),
                            )),
                        Text(snapshot.data.name),
                        ListView(
                          shrinkWrap: true,
                          children: snapshot.data.users.map<Widget>((user) {
                            return Card(
                              child: ListTile(
                                leading: Container(
                                  width: 60,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: user.getProfileImage()),
                                  ),
                                ),
                                title:
                                    Text('${user.firstName} ${user.lastName}'),
                                subtitle: RatingStars(4),
                              ),
                            );
                          }).toList(),
                        )
                      ]),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }
}
