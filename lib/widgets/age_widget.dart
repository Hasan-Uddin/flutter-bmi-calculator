import 'package:flutter/material.dart';

class AgeWidget extends StatefulWidget {
  final Function(int) onChange;
  const AgeWidget({super.key, required this.onChange});

  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  int age = 25;
  int min = 21;
  int max = 120;

  onChange(int value) {
    widget.onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Age : ${age.toString()}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    if (age > min) {
                      age--;
                    }
                  });
                  onChange(age);
                },
              ),
              Expanded(
                child: Slider(
                  max: max.toDouble(),
                  min: min.toDouble(),
                  divisions: max - min,
                  value: age.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      age = value.toInt();
                    });
                    onChange(age);
                  },
                ),
              ),
              InkWell(
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    if (age < max) {
                      age++;
                    }
                  });
                  onChange(age);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
