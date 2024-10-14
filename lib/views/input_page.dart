import 'package:bimdemo/views/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/constant.dart';
import '../components/bottom_button.dart';
import '../components/RoundIconButton.dart';
import 'calculater_brain.dart';

enum Gender {
  male,
  female,
}

class inputPage extends StatefulWidget {
  @override
  State<inputPage> createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  Gender? selectedGender;

  int height = 180;
  int weight = 70;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BIM CALCULATER"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: "FEMALE"),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyel,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextSytel,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyel,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTickMarkColor: Color(0xFF8BD8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(
                              0x298EB1555), //activeColor: Color(0xFFEB1555),,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 22.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.00,
                          max: 220.0,
                          inactiveColor: Color(0xFF8BD8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                    
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyel,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextSytel1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                weight++;
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyel,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextSytel1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomButton(
              onTap: () {
                CalculaterBrain _cla =
                    CalculaterBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultPage(
                      bmiResult: _cla.calculateBIM(),
                      resultText: _cla.getResult(),
                      interpretation: _cla.getInterpretation(),
                    ),
                  ),
                );
              },
              buttonTitle: "CALCULATER",
            ),
          ],
        ));
  }
}
