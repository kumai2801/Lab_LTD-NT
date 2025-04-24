import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/reusable_card.dart';
import 'components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;

  ResultPage({required this.bmi, required this.result, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI RESULT')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Your Result', style: kResultTitleStyle),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(result.toUpperCase(), style: kResultTextStyle),
                  Text(bmi, style: kBMITextStyle),
                  Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
