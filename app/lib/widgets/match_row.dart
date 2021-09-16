import 'package:app/models/match.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class MatchRow extends StatelessWidget {
  final Match match;
  const MatchRow(this.match, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Center(
              child: Container(
                  margin: EdgeInsets.only(
                    top: 65,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(match.location.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                !match.public ? Icon(Icons.lock) : Container(),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            !match.public
                                ? Text(match.group.name)
                                : Container(),
                            Text(
                              DateFormat('dd/MM/yyyy')
                                  .add_Hm()
                                  .format(match.date),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 2),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.alt_route),
                                FutureBuilder(
                                    future: match.calcDistance(),
                                    builder: (context, snapshot) {
                                      return snapshot.hasData
                                          ? Text(
                                              ' ${(snapshot.data / 1000).toStringAsFixed(2)} Km',
                                              style: TextStyle(fontSize: 15))
                                          : Text('');
                                    })
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.groups),
                                Text(
                                    ' ${match.users.length}/${match.maxMembers}')
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
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
