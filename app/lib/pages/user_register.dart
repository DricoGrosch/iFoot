import 'package:app/controllers/user_controller.dart';
import 'package:app/models/User.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/login.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key key}) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  User user = new User();
  UserController userController = new UserController();
  @override
  void initState() {
    userController.user = user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          FormBuilderTextField(
            onChanged: (value) {
              setState(() {
                user.firstName = value;
              });
            },
            name: 'firstName',
            decoration: InputDecoration(
              hintText: 'Primeiro Nome',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
          FormBuilderTextField(
            onChanged: (value) {
              setState(() {
                user.lastName = value;
              });
            },
            name: 'lastName',
            decoration: InputDecoration(
              hintText: 'Último Nome',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
          FormBuilderTextField(
            onChanged: (value) {
              setState(() {
                user.username = value;
              });
            },
            name: 'username',
            decoration: InputDecoration(
              hintText: 'username',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
          FormBuilderTextField(
            onChanged: (value) {
              setState(() {
                user.password = value;
              });
            },
            name: 'password1',
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Senha',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
          FormBuilderTextField(
            onChanged: (value) {
              setState(() {
                user.password2 = value;
              });
            },
            name: 'password2',
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Confirmação da senha',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Criar conta'),
              onPressed: () async {
                var error = await userController.register();
                error != null
                    ? Utils.showSnackBar(context, error)
                    : Utils.showMessageDialog(context, SuccessDialog(() {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (c) => HomePage()),
                            (route) => false);
                      }));
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Cancelar'),
              onPressed: () {
                Utils.changePage(context, (context) => LoginPage());
              },
            ),
          )
        ],
      )),
    );
  }
}
