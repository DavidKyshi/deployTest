import 'package:kyshi_operations_dashboard/models/connectModel/connect_airtime.dart';
import 'package:kyshi_operations_dashboard/models/connectModel/connect_data.dart';
import 'package:kyshi_operations_dashboard/models/connectModel/connect_health.dart';
import 'package:kyshi_operations_dashboard/models/express_chart.dart';
import 'package:kyshi_operations_dashboard/models/kyshiConnectGraph.dart';
import 'package:kyshi_operations_dashboard/models/kyshiConnectOverViewResponse.dart';
import 'package:kyshi_operations_dashboard/models/marketplaceOfferOverView.dart';
import 'package:kyshi_operations_dashboard/models/offersOverview.dart';
import 'package:kyshi_operations_dashboard/screens/over_view_page/market_place_revenue.dart';
import 'package:kyshi_operations_dashboard/userService/overview_service.dart';

import '../helper/screen_export.dart';
import '../models/marketplaceRevenueModel.dart';
import '../screens/over_view_page/over_view.dart';
import '../styleguide/colors.dart';
import '../userService/userService.dart';

class OverViewProvider extends ChangeNotifier {
  ExpressChart? _expressChart;
  List<OverViewdata> _overViewOffers = [];
  List<StatusData> _chartData = [];
  List<StatusData> _statusDataAirtime = [];
  List<StatusData>_statusDataHealth = [];
  List<StatusData>_statusData = [];
  MarketPlaceOfferOverView? _marketPlaceOfferOverView ;
  MarketPlaceRevenueModel? _marketPlaceRevenue;
  ConnectAirtime? _kyshiConnectAirtime;
  ConnectData? _kyshiConnectData;
  ConnectHealth? _kyshiConnectHealth;
  List<ConnectOverViewGraph> _kyshiConnectGraph = [];
  double _ngnRevenue = 0;
  double _gbpRevenue = 0;
  double _usdRevenue = 0;
  double _cadRevenue = 0;
  String _offerStatus = "ACCEPTED";
  String _connectService2 = "airtime";
  String _connectService = "airtime";
  String _connectBaseCur = "NGN";
  String _offerCurrency = "NGN";
  String _baseCurrency = "NGN";
  String _quoteCurrency = "GBP";
  int _offerDaysAgo = 500;
  double _totalOffers = 0;
  double _activeOffers = 0;
  double _expiredOffers = 0;
  double _acceptedOffers = 0;
  double _withDrawnOffers = 0;
  double _totalConnectTrx =0;
  double _totalNGNGBP = 0;
  double _totalNGNUSD =0;

  get chatData => _chartData;
  get statusDataAirtime => _statusDataAirtime;
  get statusDataHealth =>_statusDataHealth;
  get statusData => _statusData;
  get expressChat => _expressChart;
  List<OverViewdata> get overViewOffers => _overViewOffers;
  get ngnRevenue => _ngnRevenue;
  get usdRevenue => _usdRevenue;
  get gbpRevenue => _gbpRevenue;
  get cadRevenue => _cadRevenue;
  get offerStatus => _offerStatus;
  get connectService2 => _connectService2;
  get connectService => _connectService;
  get connectBaseCur => _connectBaseCur;
  get offerCurrency => _offerCurrency;
  get baseCurrency => _baseCurrency;
  get quoteCurrency => _quoteCurrency;
  get marketPlaceOfferOverView => _marketPlaceOfferOverView;
  ConnectAirtime? get kyshiConnectAirtime => _kyshiConnectAirtime;
  ConnectData? get kyshiConnectData => _kyshiConnectData;
  ConnectHealth? get kyshiConnectHealth=> _kyshiConnectHealth;
  List <ConnectOverViewGraph> get kyshiConnectGraph => _kyshiConnectGraph;
  get marketPlaceRevenue => _marketPlaceRevenue;
  get totalOffers => _totalOffers;
  get activeOffers => _activeOffers;
  get expiredOffers => _expiredOffers;
  get acceptedOffers => _acceptedOffers;
  get withDrawnOffers => _withDrawnOffers;
  get totalConnectTrx => _totalConnectTrx;
  get totalNGNGBP => _totalNGNGBP;
  get totalNGNUSD => _totalNGNUSD;
  void setOfferStatus(String name) {
    _offerStatus = name;
    notifyListeners();
  }

