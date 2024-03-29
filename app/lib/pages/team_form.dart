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
  final Team team;

  const TeamForm({Key key, this.team}) : super(key: key);

  @override
  _TeamFormState createState() => _TeamFormState(team: team);
}

class _TeamFormState extends State<TeamForm> {
  Team team;
  File image;
  _TeamFormState({this.team});
  TeamController teamController = new TeamController();

  Future<void> selectImage(ImageSource source) async {
    XFile selected = await ImagePicker().pickImage(source: source);
    if (selected == null) {
      return;
    }
    setState(() {
      image = File(selected.path);
    });
  }

  @override
  void initState() {
    team = team ?? new Team();
    teamController.team = team;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                team.id != null ? Text(team.name) : Text('Criação de Grupo')),
        body: Column(
          children: [
            Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: team.image != null
                          ? NetworkImage(team.image)
                          : image != null
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
              initialValue: team.name ?? '',
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
              child: team.id != null
                  ? ElevatedButton(
                      child: Text('Editar grupo'),
                      onPressed: () async {
                        if (team.name == null || team.name.isEmpty) {
                          Utils.showSnackBar(
                              context, 'O campo nome é obrigatório;');
                          return;
                        }
                        var error = await teamController.update(image);
                        error != null
                            ? Utils.showSnackBar(context, error)
                            : Utils.showMessageDialog(context,
                                SuccessDialog(() {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (c) => HomePage(
                                              initialIndex: HomePage.TEAM_LIST,
                                            )),
                                    (route) => false);
                              }));
                      },
                    )
                  : ElevatedButton(
                      child: Text('Criar grupo'),
                      onPressed: () async {
                        if (team.name == null || team.name.isEmpty) {
                          Utils.showSnackBar(
                              context, 'O campo nome é obrigatório;');
                          return;
                        }
                        var error = await teamController.create(image);
                        error != null
                            ? Utils.showSnackBar(context, error)
                            : Utils.showMessageDialog(context,
                                SuccessDialog(() {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (c) => HomePage(
                                              initialIndex: HomePage.TEAM_LIST,
                                            )),
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
