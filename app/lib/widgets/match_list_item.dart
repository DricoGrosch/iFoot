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
        leading: match.getIcon(),
        title: Text(match.location),
        subtitle: Text(DateFormat('dd/MM/yyyy').add_jm().format(match.date)),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
