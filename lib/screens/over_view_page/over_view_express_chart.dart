import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/currencyConverter.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/models/express_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../providers/over_view_provider.dart';
import '../../styleguide/colors.dart';
import 'market_place_revenue.dart';
import 'over_view.dart';
import 'over_view_marketplace.dart';

class OverViewExpressChart extends StatefulWidget {
  const OverViewExpressChart({super.key});

  @override
  State<OverViewExpressChart> createState() => _OverViewExpressChartState();
}

class _OverViewExpressChartState extends State<OverViewExpressChart> {
  ExpressChart? _expressChart;
  late  TooltipBehavior _tooltip;
  late List<StatusData> _data;

  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);
  @override
  void initState() {
    _expressChart = overViewProvider.expressChat;
    _tooltip = TooltipBehavior(enable: true);
    _data =[
      StatusData("GBP", double.tryParse((_expressChart!.totalCountExpressTransferGbp! * 100 / _expressChart!.totalCountExpressTransfer! ).toStringAsFixed(2)), kyshiGreen),
      StatusData("USD", double.tryParse((_expressChart!.totalCountExpressTransferUsd! * 100 / _expressChart!.totalCountExpressTransfer! ).toStringAsFixed(2))  ,primaryColor),
      StatusData("CAD",double.tryParse((_expressChart!.totalCountExpressTransferCad! * 100 / _expressChart!.totalCountExpressTransfer! ).toStringAsFixed(2))  ,const Color(0XFF4DAEF8))];

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 725.67,
      height: 390.4,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE8E8E8)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(
              'Express Transfers',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: primaryColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                 _data.isEmpty ? Container(
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
                          "Total Transfer",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ) :
                  SizedBox(
                    height: 300,
                    child: SfCircularChart(
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                            widget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${Util.formatAmount(_expressChart?.totalCountExpressTransfer ?? 0)}',
                                    style: TextStyle(
                                        color: kyshiGreyishBlue,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'PushPenny')),
                                Text('Total Transaction',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 10,fontWeight:
                                    FontWeight.w500,fontFamily: 'PushPenny'))
                              ],
                            ))
                      ],
                      tooltipBehavior: _tooltip,
                      series: <CircularSeries>[
                        DoughnutSeries<StatusData, String>(
                            dataSource: _data,
                            pointColorMapper:(StatusData data,  _) => data.color,
                            xValueMapper: (StatusData data, _)=> "${data.status} %",
                            yValueMapper: (StatusData data, _)=>data.amount,
                            dataLabelSettings: const DataLabelSettings(isVisible: true) ,
                            radius: '80%'
                          //  explode: true,
                          //           explodeIndex: 1
                        )
                      ],),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bottomText2('Successful', value: _expressChart?.successfullCountExpressTransfer ?? 0),
                      const SizedBox(width: 7,),
                      bottomText2('Failed', value: _expressChart?.failedCountExpressTransfer ?? 0),
                      const SizedBox(width: 7,),
                      bottomText2('Pending', value: _expressChart?.pendingCountExpressTransfer ?? 0),
                    ],
                  )
                ],
              ),
              Container(
                width: 160.7,
                height: 282.12,
                decoration: BoxDecoration(
                  color: Color(0xffF8F9FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    bottomText3('GBP Transactions', value: _expressChart?.totalCountExpressTransferGbp ?? 0),
                    bottomText3('USD Transactions', value: _expressChart?.totalCountExpressTransferUsd ?? 0),
                    bottomText3('CAD Transactions', value: _expressChart?.totalCountExpressTransferCad ?? 0),
                    Row(
                      children: [
                        const WalletStatus2(
                          color: Color(0xff23CE6B),
                          text: 'GBP',
                        ),
                        WalletStatus2(
                          color: primaryColor,
                          text: 'USD',
                        ),
                        const WalletStatus2(
                          color: Color(0xff4DAEF8),
                          text: 'CAD',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              boxy2("Total GBP ", "£ ${_expressChart?.expressTransferGbpSum ?? 0}", "Total USD", "\$${_expressChart?.expressTransferUsdSum ?? 0}", "Total  CAD",
                  "C\$ ${_expressChart?.expressTransferCadSum ?? 0}")
            ],
          )
        ],
      ),
    );
  }
}
