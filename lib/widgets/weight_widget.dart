import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightWidget extends StatefulWidget {
  final Function(double) onChange;

  const WeightWidget({
    super.key,
    required this.onChange,
  });

  @override
  State<WeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<WeightWidget> {
  double weight = 0;

  void update(val) {
    final p = double.tryParse(val);
    if (p != null) {
      setState(() {
        weight = p;
        widget.onChange(weight);
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
                labelText: "weight (kg)",
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
