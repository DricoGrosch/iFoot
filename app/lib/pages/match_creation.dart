import 'package:app/controllers/match_controller.dart';
import 'package:app/models/match.dart';
import 'package:app/pages/home.dart';
import 'package:app/widgets/match_creation_step_1.dart';
import 'package:app/widgets/match_creation_step_2.dart';
import 'package:app/widgets/match_creation_step_3.dart';
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
  bool complete = false;
  MatchController matchController = new MatchController();
  getStepState(currentStep) {
    if (currentStep > step) {
      return StepState.indexed;
    } else if (currentStep < step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  @override
  Widget build(BuildContext context) {
    matchController.match = match;
    return Scaffold(
      appBar: AppBar(title: Text('Criação de nova partida')),
      body: Center(
          child: complete
              ? ElevatedButton(
                  onPressed: () async => {
                        await matchController.create(),
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()))
                      },
                  child: Text('manda mano'))
              : Stepper(
                  type: StepperType.horizontal,
                  currentStep: step,
                  onStepTapped: (_step) => setState(() => step = _step),
                  // validar campos entre steps
                  onStepContinue: () => {
                        step < 2
                            ? setState(() => step += 1)
                            : setState(() => complete = true)
                      },
                  onStepCancel: () => step > 0
                      ? setState(() => step -= 1)
                      : setState(() => complete = false),
                  steps: [
                      Step(
                          state: getStepState(0),
                          title: Text('Modalidade'),
                          content: MatchCreationStep1(match, setState)),
                      Step(
                          state: getStepState(1),
                          title: Text('Localização'),
                          content: MatchCreationStep2(match, setState)),
                      Step(
                          state: getStepState(2),
                          title: Text('Geral'),
                          content: MatchCreationStep3(match, setState)),
                      // Step(
                      //     state: getStepState(3),
                      //     title: Text('Confirmação'),
                      //     content: MatchCreationStep4(match)),
                    ])),
    );
  }
}
