// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/currencyConverter.dart';
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
  // final List<StatusData> chartData;
  // final Data connectData;
  // final Function(String?)? onChangedCurr;
  const OverViewConnect({super.key, required this.onChangedAirtimeGraph,
    required this.dropDownAirtimeGraph2});

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
  bool check (){
    if(widget.dropDownAirtimeGraph2 == "Airtime"){
      return overViewProvider.statusDataAirtime.isEmpty;
    }else if(widget.dropDownAirtimeGraph2 == "Data"){
      return overViewProvider.statusData.isEmpty;
    }else{
      return overViewProvider.statusDataHealth.isEmpty;
    }
  }

  bool isAvailable(){
      if(widget.dropDownAirtimeGraph2 == "Airtime" && overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeGbpSum == 0 &&
          overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeUsdSum == 0&&
          overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeNgnSum == 0 &&
          overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeCadSum == 0) {
        return false;
        // if(overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeGbpSum == 0 &&
        //     overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeUsdSum == 0&&
        //     overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeNgnSum == 0 &&
        //     overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeCadSum == 0){
        //   return false;
        // }
      } else if(widget.dropDownAirtimeGraph2 == "Data" && overViewProvider.kyshiConnectData?.kyshiConnectDataGbpSum == 0 &&
            overViewProvider.kyshiConnectData?.kyshiConnectDataUsdSum == 0&&
            overViewProvider.kyshiConnectData?.kyshiConnectDataNgnSum == 0 &&
            overViewProvider.kyshiConnectData?.kyshiConnectDataCadSum == 0){
          return false;
          // if (overViewProvider.kyshiConnectData?.kyshiConnectDataGbpSum == 0 &&
          //     overViewProvider.kyshiConnectData?.kyshiConnectDataUsdSum == 0&&
          //     overViewProvider.kyshiConnectData?.kyshiConnectDataNgnSum == 0 &&
          //     overViewProvider.kyshiConnectData?.kyshiConnectDataCadSum == 0){
          //   return false;
          // }
        }else if (widget.dropDownAirtimeGraph2 == "Health" && overViewProvider.kyshiConnectHealth?.data?.kyshiConnectHealthGbpSum == 0 &&
          overViewProvider.kyshiConnectHealth?.data?.kyshiConnectHealthUsdSum == 0&&
          overViewProvider.kyshiConnectHealth?.data?.kyshiConnectHealthNgnSum == 0 &&
          overViewProvider.kyshiConnectHealth?.data?.kyshiConnectHealthCadSum == 0 ){
        return false;
      }
      return true;
  }
  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    final double result= overViewProvider.kyshiConnectAirtime!.data!.totalConnectTransactionSum!  +
        overViewProvider.kyshiConnectHealth!.data!.totalConnectTransactionSum! + overViewProvider.kyshiConnectData!.totalConnectTransactionSum!;
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
                  check() || !isAvailable()?
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
                          "$result",
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
                  CircularChartAnnotation(
                    width: "100",
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${Util.formatAmount(result)}',
                              style: TextStyle(
                                  color: kyshiGreyishBlue,
                                  fontSize: 15,
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
                      dataSource:widget.dropDownAirtimeGraph2 == "Airtime"? overViewProvider.statusDataAirtime:
                      widget.dropDownAirtimeGraph2 == "Data" ? overViewProvider.statusData : overViewProvider.statusDataHealth
                      ,
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
                  // SizedBox(
                  //   width: 0,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WalletStatus(
                        color: primaryColor,
                        value:widget.dropDownAirtimeGraph2 == "Airtime" ?
                        Util.formatAmount(overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeNgnSum) ?? 0 :
                        widget.dropDownAirtimeGraph2 == "Data"? Util.formatAmount(overViewProvider.kyshiConnectData?.kyshiConnectDataNgnSum) :
                            Util.formatAmount(overViewProvider.kyshiConnectHealth?.data?.kyshiConnectHealthNgnSum)
                        ,
                        text: 'NGN',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: Color(0xff2668EC),
                        value:widget.dropDownAirtimeGraph2 == "Airtime" ?
                      Util.formatAmount(overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeGbpSum) ?? 0 :
                      widget.dropDownAirtimeGraph2 == "Data"? Util.formatAmount(overViewProvider.kyshiConnectData?.kyshiConnectDataGbpSum) :
                        Util.formatAmount(overViewProvider.kyshiConnectHealth?.data?.kyshiConnectHealthGbpSum),
                        text: 'GBP',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: Color(0xff6E80A3),
                        value:widget.dropDownAirtimeGraph2 == "Airtime" ?
                      Util.formatAmount(overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeUsdSum) ?? 0 :
                      widget.dropDownAirtimeGraph2 == "Data"? Util.formatAmount(overViewProvider.kyshiConnectData?.kyshiConnectDataUsdSum) :
                        Util.formatAmount(overViewProvider.kyshiConnectHealth?.data?.kyshiConnectHealthUsdSum),
                        text: 'USD',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: Color(0xff4DAEF8),
                        value: widget.dropDownAirtimeGraph2 == "Airtime" ?
                        Util.formatAmount(overViewProvider.kyshiConnectAirtime?.data?.kyshiConnectAirtimeCadSum) ?? 0 :
                        widget.dropDownAirtimeGraph2 == "Data"? Util.formatAmount(overViewProvider.kyshiConnectData?.kyshiConnectDataCadSum) :
                        Util.formatAmount(overViewProvider.kyshiConnectHealth?.data?.kyshiConnectHealthCadSum),
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
              bottomText("Airtime","${Util.formatAmount(overViewProvider.kyshiConnectAirtime?.data?.totalConnectTransactionSum)}"),
              SizedBox(
                width: 10,
              ),
              bottomText("Data","${Util.formatAmount(overViewProvider.kyshiConnectData?.totalConnectTransactionSum)}"),
              SizedBox(
                width: 10,
              ),
              bottomText("Health Plans","${Util.formatAmount(overViewProvider.kyshiConnectHealth?.data?.totalConnectTransactionSum)}"),
            ],
          )
        ],
      ),
    );
  }
}
