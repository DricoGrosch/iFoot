import 'package:app/models/User.dart';
import 'package:app/models/match.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchCreationStep3 extends StatelessWidget {
  final Match match;
  final Function setState;
  const MatchCreationStep3(this.match, this.setState, {Key key})
      : super(key: key);
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        match.date = new DateTime(picked.year, picked.month, picked.day,
            match.date.hour, match.date.minute, 0);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        match.date = new DateTime(match.date.year, match.date.month,
            match.date.day, picked.hour, picked.minute, 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Container(
              child: Column(
        children: [
          Container(
              child: Center(
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Privada'),
              Radio(
                value: false,
                onChanged: (value) => {
                  setState(() => {match.public = false})
                },
                groupValue: match.public,
              ),
              Text('Pública'),
              Radio(
                value: true,
                onChanged: (value) => {
                  setState(() => {match.public = true})
                },
                groupValue: match.public,
              ),
            ],
          ))),
          !match.public
              ? Container(
                  width: 300,
                  child: DropdownButton(
                      isExpanded: true,
                      value: match.team != null ? match.team.id : '',
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      underline: Container(
                        height: 2,
                        width: 20,
                        color: Colors.black,
                      ),
                      onChanged: (id) => {
                            setState(() => match.team = User.getAppUser()
                                .teams
                                .toList()
                                .firstWhere((g) => g.id == id))
                          },
                      items: [
                        DropdownMenuItem(
                            value: '',
                            child: Center(child: Text('Selecione o grupo'))),
                        ...User.getAppUser()
                            .teams
                            .map<DropdownMenuItem>((team) {
                          return DropdownMenuItem(
                              value: team.id,
                              child: Center(child: Text(team.description)));
                        }).toList()
                      ]),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: TextFormField(
              onChanged: (value) => {setState(() => match.description = value)},
              decoration: InputDecoration(
                hintText: 'Descrição do lugar',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  {setState(() => match.maxMembers = int.parse(value))},
              decoration: InputDecoration(
                hintText: 'Número de participantes',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: TextFormField(
              controller: TextEditingController(
                  text: DateFormat('dd/MM/yyyy').format(match.date)),
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                hintText: 'Selecione a data',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          TextFormField(
            controller: TextEditingController(
                text: DateFormat().add_Hm().format(match.date)),
            onTap: () => _selectTime(context),
            decoration: InputDecoration(
              hintText: 'Selecione o horário',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
        ],
      ))),
    );
  }
}