  void setOfferCurrency(String name) {
    _offerCurrency = name;
    notifyListeners();
  }

  void setOfferDaysAgo(int days) {
    _offerDaysAgo = days;
    notifyListeners();
  }
  void setTotalOffers(double offers) {
    _totalOffers = offers;
    notifyListeners();
  }
  void setTotalConnectTrx(double connect) {
    _totalConnectTrx = connect;
    notifyListeners();
  }
  void setTotalNGNGBP(double offers) {
    _totalNGNGBP = offers;
    notifyListeners();
  }
  void setTotalNGNUSD(double offers) {
    _totalNGNUSD = offers;
    notifyListeners();
  }

  void setQouteCurrency(String name) {
    _quoteCurrency = name;
    notifyListeners();
  }

  void setBaseCurrency(String name) {
    _baseCurrency = name;
    notifyListeners();
  }
  void setConnectService(String name) {
    _connectService = name;
    notifyListeners();
  }
  void setConnectService2(String name) {
    _connectService2 = name;
    notifyListeners();
  }
  void setConnectBaseCur(String name) {
    _connectBaseCur = name;
    notifyListeners();
  }

  Future<ExpressChart?> getAllExpressChart(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
        await OverViewService().getExpressChart(context: context, daysAgo: _offerDaysAgo);
    // print("$responseData RAW DATA EXPRESS");
    final data = responseData;
    _expressChart = ExpressChart.fromJson(data);
    notifyListeners();
    return _expressChart;
  }

  Future<List<OverViewdata>> getOverViewOffers(
      {required BuildContext context}) async {
    // print(" OVERVIEW OFFERS DATA CALLED");
    Map<String, dynamic> responseData =
    await OverViewService().getOverViewOffers(context: context, status: _offerStatus,
        baseCurrency: _offerCurrency, daysAgo: _offerDaysAgo);
    // print("$responseData OVERVIEW OFFERS DATA");
    final data = List.from(responseData['data']);
    _overViewOffers = List<OverViewdata>.from(data.map((x) => OverViewdata.fromJson(x)));
    // print("${_overViewOffers.map((e) => e.totalOffers).reduce((value, element) => value! +element! )} llllllllwwwwww");
    notifyListeners();
    return _overViewOffers;
  }

  Future<MarketPlaceOfferOverView?> getMarketPlaceOfferOverView(
      {required BuildContext context}) async
  {
    Map<String, dynamic> responseData =
    await OverViewService().getMarketPlaceOfferOverView(context: context,
        baseCurrency: _baseCurrency, daysAgo: _offerDaysAgo, quoteCurrency: _quoteCurrency);
    // final data = responseData['data'];
    _marketPlaceOfferOverView = MarketPlaceOfferOverView.fromJson(responseData);
    _totalOffers = _marketPlaceOfferOverView?.totalOffers ?? 0;
    _totalNGNGBP = _marketPlaceOfferOverView?.ngnGbpAndGbpNgnOffers ?? 0;
    _totalNGNUSD = _marketPlaceOfferOverView?.ngnUsdAndUsdNgnOffers ?? 0;
    _activeOffers = _marketPlaceOfferOverView?.activeOffers ?? 0;
    _expiredOffers = _marketPlaceOfferOverView?.expiredOffers ?? 0;
    _acceptedOffers = _marketPlaceOfferOverView?.acceptedOffers ?? 0;
    _withDrawnOffers = _marketPlaceOfferOverView?.withdrawnOffers ?? 0;

    _chartData = [
      StatusData("Active", double.tryParse(((_activeOffers *100/_totalOffers).toDouble()).toStringAsFixed(2)), primaryColor),
      StatusData("Accepted",  double.tryParse(((_acceptedOffers *100/_totalOffers).toDouble()).toStringAsFixed(2)),const Color(0XFF2668EC)),
      StatusData("Expired",  double.tryParse(((_expiredOffers *100/_totalOffers).toDouble()).toStringAsFixed(2)),kyshiGreyishBlue),
      StatusData("Withdrawn",  double.tryParse(((_withDrawnOffers*100/_totalOffers).toDouble()).toStringAsFixed(2)),const Color(0XFF4DAEF8))];

        // print("${_marketPlaceOfferOverView?.toJson()} dddddddddddooo");
    notifyListeners();
    return _marketPlaceOfferOverView;
  }

