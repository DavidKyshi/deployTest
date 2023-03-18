// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/create_an_offer_screen_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/offersOverview.dart';
import '../../providers/over_view_provider.dart';
import '../../widgets/over_view_widgets.dart';
import 'over_view_marketplace.dart';

class OverViewOffers extends StatefulWidget {
  final List<OverViewdata> data;
  final double? totalOffers;
  final Function(String?)? onChanged;
  final Function(String?)? onChangedCurr;
  final String dropdownvalueCurrency;
  final String dropdownvalue;
  final String offerStatus;
  const OverViewOffers(
      {super.key,
      required this.data,
      required this.totalOffers,
      required this.offerStatus,
      required this.onChanged,
      required this.dropdownvalue,
      required this.onChangedCurr,
      required this.dropdownvalueCurrency});

  @override
  State<OverViewOffers> createState() => _OverViewOffersState();
}

class _OverViewOffersState extends State<OverViewOffers> {
  late List<OverViewdata> data;
  late TooltipBehavior _tooltip;
  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);
  @override
  void initState() {
    super.initState();
    data = overViewProvider.overViewOffers;
    //
    // final res =(data.map((e) => e.totalOffers).reduce((value, element) => value! + element!)?.toDouble()) ?? 0;

    // final provider = Provider.of<OverViewProvider>(context,listen: false);
    // (data.map((e) => e.totalOffers).reduce((value, element) => value! + element!)?.toDouble()) ?? 0;
    // data = [
    //   ChartData('Mon', 12),
    //   ChartData('Tues', 15),
    //   ChartData('Weds', 30),
    //   ChartData('Thurs', 6.4),
    //   ChartData('Fri', 14),
    //   ChartData('Sat', 24),
    //   ChartData('Sun', 21),
    // ];
    // _chartData = getChartData();
    _tooltip = TooltipBehavior(enable: true);
  }

  // double? totalOffer(){
  //   if(data.isEmpty){
  //     return 0;
  //   }else{
  //     return data.map((e) => e.totalOffers).reduce((value, element) => value! + element!)?.toDouble();
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.64,
      // height: 375.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffE8E8E8))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TypeOfOfferDropDown(
                  onChanged: widget.onChanged,
                  dropdownvalue: widget.dropdownvalue,
                ),
                CurrencyOfOfferDropDown(
                  dropdownvalueCurrency: widget.dropdownvalueCurrency,
                  onChangedCurr: widget.onChangedCurr,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '${widget.totalOffers}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                    fontSize: 40,
                  ),
                  children: [
                TextSpan(
                  style: TextStyle(color: Color(0xff6E80A3)),
                  // Provider.of<OverViewProvider>(context,listen: false).offerStatus
                  text: ' ${widget.offerStatus} Offers!',
                )
              ])),
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
                    '0 Yesterday, March 7',
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
                    '0 Today, March 8',
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
          SizedBox(
            height: 390,
            width: 600,
            child: SfCartesianChart(
                isTransposed: true,
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: widget.totalOffers != 0 ? widget.totalOffers : 40,
                    interval: 10),
                tooltipBehavior: _tooltip,
                series: <ChartSeries<OverViewdata, String>>[
                  BarSeries<OverViewdata, String>(
                      dataSource: widget.data,
                      // width: 20,
                      xValueMapper: (OverViewdata data, _) => data.day,
                      yValueMapper: (OverViewdata data, _) => data.totalOffers,
                      name: 'Offers',
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)))
                ]),
          ),
        ],
      ),
    );
  }
}
