import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSliderWithTitle extends StatefulWidget {
  const CircularSliderWithTitle({
    super.key,
    required this.minAmount,
    required this.maxAmount,
    required this.intervals,
    required this.value,
    required this.onChosenValueChanged,
  });

  final double minAmount;
  final double maxAmount;
  final List<double> intervals;
  final double value;
  final ValueChanged<dynamic> onChosenValueChanged;

  @override
  State<CircularSliderWithTitle> createState() =>
      _CircularSliderWithTitleState();
}

class _CircularSliderWithTitleState extends State<CircularSliderWithTitle> {
  late double chosenAmount;

  double findNearestValue(double value, List<double> intervals) {
    double minDistance = double.maxFinite;
    double nearestValue = intervals.first;

    for (final validValue in intervals) {
      final distance = (validValue - value).abs();
      if (distance < minDistance) {
        minDistance = distance;
        nearestValue = validValue;
      }
    }

    return nearestValue;
  }

  @override
  Widget build(BuildContext context) {
    chosenAmount = widget.value;
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        customColors: CustomSliderColors(
          progressBarColors: [Colors.yellow, Colors.green],
          trackColor: Colors.grey,
          dotColor: Colors.black,
          shadowColor: Colors.green,
          shadowMaxOpacity: 0.05,
        ),
        infoProperties: InfoProperties(
          mainLabelStyle: const TextStyle(
            color: Colors.green,
            fontSize: 30,
          ),
          modifier: (_) {
            return chosenAmount.toStringAsFixed(0);
          },
        ),
        startAngle: 120,
        angleRange: 300,
        size: 200,
        animationEnabled: true,
      ),
      min: widget.minAmount,
      max: widget.maxAmount,
      initialValue: widget.minAmount,
      onChange: widget.onChosenValueChanged,
    );
  }
}
