import 'package:app/controllers/user_controller.dart';
import 'package:app/models/User.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/my_matches_list.dart';
import 'package:app/pages/other_matches_list.dart';
import 'package:app/pages/profile.dart';
import 'package:app/pages/team_list.dart';
import 'package:app/widgets/rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = new UserController(user: User.getAppUser());
  int index = 1;
  List screens = [
    Profile(),
    MyMatchesList(),
    OtherMatchesList(),
    TeamList(),
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
                accountName: Text(User.getAppUser().username),
                accountEmail: RatingStars(4),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: User.getAppUser().getProfileImage()),
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle),
                title: const Text('Minhas partidas'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => {index = 1});
                },
              ),
              ListTile(
                leading: Icon(Icons.person_search),
                title: const Text('Outras partidas'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => {index = 2});
                },
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Meus Grupos'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() => {index = 3});
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sair (n vai ficar aq)'),
                onTap: () async {
                  await userController.handleLogout();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (c) => LoginPage()),
                      (route) => false);
                },
              ),
            ],
          ),
        ));
  }
}
