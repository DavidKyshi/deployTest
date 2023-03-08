import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartTransaction extends StatelessWidget {
  const ChartTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 584,
      child: SfCartesianChart(),
    );
  }
}
