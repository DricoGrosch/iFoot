import 'package:app/pages/match_detail.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/models/match.dart';

class MatchListItem extends StatelessWidget {
  final Match match;
  const MatchListItem({Key key, this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Utils.changePage(context, (context) => MatchDetail(match.id));
        },
        leading: Container(
          child: Icon(
            match.getIcon(),
            color: Colors.black,
          ),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: match.sport['color'],
              borderRadius: BorderRadius.circular(100)),
        ),
        title: Row(children: [
          Text(match.location),
          !match.public
              ? Icon(
                  Icons.lock,
                  size: 15,
                )
              : Container()
        ]),
        subtitle: Text(
            "${match.users.length}/${match.maxMembers} ${DateFormat('dd/MM/yyyy').add_Hm().format(match.date)}"),
      ),
    );
  }
}
