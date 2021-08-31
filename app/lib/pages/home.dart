import 'package:app/models/User.dart';
import 'package:app/pages/group_list.dart';
import 'package:app/pages/my_matches_list.dart';
import 'package:app/pages/other_matches_list.dart';
import 'package:app/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  List screens = [
    Profile(),
    MyMatchesList(),
    OtherMatchesList(),
    GroupList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bem vindo ${User.getAppUser().username}'),
          // automaticallyImplyLeading: false,
        ),
        body: screens[index],
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: FlutterLogo(),
                  accountName: Text(User.getAppUser().username),
                  accountEmail: Text('')),
              ListTile(
                title: const Text('Minhas partidas'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => {index = 1});
                },
              ),
              ListTile(
                title: const Text('Outras partidas'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => {index = 2});
                },
              ),
              ListTile(
                title: const Text('Meus Grupos'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => {index = 3});
                },
              ),
            ],
          ),
        ));
  }
}
