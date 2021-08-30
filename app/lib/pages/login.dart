import 'package:app/controllers/login_controller.dart';
import 'package:app/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User.getAppUser();
  bool showErrors = false;
  LoginController loginController = new LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
            child: Form(
              child: Column(
                children: [
                  Icon(
                    Icons.sports_soccer_outlined,
                    color: Colors.blue,
                    size: 130,
                  ),
                  SizedBox(height: 48.0),
                  TextFormField(
                    onChanged: (value) =>
                        {setState(() => user.username = value)},
                    decoration: InputDecoration(
                      hintText: 'Username',
                      errorText: showErrors ? 'Este campo é obrigatório' : null,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    onChanged: (value) =>
                        {setState(() => user.password = value)},
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: showErrors ? 'Este campo é obrigatório' : null,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async => {
                        if (!await loginController.handleLogin(user))
                          {
                            setState(() => {showErrors = true})
                          }
                        else
                          {
                            setState(() => {showErrors = false})
                            // Navigator.push(context, route)
                          }
                      },
                      child:
                          Text('LOGIN', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text(
                      'Não possui uma conta ?',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
