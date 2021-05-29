import 'package:flutter/material.dart';

class MetricTile extends StatelessWidget {
  final String label;
  final String unit;
  final num value;

  const MetricTile({
    Key key,
    this.label,
    this.value,
    this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$value $unit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(label),
        ],
      ),
    );
  }
}
