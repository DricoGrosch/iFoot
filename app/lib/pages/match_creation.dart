import 'package:app/controllers/match_controller.dart';
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

class MatchCreation extends StatefulWidget {
  const MatchCreation({Key key}) : super(key: key);

  @override
  _MatchCreationState createState() => _MatchCreationState();
}

class _MatchCreationState extends State<MatchCreation> {
  Match match = new Match(date: DateTime.now());
  int step = 0;

  getStepState(currentStep) {
    if (currentStep > step) {
      return StepState.indexed;
    } else if (currentStep < step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  void validateStep() async {
    switch (step) {
      case 0:
        {
          if (match.sport == null) {
            Utils.showSnackBar(context, 'Selecione a modalidade!');
            return null;
          }
          break;
        }
      case 1:
        {
          if (match.latitude == null || match.longitude == null) {
            Utils.showSnackBar(context, 'Selecione a localização!');
            return null;
          }
          break;
        }
      case 2:
        {
          if (!match.public && (match.group == null)) {
            Utils.showSnackBar(context,
                'Sua partida é privada. Informe o grupo a qual ela pertence');
            return null;
          }
          if (match.location == null) {
            Utils.showSnackBar(context, 'Informe a descrição do lugar!');
            return;
          }
          if (match.maxMembers == null) {
            Utils.showSnackBar(context, 'Informe a descrição do lugar!');
            return;
          }
          if (match.date == null) {
            Utils.showSnackBar(context, 'Informe a data|hora!');
            return null;
          }
          break;
        }
      case 3:
        {
          break;
        }
    }
    if (step < 3) {
      setState(() => step += 1);
    } else {
      await new MatchController(match: match).create();
      Utils.showMessageDialog(context, SuccessDialog(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (c) => HomePage()), (route) => false);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criação de nova partida')),
      body: Center(
          child: Stepper(
              type: StepperType.horizontal,
              currentStep: step,
              onStepTapped: (_step) => setState(() => step = _step),
              onStepContinue: () => validateStep(),
              onStepCancel: () => step > 0 ? setState(() => step -= 1) : null,
              steps: [
            Step(
                state: getStepState(0),
                title: Icon(Icons.sports_soccer),
                content: step == 0
                    ? MatchCreationStep1(match, setState)
                    : Container()),
            Step(
                state: getStepState(1),
                title: Icon(Icons.map),
                content: step == 1
                    ? MatchCreationStep2(match, setState)
                    : Container()),
            Step(
                state: getStepState(2),
                title: Icon(Icons.details_sharp),
                content: step == 2
                    ? MatchCreationStep3(match, setState)
                    : Container()),
            Step(
                state: getStepState(3),
                title: Icon(Icons.check),
                content: step == 3 ? MatchCreationStep4(match) : Container()),
          ])),
    );
  }
}
