import 'package:flutter/material.dart';

class PokemonStatBar extends StatelessWidget {
  final String label;
  final int value;
  final int maxValue;
  final Color backgroundColor;
  final Color foregroundColor;
  final double height;

  const PokemonStatBar({
    Key key,
    this.label,
    this.value,
    this.maxValue = 300,
    this.backgroundColor = Colors.black12,
    this.foregroundColor,
    this.height = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          _buildLabel(),
          Expanded(
            child: Stack(
              children: [
                _buildBar(
                  color: backgroundColor,
                  value: maxValue,
                  colorFont: Colors.black38,
                ),
                _buildBar(
                  color: foregroundColor,
                  value: value,
                  colorFont: Colors.white,
                ),
                // _buildBarText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildLabel() {
    return Container(
      width: 50,
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildBar({Color color, int value, Color colorFont}) {
    print('$value / $maxValue');
    return FractionallySizedBox(
      widthFactor: value / maxValue,
      child: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(height),
            ),
          ),
          _buildBarText(power: value, colorFont: colorFont),
        ],
      ),
    );
  }

  _buildBarText({int power, Color colorFont}) {
    return Container(
      height: height,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 5),
      child: Text(
        power.toString(),
        style: TextStyle(
          fontSize: height * 0.6,
          fontWeight: FontWeight.bold,
          color: colorFont,
        ),
      ),
    );
  }
}
