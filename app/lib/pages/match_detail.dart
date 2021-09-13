import 'package:app/controllers/match_controller.dart';
import 'package:app/widgets/matchRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchDetail extends StatefulWidget {
  final int id;
  const MatchDetail(this.id, {Key key}) : super(key: key);

  @override
  _MatchDetailState createState() => _MatchDetailState(id);
}

class _MatchDetailState extends State<MatchDetail> {
  final int id;
  _MatchDetailState(this.id);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MatchController.fetchDetails(id),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  appBar: AppBar(
                    title: Text('Detalhes'),
                    // automaticallyImplyLeading: false,
                  ),
                  body: Container(
                    constraints: BoxConstraints.expand(),
                    color: Colors.black,
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
                                children: [MatchRow(snapshot.data)],
                              )),
                        ]),
                  ))
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
