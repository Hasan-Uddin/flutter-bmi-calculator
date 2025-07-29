import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class gender_widget extends StatefulWidget {
  final Function(bool) onChange;
  const gender_widget({
    super.key,
    required this.onChange,
  });

  @override
  State<gender_widget> createState() => _gender_widgetState();
}

class _gender_widgetState extends State<gender_widget> {
  bool _isMale = true;

  set_Male(bool n) {
    setState(() {
      _isMale = n; // false = female
    });
  }

  ChoiceChip3DStyle unselected_style() {
    return ChoiceChip3DStyle(
        topColor: Colors.white,
        backColor: Colors.grey[350]!,
        borderRadius: BorderRadius.circular(10));
  }

  ChoiceChip3DStyle selected_style() {
    return ChoiceChip3DStyle(
        topColor: Colors.grey[200]!,
        backColor: Colors.grey[350]!,
        borderRadius: BorderRadius.circular(10));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              width: 150,
              height: 100,
              border: Border.all(color: Colors.grey!),
              style: _isMale == true ? selected_style() : unselected_style(),
              onSelected: () {
                set_Male(true);
                widget.onChange(_isMale);
              },
              selected: _isMale == true,
              onUnSelected: () {},
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/male.png",
                    height: 60,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("male"),
                ],
              )),
          SizedBox(
            width: 20,
          ),
          ChoiceChip3D(
              width: 150,
              height: 100,
              border: Border.all(color: Colors.grey!),
              style: _isMale == false ? selected_style() : unselected_style(),
              onSelected: () {
                set_Male(false);
                widget.onChange(_isMale);
              },
              selected: _isMale == false,
              onUnSelected: () {},
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/female.png",
                    height: 60,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("female"),
                ],
              )),
        ],
      ),
    );
  }
}
