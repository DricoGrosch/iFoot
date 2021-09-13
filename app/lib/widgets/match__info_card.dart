import 'package:app/models/match.dart';
import 'package:flutter/cupertino.dart';

class MatchInfoCard extends StatelessWidget {
  final Match match;
  const MatchInfoCard(this.match, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: match.calcDistance(),
        builder: (context, snapshot) {
          return Text('');
        });
  }
}
