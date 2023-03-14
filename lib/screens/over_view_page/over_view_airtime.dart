// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/create_an_offer_screen_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/kyshiConnectGraph.dart';
import '../../models/offersOverview.dart';
import '../../providers/over_view_provider.dart';
import '../../widgets/over_view_widgets.dart';

class OverViewAirtime extends StatefulWidget {
  final Function(String?)? onChangedAirtimeGraph;
  final List<ConnectOverViewGraph> data;
  final String dropDownAirtimeGraph;
  final String dropdownvalueCurrency;
  final Function(String?)? onChangedCurr;
  const OverViewAirtime({super.key,required this.onChangedCurr,required this.onChangedAirtimeGraph,
    required this.dropDownAirtimeGraph, required this.dropdownvalueCurrency, required this.data});

  @override
  State<OverViewAirtime> createState() => _OverViewAirtimeState();
}

class _OverViewAirtimeState extends State<OverViewAirtime> {
  late List<ConnectOverViewGraph> data;
  late  TooltipBehavior _tooltip;
  String dropdownvalue = 'Created';
  String dropdownvalueCurrency = 'NGN';

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 681.64,
      // height: 700,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffE8E8E8))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Airtime',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConnectDropDown(dropDownAirtimeGraph: widget.dropDownAirtimeGraph, onChangedAirtimeGraph:widget.onChangedAirtimeGraph),
                    SizedBox(
                      width: 20,
                    ),
                    CurrencyOfOfferDropDown(onChangedCurr:widget.onChangedCurr, dropdownvalueCurrency: widget.dropdownvalueCurrency,),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
              text: '₦ 0.00',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: primaryColor,
                fontSize: 40,
              ),
              // children: [
              //   TextSpan(
              //     style: TextStyle(
              //       color: Color(0xff6E80A3)
              //     ),
              //     text: ' Offers!',
              //   )
              // ]
            )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/yesterday.png',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '₦ 0.00 Yesterday, March 7',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/today.png',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '₦ 0.00 Today, March 8',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
            widget.data.isEmpty ? SizedBox():
            SizedBox(
              height: 390,
              width: 600,
              child: SfCartesianChart(
                  isTransposed: true,
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(minimum: 0, maximum:40, interval: 10),
                  tooltipBehavior: _tooltip,
                  series: <ChartSeries<ConnectOverViewGraph, String>>[
                    BarSeries<ConnectOverViewGraph, String>(
                        dataSource: widget.data,
                        // width: 20,
                        xValueMapper: (ConnectOverViewGraph data, _) => data.day,
                        yValueMapper: (ConnectOverViewGraph data, _) => data.totalTrans,
                        name: 'Airtime',
                        color: primaryColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