  Future<MarketPlaceRevenueModel?> getMarketPlaceRevenue(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getMarketPlaceRevenue(context: context, daysAgo: _offerDaysAgo);
    // print("$responseData REVENUE DATA");
    // final data = responseData['data'];
    _marketPlaceRevenue = MarketPlaceRevenueModel.fromJson(responseData);
    _ngnRevenue = _marketPlaceRevenue?.ngnRevenue?.serviceChargeSum ?? 0.0;
    _usdRevenue = _marketPlaceRevenue?.usdRevenue?.serviceChargeSum ?? 0.0;
    _gbpRevenue = _marketPlaceRevenue?.gbpRevenue?.serviceChargeSum ?? 0.0;
    _cadRevenue = _marketPlaceRevenue?.cadRevenue?.serviceChargeSum ?? 0.0;
    // _totalOffers = _marketPlaceOfferOverView?.totalOffers ?? 0;
    // _totalNGNGBP = _marketPlaceOfferOverView?.totalOffers ?? 0;
    // print("${_marketPlaceRevenue?.toJson()} dddddddddddooo");
    notifyListeners();
    return _marketPlaceRevenue;
  }


  Future<ConnectAirtime?> getKyshiConnectAirtime(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getKyshiConnectOverView(context: context, daysAgo: _offerDaysAgo, connectService: "airtime");
    // print("${responseData["data"]} CONNECT AIRTIME");
    // print("tessttststtststtsst");
    final data = responseData['data'];
    _kyshiConnectAirtime =ConnectAirtime.fromJson(responseData);
    // _connectService2 == "airtime"?ConnectAirtime.fromJson(responseData["data"]):
    // _connectService2 == "data" ? ConnectData.fromJson(responseData["data"]) : ConnectHealth.fromJson(responseData["data"]);
    _totalConnectTrx = _kyshiConnectAirtime?.data?.totalConnectTransactionSum ?? 0;
    int test = _kyshiConnectAirtime?.data?.kyshiConnectAirtimeNgnSum?.toInt() ?? 0;
    _statusDataAirtime = [
      StatusData("NGN", double.tryParse(((_kyshiConnectAirtime!.data!.kyshiConnectAirtimeNgnSum! *100/test).toDouble()).toStringAsFixed(2)), primaryColor),
      StatusData("GBP",  double.tryParse(((_kyshiConnectAirtime?.data?.kyshiConnectAirtimeGbpSum ?? 0 *100/test).toDouble()).toStringAsFixed(2)),const Color(0XFF2668EC)),
      StatusData("USD",  double.tryParse(((_kyshiConnectAirtime?.data?.kyshiConnectAirtimeUsdSum ?? 0 *100/test).toDouble()).toStringAsFixed(2)),kyshiGreyishBlue),
      StatusData("CAD",  double.tryParse(((_kyshiConnectAirtime?.data?.kyshiConnectAirtimeCadSum ?? 0 *100/test).toDouble()).toStringAsFixed(2)),const Color(0XFF4DAEF8))];
    notifyListeners();
    return _kyshiConnectAirtime;
  }
  Future<ConnectData?> getKyshiConnectData(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getKyshiConnectOverView(context: context, daysAgo: _offerDaysAgo, connectService: "data");
    // print("${responseData["data"]} CONNECT DATA");
    // print("tessttststtststtsst");
    final data = responseData['data'];
    _kyshiConnectData =ConnectData.fromJson(responseData);
    // _connectService2 == "airtime"?ConnectAirtime.fromJson(responseData["data"]):
    // _connectService2 == "data" ? ConnectData.fromJson(responseData["data"]) : ConnectHealth.fromJson(responseData["data"]);
    _totalConnectTrx = _kyshiConnectAirtime?.data?.totalConnectTransactionSum ?? 0;
    int test = _kyshiConnectData?.totalConnectTransactionSum?.toInt() ?? 0;
    _statusData = [
      StatusData("NGN", double.tryParse(((_kyshiConnectData?.kyshiConnectDataNgnSum ?? 0 *100/test).toDouble()).toStringAsFixed(2)), primaryColor),
      StatusData("GBP",  double.tryParse(((_kyshiConnectData?.kyshiConnectDataNgnSum ??0 *100/test).toDouble()).toStringAsFixed(2)),const Color(0XFF2668EC)),
      StatusData("USD",  double.tryParse(((_kyshiConnectData?.kyshiConnectDataNgnSum ??0 *100/test).toDouble()).toStringAsFixed(2)),kyshiGreyishBlue),
      StatusData("CAD",  double.tryParse(((_kyshiConnectData?.kyshiConnectDataNgnSum ??0 *100/test).toDouble()).toStringAsFixed(2)),const Color(0XFF4DAEF8))];
    notifyListeners();
    return _kyshiConnectData;
  }

