import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void changePage(_context, targetBuilder) {
    Navigator.push(_context, MaterialPageRoute(builder: targetBuilder));
  }

  static void showSnackBar(_context, message) {
    ScaffoldMessenger.of(_context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showMessageDialog(context, content) {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return content;
        });
  }
}
