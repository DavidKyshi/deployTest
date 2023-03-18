// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:intl/intl.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import 'package:syncfusion_flutter_charts/charts.dart';


import '../../models/kyshiConnectGraph.dart';

import '../../providers/over_view_provider.dart';
import '../../widgets/over_view_widgets.dart';

class OverViewAirtime extends StatefulWidget {
  final Function(String?)? onChangedAirtimeGraph;
  // final List<ConnectOverViewGraph> data;
  final String dropDownAirtimeGraph;
  final String dropdownvalueCurrency;
  final Function(String?)? onChangedCurr;
  const OverViewAirtime({super.key,required this.onChangedCurr,required this.onChangedAirtimeGraph,
    required this.dropDownAirtimeGraph, required this.dropdownvalueCurrency});

  @override
  State<OverViewAirtime> createState() => _OverViewAirtimeState();
}

class _OverViewAirtimeState extends State<OverViewAirtime> {
  late List<ConnectOverViewGraph> data;
  late  TooltipBehavior _tooltip;
  String dropdownvalue = 'Created';
  String dropdownvalueCurrency = 'NGN';
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  double totalTrans = 0;
  late String today;
  late String yesterday;
  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    today = formatter.format(now);
    yesterday = formatter.format(now.subtract(Duration(days: 1)));
    print(today);
    print(yesterday);
    // TODO: implement initState
    super.initState();
  }
  double getDays(List<ConnectOverViewGraph> dat, String today){
    for (int i = 0; i < dat.length; i++) {
      ConnectOverViewGraph entry = dat[i];
      if (entry.day == today) {
        totalTrans = entry.totalTrans!;
        return totalTrans;
      }
    }
    return 0;
  }
  @override
  Widget build(BuildContext context) {
    double todayTotalTrans = getDays(overViewProvider.kyshiConnectGraph, today);
    double yesterdayTotalTrans = getDays(overViewProvider.kyshiConnectGraph, yesterday);
    double? totalService(){
      if(overViewProvider.kyshiConnectGraph.isEmpty){
        return 0;
      }else{
        return overViewProvider.kyshiConnectGraph.map((e) => e.totalTrans).reduce((value, element) => value! + element!)?.toDouble();
      }
    }
    return Container(
      width: MediaQuery.of(context).size.width /2.2,
      height: 400,
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
                  widget.dropDownAirtimeGraph,
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
              text: "${totalService()} Total Transactions",
              // '${widget.dropdownvalueCurrency ==  "NGN" ? "₦" :widget.dropdownvalueCurrency ==  "GBP" ? "£" : "\$"} ${totalService()}',
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
                    SvgPicture.asset(yesterdayTotalTrans  >todayTotalTrans ? high : low,
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$yesterdayTotalTrans Yesterday, $yesterday',
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
                    SvgPicture.asset(todayTotalTrans >yesterdayTotalTrans ? high : low,
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$todayTotalTrans Today, $today',
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
            overViewProvider.kyshiConnectGraph.isEmpty ? SizedBox():
            SizedBox(
              height: 220,
              width: MediaQuery.of(context).size.width /2.2,
              child: SfCartesianChart(
                  isTransposed: true,
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(minimum: 0, maximum:40, interval: 10),
                  tooltipBehavior: _tooltip,
                  series: <ChartSeries<ConnectOverViewGraph, String>>[
                    BarSeries<ConnectOverViewGraph, String>(
                        dataSource: overViewProvider.kyshiConnectGraph,
                        // width: 20,
                        xValueMapper: (ConnectOverViewGraph data, _) => convertDay(data.day!),
                        yValueMapper: (ConnectOverViewGraph data, _) => data.totalTrans,
                        name: widget.dropDownAirtimeGraph,
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
