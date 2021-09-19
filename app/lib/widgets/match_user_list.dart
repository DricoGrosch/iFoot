import 'package:app/models/match.dart';
import 'package:app/widgets/rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MatchUserList extends StatelessWidget {
  final Match match;
  const MatchUserList(this.match, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: match.users.map<Widget>((user) {
            return Card(
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: user.profileImage != null
                          ? NetworkImage(
                              user.profileImage,
                            )
                          : AssetImage('assets/images/default_user_image.png'),
                    ),
                  ),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: RatingStars(4),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
