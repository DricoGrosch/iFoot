import 'package:app/models/User.dart';
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
  int index = 0;
  List screens = [
    MyMatchesList(),
    OtherMatchesList(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo ${User.getAppUser().username}'),
        automaticallyImplyLeading: false,
      ),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => {
          setState(() => {index = i})
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Minhas partidas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_search), label: 'Outras partidas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
