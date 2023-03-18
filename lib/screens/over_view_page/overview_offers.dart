// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:intl/intl.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/create_an_offer_screen_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../helper/convertDate.dart';
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
  const OverViewOffers({super.key, required this.data, required this.totalOffers,
    required this.offerStatus,required this.onChanged, required this.dropdownvalue,
    required this.onChangedCurr, required this.dropdownvalueCurrency});

  @override
  State<OverViewOffers> createState() => _OverViewOffersState();
}

class _OverViewOffersState extends State<OverViewOffers> {
  // late List<OverViewdata> data;
  late  TooltipBehavior _tooltip;
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  late String today;
  late String yesterday;
  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);
  @override
  void initState() {
    super.initState();
    // final String formatted = formatter.format(now);
    // DateTime dateObj = DateFormat('d-MM-yy').parse(formatted);
    today = formatter.format(now);
    yesterday = formatter.format(now.subtract(Duration(days: 1)));
    // subtract(Duration(days:1));
    // print("$today todays date");
    // print("$yesterday yesterday");
    _tooltip = TooltipBehavior(enable: true);
  }
  String targetDate = "2022-04-28";
  int totalTrans = 0;
  int getDays(List<OverViewdata> dat, String today){
    for (int i = 0; i < dat.length; i++) {
      OverViewdata entry = dat[i];
      if (entry.day == today) {
        totalTrans = entry.totalOffers!;
        return totalTrans;
      }
    }
    return 0;
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
    int todayResponse = getDays(overViewProvider.overViewOffers, today);
    int yesterdayResponse =getDays(overViewProvider.overViewOffers, yesterday);

    double? totalOffer(){
      if(overViewProvider.overViewOffers.isEmpty){
        return 0;
      }else{
        return overViewProvider.overViewOffers.map((e) => e.totalOffers).reduce((value, element) => value! + element!)?.toDouble();
      }
    }
    return Container(
      width: MediaQuery.of(context).size.width /2.2,
      height: 400,
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
                TypeOfOfferDropDown(onChanged: widget.onChanged, dropdownvalue: widget.dropdownvalue,),
                CurrencyOfOfferDropDown(dropdownvalueCurrency: widget.dropdownvalueCurrency, onChangedCurr: widget.onChangedCurr,),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: '${totalOffer()}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                    fontSize: 40,
                  ),
                  children: [
                    TextSpan(
                      style: TextStyle(color: Color(0xff6E80A3)),
                      // Provider.of<OverViewProvider>(context,listen: false).offerStatus
                      text: ' ${overViewProvider.offerStatus} Offers!',
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
                  SvgPicture.asset( yesterdayResponse > todayResponse ? high : low,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${getDays(overViewProvider.overViewOffers, yesterday)} Yesterday, $yesterday',
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
                  SvgPicture.asset(todayResponse >yesterdayResponse ? high : low,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${getDays(overViewProvider.overViewOffers, today)} Today, $today',
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
            height: 220,
            width: MediaQuery.of(context).size.width /2.4,
            child: SfCartesianChart(
                isTransposed: true,
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, maximum: totalOffer(), interval: 10),
                tooltipBehavior: _tooltip,
                series: <ChartSeries<OverViewdata, String>>[
                  BarSeries<OverViewdata, String>(
                      dataSource: overViewProvider.overViewOffers,
                      // width: 20,
                      xValueMapper: (OverViewdata data, _) => convertDay(data.day!),
                      yValueMapper: (OverViewdata data, _) => data.totalOffers,
                      name: 'Offers',
                      color: primaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}
