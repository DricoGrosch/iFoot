import 'package:app/controllers/team_controller.dart';
import 'package:flutter/cupertino.dart';

class TeamDetail extends StatelessWidget {
  final int id;
  const TeamDetail(this.id, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TeamController.fetchDetails(id),
        builder: (context, snapshot) {
          return Text('2');
        });
  }
}
