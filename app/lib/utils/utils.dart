import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void changePage(context, targetBuilder) {
    Navigator.push(context, MaterialPageRoute(builder: targetBuilder));
  }

  static void showSnackBar(context, message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showMessageDialog(context, content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return content;
        });
  }
}
