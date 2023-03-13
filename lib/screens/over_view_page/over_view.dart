// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/models/express_chart.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../helper/screen_export.dart';
import '../../providers/over_view_provider.dart';
import 'market_place_revenue.dart';
import 'over_view_airtime.dart';
import 'over_view_connect.dart';
import 'over_view_express_chart.dart';
import 'over_view_marketplace.dart';
import 'overview_offers.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({super.key});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  late List<StatusData> _chartData;
  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            //   child: Row(
            //     children: [
            //       OverViewOffers(),
            //       SizedBox(
            //         width: 40,
            //       ),
            //       OverViewMarketPlace(),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            //   child: Row(
            //     children: [
            //       OverViewConnect(),
            //       SizedBox(
            //         width: 40,
            //       ),
            //       OverViewAirtime()
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                children: [
                  MarketPlaceRevenue(),
                  SizedBox(
                    width: 20,
                  ),
                  OverViewExpressChart()
                ],
              ),
            ),
            Container(
              width: 651.67,
              height: 338.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffE8E8E8))),
              child: Column(
                children: [
                  const Text(
                    'Express Transfers',
                    style: TextStyle(
                        color: Color(0xff0D2C65),
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 400,
                        child: SfCircularChart(
                          series: <CircularSeries>[
                            DoughnutSeries<StatusData, String>(
                              dataSource: _chartData,
                              xValueMapper: (StatusData data, _) => data.status,
                              yValueMapper: (StatusData data, _) => data.amount,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                              //  explode: true,
                              //           explodeIndex: 1
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<StatusData> getChartData() {
    final expressChart = overViewProvider.expressChart;
    final List<StatusData> chartData = [
      StatusData("Successful", 20),
      StatusData("Pending", 50),
      StatusData("Failed", 30)
    ];
    return chartData;
  }
}

class StatusData {
  StatusData(
    this.status,
    this.amount,
  );

  final String status;
  final int? amount;
  //  final Color color;
}
