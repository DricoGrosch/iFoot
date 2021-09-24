import 'package:app/controllers/group_controller.dart';
import 'package:flutter/cupertino.dart';

class GroupDetail extends StatelessWidget {
  final int id;
  const GroupDetail(this.id, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GroupController.fetchDetails(id),
        builder: (context, snapshot) {
          return Text('2');
        });
  }
}
