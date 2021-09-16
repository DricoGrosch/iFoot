import 'package:app/models/match.dart';
import 'package:app/widgets/match_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchCreationStep4 extends StatelessWidget {
  final Match match;
  const MatchCreationStep4(this.match, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(alignment: AlignmentDirectional.topStart, children: <Widget>[
        Container(
          child: Image.asset(
            match.sport['backgroundImage'],
            fit: BoxFit.cover,
            height: 250,
          ),
          constraints: BoxConstraints.expand(height: 300),
        ),
        Container(
          margin: EdgeInsets.only(top: 190),
          height: 110,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Color(0x00736AB7),
            Colors.black,
          ], stops: [
            0,
            .95
          ], begin: FractionalOffset(0, 0), end: FractionalOffset(0, 1))),
        ),
        Container(
            margin: EdgeInsets.only(top: 180),
            child: Column(
              children: [
                MatchRow(match),
              ],
            )),
      ]),
    );
  }
}
