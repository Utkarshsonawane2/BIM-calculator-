import 'package:bimdemo/components/constant.dart';
import 'package:bimdemo/views/input_page.dart';
import 'package:bimdemo/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class resultPage extends StatelessWidget {
  resultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BIM CALCULATER",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "$resultText".toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    "$bmiResult",
                    style: kBIMTextStyle,
                  ),
                  Text(
                    "$interpretation",
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => inputPage(),
                  ),
                );
              },
              buttonTitle: "RE-CALCULATE")
        ],
      ),
    );
  }
}
