// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/currencyConverter.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/models/marketplaceOfferOverView.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/kyshiConnectOverViewResponse.dart';
import '../../providers/over_view_provider.dart';
import '../../widgets/over_view_widgets.dart';
import 'over_view.dart';

class OverViewMarketPlace extends StatefulWidget {
  final String dropdownCurrencyPair;
  // final List<StatusData> chartData;
  final MarketPlaceOfferOverView marketPairsData;
  final Function(String?)? onChangePairs;
    const OverViewMarketPlace({super.key, required this.dropdownCurrencyPair,
      required this.onChangePairs, required this.marketPairsData});

  @override
  State<OverViewMarketPlace> createState() => _OverViewMarketPlaceState();
}

class _OverViewMarketPlaceState extends State<OverViewMarketPlace> {
  // late List<StatusData> _chartData =[];
  late MarketPlaceOfferOverView provider;
  // late List<ChartData> data;
  late TooltipBehavior _tooltip;
  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);
  @override
  void initState() {
    super.initState();
    // provider = Provider.of<OverViewProvider>(context,listen: false).marketPlaceOfferOverView;

    // [Provider.of<OverViewProvider>(context,listen: false).marketPlaceOfferOverView];
    // getChartData();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    // _chartData =[
    //   StatusData("Active",  provider.activeOffers, primaryColor),
    //   StatusData("Accepted",  provider.acceptedOffers,Color(0XFF2668EC)),
    //   StatusData("Expired",  provider.closedOffers,kyshiGreyishBlue),
    //   StatusData("Withdrawn",  provider.expiredOffers,Color(0XFF4DAEF8))];
    return Container(
      width: MediaQuery.of(context).size.width /3.5,
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffE8E8E8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Marketplace offers Overview',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ),
                CurrencyOfMarketPlaceDropDown(
                  dropdownCurrencyPair: widget.dropdownCurrencyPair,
                  onChangePairs: widget.onChangePairs,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            // width: 396.54,
            height: 231.87,
            decoration: BoxDecoration(
              color: Color(0xffF8F9FE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 300,
                  child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        width: "100",
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${Provider.of<OverViewProvider>(context,listen: false).totalOffers}',
                                  style: TextStyle(
                                      color: kyshiGreyishBlue, fontSize: 15,fontWeight:
                                  FontWeight.w500,fontFamily: 'PushPenny')),
                              Text('Total Offers',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 12))
                            ],
                          ))
                    ],
                    tooltipBehavior: _tooltip,
                    series: <CircularSeries>[
                    DoughnutSeries<StatusData, String>(
                      dataSource: overViewProvider.chatData,
                      pointColorMapper:(StatusData data,  _) => data.color,
                      xValueMapper: (StatusData data, _)=> "${data.status} %",
                      yValueMapper: (StatusData data, _)=>data.amount,
                      dataLabelSettings: DataLabelSettings(isVisible: true) ,
                      radius: '100%'
                      //  explode: true,
                      //           explodeIndex: 1
                    )
                  ],),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WalletStatus(
                      color: primaryColor,
                      value: Util.formatAmount(overViewProvider.activeOffers),
                      text: 'Active',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    WalletStatus(
                      color: Color(0xff6E80A3),
                      value: Util.formatAmount(overViewProvider.expiredOffers),
                      text: 'Expired',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    WalletStatus(
                      color: Color(0xff2668EC),
                      value: Util.formatAmount(overViewProvider.acceptedOffers),
                      text: 'Accepted',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    WalletStatus(
                      color: Color(0xff4DAEF8),
                      value:Util.formatAmount(overViewProvider.withDrawnOffers),
                      text: 'Withdrawn',
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              bottomText("NGN/GBP",
                  "${Provider.of<OverViewProvider>(context, listen: false).totalNGNGBP}"),
              SizedBox(
                width: 10,
              ),
              bottomText("NGN/USD",
                  "${Provider.of<OverViewProvider>(context, listen: false).totalNGNUSD}"),
              SizedBox(
                width: 10,
              ),
              bottomText("NGN/CAD", "0"),
            ],
          )
        ],
      ),
    );
  }

  // List<StatusData> getChartData(){
  //   // final expressChart = overViewProvider.expressChart;
  //   final List<StatusData> chartData = [
  //     StatusData("Successful",  20),
  //     StatusData("Pending",  50),
  //     StatusData("Failed",  30),
  //     StatusData("Rejected",  50)
  //   ];
  //   return chartData;
  // }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

Widget bottomText(String text, String value) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: "PushPenny"),
      ),
      Text(
        text,
        style: TextStyle(
            color: Color(0xff6E80A3),
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: "PushPenny"),
      )
    ],
  );
}

Widget bottomText2(String text, {required double value}) {
  return Column(
    children: [
      Text(
        "$value",
        style: TextStyle(
            color: Color(0xff6E80A3),
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: "PushPenny"),
      ),
      Text(
        text,
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: "PushPenny"),
      )
    ],
  );
}

Widget bottomText3(String text,{required double value}) {
  return Column(
    children: [
      Text(
        '$value',
        style: TextStyle(
            color: Color(0xff6E80A3),
            fontWeight: FontWeight.w500,
            fontSize: 40,
            fontFamily: "PushPenny"),
      ),
      Text(
        text,
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: "PushPenny"),
      )
    ],
  );
}

class WalletStatus extends StatelessWidget {
  const WalletStatus({super.key, required this.text, required this.color, this.value});
  final String text;
  final Color color;
  final dynamic value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${value ?? 0}',
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.w500, fontSize: 17),
        ),
        SizedBox(height: 9,),
        Row(
          children: [
            Container(
              // width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(50)),
              child: SizedBox(width: 13,height: 10,),
            ),
            SizedBox(width: 7,),
            Text(
              text,
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}

class WalletStatus2 extends StatelessWidget {
  const WalletStatus2({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.w400, fontSize: 18),
        )
      ],
    );
  }
}
