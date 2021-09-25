import 'dart:io';

import 'package:app/controllers/team_controller.dart';
import 'package:app/models/team.dart';
import 'package:app/pages/home.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

class TeamForm extends StatefulWidget {
  const TeamForm({Key key}) : super(key: key);

  @override
  _TeamFormState createState() => _TeamFormState();
}

class _TeamFormState extends State<TeamForm> {
  Team team = new Team();
  File image;

  Future<void> selectImage(ImageSource source) async {
    XFile selected = await ImagePicker().pickImage(source: source);
    setState(() {
      image = File(selected.path);
    });
  }

  TeamController teamController = new TeamController();
  @override
  void initState() {
    teamController.team = team;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Criação de Grupo')),
        body: Column(
          children: [
            Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: image != null
                          ? FileImage(image)
                          : AssetImage(
                              'assets/images/default_user_image.png'))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      selectImage(ImageSource.gallery);
                    },
                    child: Icon(Icons.photo_library)),
                TextButton(
                    onPressed: () {
                      selectImage(ImageSource.camera);
                    },
                    child: Icon(Icons.camera_alt))
              ],
            ),
            FormBuilderTextField(
              onChanged: (value) {
                setState(() {
                  team.name = value;
                });
              },
              name: 'name',
              decoration: InputDecoration(
                hintText: 'Nome do grupo',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Criar grupo'),
                onPressed: () async {
                  var error = await teamController.create(image);
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
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }
}
