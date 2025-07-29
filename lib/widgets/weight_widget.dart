import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class weight_widget extends StatefulWidget {
  final Function(double) onChange;

  const weight_widget({
    super.key,
    required this.onChange,
  });

  @override
  State<weight_widget> createState() => _weight_widgetState();
}

class _weight_widgetState extends State<weight_widget> {
  double weight = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            TextField(
              maxLength: 3,
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                counterText: "",
                labelText: "Weight (kg)",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                prefixIcon:
                    Icon(Icons.monitor_weight_outlined, color: Colors.blue),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  weight = double.parse(value);
                  widget.onChange(weight);
                } else {
                  weight = 0;
                  widget.onChange(weight);
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