  Future<ConnectHealth?> getKyshiConnectHealth(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getKyshiConnectOverView(context: context, daysAgo: _offerDaysAgo, connectService: "health");
    // print("${responseData["data"]} CONNECT HEALTH");
    // print("tessttststtststtsst");
    final data = responseData['data'];
    _kyshiConnectHealth = ConnectHealth.fromJson(responseData);
    // _connectService2 == "airtime"?ConnectAirtime.fromJson(responseData["data"]):
    // _connectService2 == "data" ? ConnectData.fromJson(responseData["data"]) : ConnectHealth.fromJson(responseData["data"]);
    _totalConnectTrx = _kyshiConnectAirtime?.data?.totalConnectTransactionSum ?? 0;
    int test = _kyshiConnectHealth?.data?.totalConnectTransactionSum?.toInt() ?? 0;
    _statusDataHealth = [
      StatusData("NGN", double.tryParse(((_kyshiConnectHealth?.data?.kyshiConnectHealthNgnSum ?? 0 *100/test).toDouble()).toStringAsFixed(2)), primaryColor),
      StatusData("GBP",  double.tryParse(((_kyshiConnectHealth?.data?.kyshiConnectHealthGbpSum ??0 *100/test).toDouble()).toStringAsFixed(2)),const Color(0XFF2668EC)),
      StatusData("USD",  double.tryParse(((_kyshiConnectHealth?.data?.kyshiConnectHealthUsdSum ?? 0 *100/test).toDouble()).toStringAsFixed(2)),kyshiGreyishBlue),
      StatusData("CAD",  double.tryParse(((_kyshiConnectHealth?.data?.kyshiConnectHealthCadSum ?? 0 *100/test).toDouble()).toStringAsFixed(2)),const Color(0XFF4DAEF8))];
    notifyListeners();
    return _kyshiConnectHealth;
  }


  Future<List<ConnectOverViewGraph>>getKyshiConnectGraph(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getKyshiConnectGraph(context: context, daysAgo: _offerDaysAgo, connectService: _connectService, connectBaseCur: _connectBaseCur);
    // print("$responseData CONNECT DATA");
    // final data = responseData['data'];
    final data = List.from(responseData['data']);
    // print("$data connect graph");
    _kyshiConnectGraph = List<ConnectOverViewGraph>.from(data.map((x) => ConnectOverViewGraph.fromJson(x)));
    // print("${_overViewOffers.length} llllllllwwwwww");
    notifyListeners();
    return _kyshiConnectGraph;
  }
}
