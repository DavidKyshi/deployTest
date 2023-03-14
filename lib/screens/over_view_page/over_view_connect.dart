// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/kyshiConnectOverViewResponse.dart';
import '../../providers/over_view_provider.dart';
import '../../widgets/over_view_widgets.dart';
import 'over_view.dart';
import 'over_view_marketplace.dart';

class OverViewConnect extends StatefulWidget {
  final Function(String?)? onChangedAirtimeGraph;
  final String dropDownAirtimeGraph2;
  final List<StatusData> chartData;
  final Data connectData;
  // final Function(String?)? onChangedCurr;
  const OverViewConnect({super.key, required this.onChangedAirtimeGraph,
    required this.dropDownAirtimeGraph2, required this.chartData, required this.connectData});

  @override
  State<OverViewConnect> createState() => _OverViewConnectState();
}

class _OverViewConnectState extends State<OverViewConnect> {
  late  TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    // TODO: implement initState
    super.initState();
  }
  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396.54,
      height: 375.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffE8E8E8))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kyshi Connect Overview',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ),
                ConnectDropDown(dropDownAirtimeGraph: widget.dropDownAirtimeGraph2,onChangedAirtimeGraph: widget.onChangedAirtimeGraph,),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 396.54,
            height: 251.87,
            decoration: BoxDecoration(
              color: Color(0xffF8F9FE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.chartData.isEmpty?
                  Container(
                    width: 194.72,
                    height: 194.72,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        border:
                            Border.all(color: Color(0xffDDDDDD), width: 40)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6E80A3)),
                        ),
                        Text(
                          "Total Transaction",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ):
              SizedBox(
              height: 300,
              child: SfCircularChart(
                annotations: <CircularChartAnnotation>[
                  // CircularChartAnnotation(
                  //     widget: Container(
                  //         child: PhysicalModel(
                  //             child: Container(),
                  //             shape: BoxShape.circle,
                  //             elevation: 2,
                  //             shadowColor: Colors.black,
                  //             color:  Colors.red))),
                  CircularChartAnnotation(
                      widget: Column(
                        children: [
                          Text('${overViewProvider.totalConnectTrx ?? 0}',
                              style: TextStyle(
                                  color: kyshiGreyishBlue,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PushPenny')),
                          Text('Total Transaction',
                              style: TextStyle(
                                  color: primaryColor, fontSize: 12,fontWeight:
                              FontWeight.w500,fontFamily: 'PushPenny'))
                        ],
                      ))
                ],
                tooltipBehavior: _tooltip,
                series: <CircularSeries>[
                  DoughnutSeries<StatusData, String>(
                      dataSource: widget.chartData,
                      pointColorMapper:(StatusData data,  _) => data.color,
                      xValueMapper: (StatusData data, _)=> "${data.status} %",
                      yValueMapper: (StatusData data, _)=>data.amount,
                      dataLabelSettings: DataLabelSettings(isVisible: true) ,
                      radius: '80%'
                    //  explode: true,
                    //           explodeIndex: 1
                  )
                ],),
            ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WalletStatus(
                        color: Color(0xff2668EC),
                        value:widget.connectData.kyshiConnectDataNgnSum ?? 0 ,
                        text: 'NGN',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: primaryColor,
                        value: widget.connectData.kyshiConnectDataGbpSum ?? 0,
                        text: 'GBP',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: Color(0xff6E80A3),
                        value: widget.connectData.kyshiConnectDataUsdSum ?? 0,
                        text: 'USD',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: Color(0xff4DAEF8),
                        value: widget.connectData.kyshiConnectDataCadSum ?? 0,
                        text: 'CAD',
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              bottomText("Airtime","0"),
              SizedBox(
                width: 10,
              ),
              bottomText("Data",""),
              SizedBox(
                width: 10,
              ),
              bottomText("Health Plans",""),
            ],
          )
        ],
      ),
    );
  }
}
