import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  const RatingStars(this.rating, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Icon> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(Icon(
        Icons.star,
        color: i < rating ? Colors.yellow.shade400 : Colors.grey.shade400,
      ));
    }
    return Row(
      children: stars,
    );
  }
}
