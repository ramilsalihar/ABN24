import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderWithTitle extends StatefulWidget {
  const SliderWithTitle({
    super.key,
    required this.title,
    required this.chosenValue,
    required this.min,
    required this.max,
    required this.intervals,
    required this.onChosenValueChanged,
  });

  final double chosenValue;
  final String title;
  final double min;
  final double max;
  final List<double> intervals;
  final ValueChanged<dynamic> onChosenValueChanged;

  @override
  State<SliderWithTitle> createState() => _SliderWithTitleState();
}

class _SliderWithTitleState extends State<SliderWithTitle> {
  late List<double> intervals;

  @override
  Widget build(BuildContext context) {
    intervals = widget.intervals;

    return Padding(
      padding: EdgeInsets.all(context.dimens.paddingSmall),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: context.dimens.paddingMedium,
              bottom: context.dimens.paddingMedium,
              left: context.dimens.paddingLarge,
              right: context.dimens.paddingLarge,
            ),
            child: Row(
              children: [
                Text(widget.title),
                const Spacer(),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: TextFormField(
                    readOnly: true,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: widget.chosenValue.toString(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                )
              ],
            ),
          ),
          SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.grey,
              activeLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              inactiveLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              activeTickColor: Colors.green,
              inactiveTickColor: Colors.grey,
              thumbColor: Colors.green,
              thumbStrokeColor: Colors.green,
              thumbStrokeWidth: 2,
              tooltipBackgroundColor: Colors.green,
              tooltipTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            child: SfSlider(
              min: widget.min,
              max: widget.max,
              value: widget.chosenValue,
              interval: 2000,
              showTicks: true,
              enableTooltip: true,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              minorTicksPerInterval: 1,
              stepSize: intervals[0],
              tooltipShape: const SfPaddleTooltipShape(),
              onChanged: widget.onChosenValueChanged,
            ),
          ),
        ],
      ),
    );
  }
}
