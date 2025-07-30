import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightWidget extends StatefulWidget {
  final Function(double) onChange;

  const HeightWidget({
    super.key,
    required this.onChange,
  });

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  double height = 0;

  void update(val) {
    final p = double.tryParse(val);
    if (p != null) {
      setState(() {
        height = p;
        widget.onChange(height);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  update(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
