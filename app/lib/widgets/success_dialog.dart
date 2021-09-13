import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatelessWidget {
  final Function successCallback;
  const SuccessDialog(this.successCallback, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          Lottie.asset('assets/animations/success.json'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
                child: Text("Success"),
                textStyle: TextStyle(color: Colors.green, fontSize: 40)),
          ),
          ElevatedButton(
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => successCallback())
        ],
      ),
    );
  }
}
