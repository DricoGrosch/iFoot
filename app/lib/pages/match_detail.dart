import 'package:app/controllers/match_controller.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/models/User.dart';
import 'package:app/widgets/match_row.dart';
import 'package:app/widgets/match_user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MatchDetail extends StatefulWidget {
  final int id;
  const MatchDetail(this.id, {Key key}) : super(key: key);

  @override
  _MatchDetailState createState() => _MatchDetailState(id);
}

class _MatchDetailState extends State<MatchDetail> {
  final int id;
  _MatchDetailState(this.id);
  UserController userController = new UserController(user: User.getAppUser());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MatchController.fetchDetails(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List users = snapshot.data.users;
            var alreadySubscribed = users.firstWhereOrNull((user) {
                  return userController.user.id.toInt() == user.id.toInt();
                }) !=
                null;
            return Scaffold(
              appBar: AppBar(
                title: Text('Detalhes'),
              ),
              body: SingleChildScrollView(
                child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          snapshot.data.sport['backgroundImage'],
                          fit: BoxFit.cover,
                          height: 300,
                        ),
                        constraints: BoxConstraints.expand(height: 300),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 190),
                        height: 110,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: <Color>[
                              Color(0x00736AB7),
                              Colors.black,
                            ],
                                stops: [
                              0,
                              .95
                            ],
                                begin: FractionalOffset(0, 0),
                                end: FractionalOffset(0, 1))),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 210),
                          child: Column(
                            children: [
                              MatchRow(snapshot.data),
                              MatchUserList(snapshot.data),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(0.5))),
                                      onPressed: () {
                                        userController.unsubscribeToMatch(id);
                                        setState(() {});
                                      },
                                      child: Text('Revogar vaga')),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withOpacity(0.7))),
                                      onPressed: () {
                                        userController.subscribeToMatch(id);
                                        setState(() {});
                                      },
                                      child: Text('Confirmar presença')),
                                ],
                              )
                            ],
                          )),
                    ]),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
