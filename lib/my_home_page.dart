import 'package:bmi_calculator/result_%20screen.dart';
import 'package:bmi_calculator/widgets/age_widget.dart';
import 'package:bmi_calculator/widgets/gender_widget.dart';
import 'package:bmi_calculator/widgets/height_widget.dart';
import 'package:bmi_calculator/widgets/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(String s, {super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int age = 1;
  int riskLevel = 0;
  bool isLoading = false;
  bool isMale = true;
  double height = 0;
  double weight = 0;
  double bmiScore = 0;
  String result = "NaN";
  String msg = "";
  String errorMsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  gender_widget(onChange: (val) {
                    isMale = val;
                  }),
                  height_widget(
                    onChange: (val) {
                      height = val;
                    },
                  ),
                  weight_widget(
                    onChange: (val) {
                      weight = val;
                    },
                  ),
                  age_widget(
                    onChange: (val) {
                      age = val;
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 10,
                minimumSize: Size(150, 50),
              ),
              child: isLoading
                  ? SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                        padding: EdgeInsets.all(8.0),
                      ))
                  : Text("Calculate BMI"),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(Duration(seconds: 2));
                setState(() {
                  isLoading = false;
                });
                isValid_input()
                    ? {
                        calculate_bmi(),
                        await Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: result_screen(
                                    bmiScore: bmiScore,
                                    result: result,
                                    msg: msg,
                                    riskLevel: riskLevel)))
                      }
                    : {};
              },
            ),
          ),
        ],
      ),
    );
  }

  isValid_input() {
    errorMsg = "";
    if (!isValid()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Invalid Input"),
          content: Text(errorMsg),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }

  isValid() {
    if (1 > age || age > 120) {
      errorMsg = "> Please enter a valid age.\n";
      return false;
    }
    if (height <= 0) {
      errorMsg = "> Please enter a valid height.\n";
      return false;
    }
    if (weight <= 0) {
      errorMsg = "> Please enter a valid weight.\n";
      return false;
    }
    return true;
  }

  calculate_bmi() {
    double l = ((height / 100) * (height / 100));
    bmiScore = weight / l;
    if (bmiScore < 18.5) {
      result = "Underweight";
      msg =
          "You need to gain some weight. (+ ${(18.5 * l - weight).toStringAsFixed(2)}kg)";
      riskLevel = 3;
    } else if (bmiScore >= 18.5 && bmiScore < 24.9) {
      result = "Normal weight";
      msg = "You are in a healthy weight range.";
      riskLevel = 0;
    } else if (bmiScore >= 25 && bmiScore < 29.9) {
      result = "Overweight";
      msg =
          "You need to lose some weight. (- ${(weight - 24.9 * l).toStringAsFixed(2)}kg)";
      riskLevel = 2;
    } else if (bmiScore >= 30) {
      result = "Obesity";
      msg =
          "You need to lose a significant amount of weight. (- ${(weight - 24.9 * l).toStringAsFixed(2)}kg)";
      riskLevel = 3;
    }
  }
}
