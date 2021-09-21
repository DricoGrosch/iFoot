import 'package:app/controllers/group_controller.dart';
import 'package:app/models/User.dart';
import 'package:app/models/group.dart';
import 'package:app/pages/group_form.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  const GroupList({Key key}) : super(key: key);

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GroupController.fetchGroups(),
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
                        Group group = Group.fromJson(data);
                        return Card(
                          child: ListTile(
                            onTap: () => {},
                            leading: Icon(Icons.people),
                            title: Text(group.name),
                          ),
                        );
                      }).toList()),
                      floatingActionButton: FloatingActionButton(
                        onPressed: () => {
                          Utils.changePage(context, (context) => GroupForm())
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
