import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:questionable_dashboard/widget/indicator.widget.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({Key? key, required this.values, required this.title})
      : super(key: key);

  final String title;

  final List<Indicator> values;

  @override
  State<PieChartSample2> createState() => _PieChart2State();
}

class _PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: _getSection(),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.values,
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> _getSection() => List.generate(
        widget.values.length,
        (index) => _getPieChartSection(
            widget.values[index].value, index, widget.values[index].color),
      );

  PieChartSectionData _getPieChartSection(double? value, int i, Color color) {
    final isTouched = i == touchedIndex;
    final fontSize = isTouched ? 25.0 : 16.0;
    final radius = isTouched ? 60.0 : 50.0;
    return PieChartSectionData(
      color: color,
      value: value,
      title: value == value?.round()
          ? '${value.toString()}%'
          : '${value?.toStringAsFixed(2)}%',
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
      ),
    );
  }
}
