import 'package:app/controllers/group_controller.dart';
import 'package:app/models/group.dart';
import 'package:app/pages/group_list.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GroupForm extends StatefulWidget {
  const GroupForm({Key key}) : super(key: key);

  @override
  _GroupFormState createState() => _GroupFormState();
}

class _GroupFormState extends State<GroupForm> {
  Group group = new Group();
  GroupController groupController = new GroupController();
  @override
  void initState() {
    groupController.group = group;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Criação de Grupo')),
        body: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            FormBuilderTextField(
              onChanged: (value) {
                setState(() {
                  group.name = value;
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
                  var error = await groupController.create();
                  error != null
                      ? Utils.showSnackBar(context, error)
                      : Utils.showMessageDialog(context, SuccessDialog(() {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (c) => GroupList()),
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
