import 'package:app/controllers/match_controller.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/models/User.dart';
import 'package:app/models/match.dart';
import 'package:app/pages/home.dart';
import 'package:app/utils/utils.dart';
import 'package:app/widgets/match_creation_step_1.dart';
import 'package:app/widgets/match_creation_step_2.dart';
import 'package:app/widgets/match_creation_step_3.dart';
import 'package:app/widgets/match_creation_step_4.dart';
import 'package:app/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_timeline/progress_timeline.dart';

class MatchCreation extends StatefulWidget {
  const MatchCreation({Key key}) : super(key: key);

  @override
  _MatchCreationState createState() => _MatchCreationState();
}

class _MatchCreationState extends State<MatchCreation> {
  Match match = new Match(date: DateTime.now(), owner: User.getAppUser());
  ProgressTimeline stepper;
  int step = 0;

  void validateStep(context) {
    bool error = false;
    switch (step) {
      case 0:
        {
          if (match.sport == null) {
            error = true;
            Utils.showSnackBar(context, 'Selecione a modalidade!');
          }
          break;
        }
      case 1:
        {
          if (match.latitude == null || match.longitude == null) {
            error = true;
            Utils.showSnackBar(context, 'Selecione a localização!');
          }
          break;
        }
      case 2:
        {
          if (!match.public && (match.team == null)) {
            error = true;
            Utils.showSnackBar(context,
                'Sua partida é privada. Informe o grupo a qual ela pertence');
            break;
          }
          if (match.description == null) {
            error = true;
            Utils.showSnackBar(context, 'Informe a descrição do lugar!');
            break;
          }
          if (match.maxMembers == null) {
            error = true;
            Utils.showSnackBar(context, 'Informe a o número de participantes!');
            break;
          }
          if (match.date == null) {
            error = true;
            Utils.showSnackBar(context, 'Informe a data|hora!');
            break;
          }
          break;
        }
      case 3:
        {
          break;
        }
    }
    if (error) {
      stepper.failCurrentStage();
      return;
    }
    stepper.gotoNextStage();
    setState(() {
      step = stepper.state.currentStageIndex;
    });
  }

  Widget getContent() {
    switch (step) {
      case 0:
        {
          return MatchCreationStep1(match, setState);
        }
      case 1:
        {
          return MatchCreationStep2(match, setState);
        }
      case 2:
        {
          return MatchCreationStep3(match, setState);
        }
      case 3:
        {
          return MatchCreationStep4(match);
        }
    }
    return MatchCreationStep1(match, setState);
  }

  void submitForm() async {
    await new MatchController(match: match).create();
    Utils.showMessageDialog(context, SuccessDialog(() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (c) => HomePage()), (route) => false);
    }));
  }

  @override
  void initState() {
    UserController().syncData();
    stepper = new ProgressTimeline(
      states: [
        SingleState(stateTitle: "Modalidade"),
        SingleState(stateTitle: "Local"),
        SingleState(stateTitle: "Geral"),
        SingleState(stateTitle: "Confirmação"),
      ],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criação de nova partida')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        child: stepper,
                      ),
                      Container(
                        height: 500,
                        margin: EdgeInsets.only(top: 50),
                        child: getContent(),
                      )
                    ],
                  ),
                  height: MediaQuery.of(context).size.height - 200,
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: double.infinity,
                    child: step == stepper.states.length - 1
                        ? ElevatedButton(
                            onPressed: () {
                              submitForm();
                            },
                            child: Text('Confirmar'))
                        : ElevatedButton(
                            onPressed: () {
                              validateStep(context);
                            },
                            child: Text('Próximo'))),
                step > 0
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              stepper.gotoPreviousStage();
                              setState(() {
                                step = stepper.state.currentStageIndex;
                              });
                            },
                            child: Text('Voltar')),
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}
