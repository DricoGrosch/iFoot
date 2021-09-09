import 'package:app/controllers/login_controller.dart';
import 'package:app/models/User.dart';
import 'package:app/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User.getAppUser();
  LoginController loginController = new LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
            child: Form(
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 48.0),
                  TextFormField(
                    onChanged: (value) =>
                        {setState(() => user.username = value)},
                    decoration: InputDecoration(
                      hintText: 'Username',
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
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          onPressed: () async => {
                            if (!await loginController.handleLogin(user))
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Credenciais inválidas')))
                              }
                            else
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()))
                              }
                          },
                          child: Text('LOGIN',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Esqueceu sua senha ?',
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
