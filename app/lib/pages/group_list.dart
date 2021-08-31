import 'package:app/models/User.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  const GroupList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: User.getAppUser().groups.map<Widget>((group) {
          return Card(
            child: ListTile(
              onTap: () => {},
              leading: Icon(Icons.people),
              title: Text(group.name),
            ),
          );
        }).toList()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
        ));
  }
}
