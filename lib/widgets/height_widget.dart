import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class height_widget extends StatefulWidget {
  final Function(double) onChange;

  const height_widget({
    super.key,
    required this.onChange,
  });

  @override
  State<height_widget> createState() => _height_widgetState();
}

class _height_widgetState extends State<height_widget> {
  double height = 0;

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
                labelText: "Height (cm)",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                prefixIcon: Icon(Icons.height, color: Colors.blue),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  height = double.parse(value);
                  widget.onChange(height);
                } else {
                  height = 0;
                  widget.onChange(height);
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
