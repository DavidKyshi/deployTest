// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:kyshi_operations_dashboard/models/connectModel/connect_airtime.dart';
import 'package:kyshi_operations_dashboard/models/express_chart.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../helper/screen_export.dart';
import '../../models/connectModel/connect_data.dart';
import '../../models/kyshiConnectGraph.dart';
import '../../models/kyshiConnectOverViewResponse.dart';
import '../../models/marketplaceOfferOverView.dart';
import '../../models/offersOverview.dart';
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
  // late List<StatusData> _chartData;
  // late List<StatusData> connectData;
  late List<OverViewdata> data;
  late List<ConnectOverViewGraph> airtimeData;
  bool isLoadingOffers = false;
  bool isLoading = false;
  bool isLoadingMarketPlaceOverView = false;
  bool isLoadingAirtime = false;
  bool isLoadingConnect = false;
  String dropdownCurrencyPair = "NGN/GBP";
  String dropDownAirtimeGraph = 'Airtime';
  String dropDownAirtimeGraph2 = 'Airtime';
  String dropdownvalue = 'Accepted';
  String dropdownDateValue = 'Last 7 days';
  String dropdownvalueCurrency = 'NGN';
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  late int today;
  late int yesterday;
  String baseCur = "";
  String quoteCur = "";
  late MarketPlaceOfferOverView provider;
  // late Data connectProvider;
  @override
  void initState() {
    super.initState();
    data = overViewProvider.overViewOffers;
    airtimeData = overViewProvider.kyshiConnectGraph;
     provider = overViewProvider.marketPlaceOfferOverView;
     // connectProvider = overViewProvider.kyshiConnectOverViewResponse;
    final String formatted = formatter.format(now);
    DateTime dateObj = DateFormat('d-MM-yy').parse(formatted);
    today = dateObj.day;
    yesterday = dateObj.day - 1;
    // final ngn =(connectProvider.kyshiConnectDataNgnSum!  * 100/connectProvider.totalConnectTransaction!).toStringAsFixed(2);
    // final gbp = (connectProvider.kyshiConnectDataGbpSum!  * 100/connectProvider.totalConnectTransaction!).toStringAsFixed(2);
    // final usd =(connectProvider.kyshiConnectDataUsdSum!  * 100/connectProvider.totalConnectTransaction!).toStringAsFixed(2);
    // final cad = (connectProvider.kyshiConnectDataCadSum!  * 100/connectProvider.totalConnectTransaction!).toStringAsFixed(2);
    // print("$ngn $gbp $usd $cad currency figures");
    // connectData = [
    //   StatusData("NGN", 30 , primaryColor),
    //   StatusData("GBP", 10 ,Color(0XFF2668EC)),
    //   StatusData("USD", 20 ,kyshiGreyishBlue),
    //   StatusData("CAD", 26,Color(0XFF4DAEF8))];
    // _chartData = getChartData();
  }

  double? totalOffer() {
    if (data.isEmpty) {
      return 0;
    } else {
      return data
          .map((e) => e.totalOffers)
          .reduce((value, element) => value! + element!)
          ?.toDouble();
    }
  }

  void selectedCurrency(String pairs) {
    if (pairs == "NGN/GBP") {
      setState(() {
        baseCur = "NGN";
        quoteCur = "GBP";
      });
    } else if (pairs == "NGN/USD") {
      setState(() {
        baseCur = "NGN";
        quoteCur = "USD";
      });
    } else {
      setState(() {
        baseCur = "NGN";
        quoteCur = "CAD";
      });
    }
  }

  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    // final res =(provider.activeOffers!  *100/overViewProvider.totalOffers).toStringAsFixed(2);
    // final accepted = (provider.acceptedOffers! *100/overViewProvider.totalOffers).toStringAsFixed(2);
    // final expired =(provider.expiredOffers! *100/overViewProvider.totalOffers).toStringAsFixed(2);
    // final withdrawn = (provider.withdrawnOffers! *100/overViewProvider.totalOffers).toStringAsFixed(2);
    // _chartData = [
    //   StatusData("Active", double.tryParse(res) , primaryColor),
    //   StatusData("Accepted", double.tryParse(accepted) ,Color(0XFF2668EC)),
    //   StatusData("Expired", double.tryParse(expired) ,kyshiGreyishBlue),
    //   StatusData("Withdrawn", double.tryParse(withdrawn) ,Color(0XFF4DAEF8))];
    return Scaffold(
      backgroundColor: Colors.white,
      body: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
        return SingleChildScrollView(
          child:Column(
            children: [
              SizedBox(height: 20,),
              // Text(dropdownvalue),
              // Text(dropdownvalueCurrency),
              // Text(dropdownDateValue),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    LastDaysFilter(dropdownDateValue: dropdownDateValue, onChangeDate: (String? date ) {
                      setState(() {
                        dropdownDateValue = date!;
                        int daysAgo = dropdownDateValue == "Today" ? today :dropdownDateValue == "Yesterday" ? yesterday : dropdownDateValue == "Last 7 days" ? 7 : 30;
                        Provider.of<OverViewProvider>(context,listen: false).setOfferDaysAgo(daysAgo);
                        // print("$daysAgo dayssssss");
                        isLoading = true;
                        Provider.of<OverViewProvider>(context,listen: false).getOverViewOffers(context: context);
                        data = overViewProvider.overViewOffers;
                      });
                      Future.delayed(Duration(seconds: 3)).then((value) =>
                          setState(() {
                            isLoading = false;
                          })
                      );
                      print("$data data here");
                    },),
                    // CalenderPickDateStatement(),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // CalenderPickDateStatement2(),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoadingOffers ?Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          SizedBox(height: 70,),
                          CupertinoActivityIndicator(
                            color: primaryColor,
                            animating: true,
                            radius: 20,
                          )
                        ],
                      ),
                    ):
                    OverViewOffers(
                      data: data,
                      totalOffers: totalOffer(),
                      offerStatus: overViewProvider.offerStatus,
                      onChanged: (String? value) {
                        final provider = Provider.of<OverViewProvider>(context,listen: false);
                          setState(() {
                            dropdownvalue = value!;
                            isLoadingOffers = true;
                            provider.setOfferStatus(dropdownvalue);
                            provider.getOverViewOffers(context: context);
                            data = overViewProvider.overViewOffers;
                          });
                          // print("${data.map((e) => e.totalOffers)} all totoal ooofffss");
                          Future.delayed(Duration(seconds: 3)).then((value) =>
                              setState(() {
                                isLoadingOffers = false;
                              }));
                          // print(dropdownvalue);
                    }, dropdownvalue: dropdownvalue,
                        onChangedCurr: (String? valueCur) {
                                setState(() {
                                  dropdownvalueCurrency = valueCur!;
                                  isLoadingOffers = true;
                                  Provider.of<OverViewProvider>(context,listen: false).setOfferCurrency(dropdownvalueCurrency);
                                  Provider.of<OverViewProvider>(context,listen: false).getOverViewOffers(context: context);
                                  data = overViewProvider.overViewOffers;
                                });
                                print("${data.map((e) => e.totalOffers)} all totoal currrr");
                                Future.delayed(Duration(seconds: 3)).then((value) =>
                                    setState(() {
                                      isLoadingOffers = false;
                                    }));
                      }, dropdownvalueCurrency: dropdownvalueCurrency,),
                    SizedBox(
                      width: 40,
                    ),
                    isLoadingMarketPlaceOverView ?Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          SizedBox(height: 70,),
                          CupertinoActivityIndicator(
                            color: primaryColor,
                            animating: true,
                            radius: 20,
                          )
                        ],
                      ),
                    ):
                    OverViewMarketPlace(dropdownCurrencyPair: dropdownCurrencyPair,
                      onChangePairs: (String? currencyPairs ) {
                      final provider = Provider.of<OverViewProvider>(context,listen: false);
                      MarketPlaceOfferOverView pro = provider.marketPlaceOfferOverView;
                        setState(() {
                          dropdownCurrencyPair = currencyPairs!;
                          isLoadingMarketPlaceOverView = true;
                          selectedCurrency(dropdownCurrencyPair);
                          provider.setBaseCurrency(baseCur);
                          provider.setQouteCurrency(quoteCur);
                          provider.getMarketPlaceOfferOverView(context: context);
                          // print("${pro.activeOffers} ${pro.acceptedOffers} ${provider.totalOffers} ${pro.closedOffers} ${provider.activeOffers} ${provider.acceptedOffers}all offfffff");
                          // _chartData = [
                          //     StatusData("Active", (pro.activeOffers ?? 0 *100/provider.totalOffers).toDouble() , primaryColor),
                          //     StatusData("Accepted",  (pro.acceptedOffers?? 0 *100/provider.totalOffers).toDouble(),Color(0XFF2668EC)),
                          //     StatusData("Expired",  (pro.expiredOffers ?? 0 *100/provider.totalOffers).toDouble(),kyshiGreyishBlue),
                          //     StatusData("Withdrawn",  (pro.withdrawnOffers?? 0 *100/provider.totalOffers).toDouble(),Color(0XFF4DAEF8))];
                          provider.setTotalOffers(pro.totalOffers ?? 0);
                          // provider.setTotalNGNUSD(pro.totalOffers ?? 0);
                        });
                        Future.delayed(Duration(seconds: 3)).then((value) =>
                                    setState(() {
                                      isLoadingMarketPlaceOverView = false;
                                    }));
                    },  marketPairsData: provider,),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoadingConnect ?Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          SizedBox(height: 70,),
                          CupertinoActivityIndicator(
                            color: primaryColor,
                            animating: true,
                            radius: 20,
                          )
                        ],
                      ),
                    ):
                    OverViewConnect(
                      dropDownAirtimeGraph2: dropDownAirtimeGraph2,
                      onChangedAirtimeGraph: (String? connectService) {
                        ConnectAirtime? dat = overViewProvider.kyshiConnectAirtime;
                        setState(() {
                          dropDownAirtimeGraph2 = connectService!;
                          isLoadingConnect = true;
                          // selectedCurrency(dropdownCurrencyPair);
                          overViewProvider.setConnectService2(dropDownAirtimeGraph2);
                          overViewProvider.getKyshiConnectAirtime(context: context);
                          overViewProvider.getKyshiConnectData(context: context);
                          // dropDownAirtimeGraph2 == "Airtime" ? overViewProvider.getKyshiConnectAirtime(context: context) :
                         // dropDownAirtimeGraph2 == "Data" ?overViewProvider.getKyshiConnectData(context: context) :
                         overViewProvider.getKyshiConnectHealth(context: context);
                          overViewProvider.setTotalConnectTrx(dat?.data?.totalConnectTransactionSum ?? 0);
                          // provider.setTotalNGNUSD(pro.totalOffers ?? 0);
                        });
                        Future.delayed(Duration(seconds: 3)).then((value) =>
                            setState(() {
                              isLoadingConnect = false;
                            }));
                    }),
                    SizedBox(
                      width: 40,
                    ),
                    isLoadingAirtime ?Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          SizedBox(height: 70,),
                          CupertinoActivityIndicator(
                            color: primaryColor,
                            animating: true,
                            radius: 20,
                          )
                        ],
                      ),
                    ):
                    OverViewAirtime(
                      dropDownAirtimeGraph: dropDownAirtimeGraph,
                      onChangedAirtimeGraph: (String? connectService) {
                        // final provider = Provider.of<OverViewProvider>(context,listen: false);
                        setState(() {
                          isLoadingAirtime = true;
                          dropDownAirtimeGraph = connectService!;
                          overViewProvider.setConnectService(dropDownAirtimeGraph);
                          overViewProvider.getKyshiConnectGraph(context: context);
                          airtimeData = overViewProvider.kyshiConnectGraph;
                          // provider.setTotalNGNUSD(pro.totalOffers ?? 0);
                        });
                        Future.delayed(Duration(seconds: 3)).then((value) =>
                            setState(() {
                              isLoadingAirtime = false;
                            }));
                    },
                      dropdownvalueCurrency: dropdownvalueCurrency,
                      onChangedCurr: (String? valueCur) {
                        setState(() {
                          isLoadingAirtime = true;
                          dropdownvalueCurrency = valueCur!;
                          overViewProvider.setConnectBaseCur(dropdownvalueCurrency);
                          overViewProvider.getKyshiConnectGraph(context: context);
                          airtimeData = overViewProvider.kyshiConnectGraph;
                          // provider.setTotalNGNUSD(pro.totalOffers ?? 0);
                        });
                        Future.delayed(Duration(seconds: 3)).then((value) =>
                            setState(() {
                              isLoadingAirtime = false;
                            }));

                    })
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              isLoading ?Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    SizedBox(height: 70,),
                    CupertinoActivityIndicator(
                      color: primaryColor,
                      animating: true,
                      radius: 20,
                    )
                  ],
                ),
              ):
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
                ),),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                //   child: Row(
                //     children: [
                //       MarketPlaceRevenue(),
                //       SizedBox(
                //         width: 20,
                //       ),
                //       OverViewExpressChart()
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20,
                )
                // Container(
                //   width: 651.67,
                //   height: 338.4,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(color: const Color(0xffE8E8E8))
                //   ),
                //   child: Column(
                //     children: [
                //       const Text('Express Transfers',
                //         style: TextStyle(
                //             color: Color(0xff0D2C65),
                //             fontWeight: FontWeight.w400,
                //             fontSize: 18
                //         ),
                //       ),
                //       Row(
                //         children: [
                //           SizedBox(
                //             height: 400,
                //             child: SfCircularChart(series: <CircularSeries>[
                //               DoughnutSeries<StatusData, String>(
                //                 dataSource: _chartData,
                //                 xValueMapper: (StatusData data, _)=> data.status,
                //                 yValueMapper: (StatusData data, _)=> data.amount,
                //                 dataLabelSettings: DataLabelSettings(isVisible: true) ,
                //                 //  explode: true,
                //                 //           explodeIndex: 1
                //               )
                //             ],),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
  // List<StatusData> getChartData(){
  //   final expressChart = overViewProvider.expressChart;
  //   final List<StatusData> chartData = [
  //     StatusData("Successful",  20),
  //     StatusData("Pending",  50),
  //     StatusData("Failed",  30)
  //   ];
  //   return chartData;
  // }
}

class StatusData {
  StatusData(
    this.status,
    this.amount,
    this.color,
  );
  final String status;
  final double? amount;
  final Color color;
}
