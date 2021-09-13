import 'package:app/models/match.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchRow extends StatelessWidget {
  final Match match;
  const MatchRow(this.match, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: match.sport['color']),
            child: Icon(
              match.getIcon(),
              size: 100,
            ),
          ),
        ),
      ],
    );
  }
}
