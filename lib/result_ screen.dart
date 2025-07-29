import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class result_screen extends StatelessWidget {
  double bmiScore;
  String result;
  String msg;
  int riskLevel;
  result_screen(
      {super.key,
      required this.bmiScore,
      required this.result,
      required this.msg,
      required this.riskLevel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Body Mass Index Result",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(children: [
                  PrettyGauge(
                    gaugeSize: 300,
                    minValue: 0,
                    maxValue: 40,
                    currentValue: bmiScore.toDouble(),
                    needleColor: Colors.black54,
                    showMarkers: false,
                    segments: [
                      GaugeSegment("Underweight", 18.5, Colors.red),
                      GaugeSegment("Normal", 6.4, Colors.green),
                      GaugeSegment("Overweight", 5, Colors.yellow),
                      GaugeSegment("Obese", 10.1, Colors.red)
                    ],
                    valueWidget: Text(
                      "${bmiScore.toStringAsFixed(1)} \n $result",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: riskLevel == 0 ? Colors.green : Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Try Again",
                    ),
                  )
                ]),
              )),
        ),
      ),
    );
  }
}
