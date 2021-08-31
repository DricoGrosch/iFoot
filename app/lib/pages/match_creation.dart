import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchCreation extends StatefulWidget {
  const MatchCreation({Key key}) : super(key: key);

  @override
  _MatchCreationState createState() => _MatchCreationState();
}

class _MatchCreationState extends State<MatchCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MAMAKI')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Form(
              child: Column(
            children: [],
          )),
        ),
      ),
    );
  }
}
