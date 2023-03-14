import 'package:kyshi_operations_dashboard/models/express_chart.dart';
import 'package:kyshi_operations_dashboard/models/kyshiConnectGraph.dart';
import 'package:kyshi_operations_dashboard/models/kyshiConnectOverViewResponse.dart';
import 'package:kyshi_operations_dashboard/models/marketplaceOfferOverView.dart';
import 'package:kyshi_operations_dashboard/models/offersOverview.dart';
import 'package:kyshi_operations_dashboard/screens/over_view_page/market_place_revenue.dart';
import 'package:kyshi_operations_dashboard/userService/overview_service.dart';

import '../helper/screen_export.dart';
import '../models/marketplaceRevenueModel.dart';
import '../userService/userService.dart';

class OverViewProvider extends ChangeNotifier {
  ExpressChart? _expressChart;
  List<OverViewdata> _overViewOffers = [];
  MarketPlaceOfferOverView? _marketPlaceOfferOverView ;
  MarketPlaceRevenueModel? _marketPlaceRevenue;
  Data? _kyshiConnectOverViewResponse;
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
  int _totalConnectTrx =0;
  double _totalNGNGBP = 0;
  double _totalNGNUSD =0;

  get expressChat => _expressChart;
  get overViewOffers => _overViewOffers;
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
  get kyshiConnectOverViewResponse => _kyshiConnectOverViewResponse;
  get kyshiConnectGraph => _kyshiConnectGraph;
  get marketPlaceRevenue => _marketPlaceRevenue;
  get totalOffers => _totalOffers;
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
  void setTotalConnectTrx(int connect) {
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
    print("$responseData RAW DATA EXPRESS");
    final data = responseData;
    _expressChart = ExpressChart.fromJson(data);
    notifyListeners();
    return _expressChart;
  }

  Future<List<OverViewdata>> getOverViewOffers(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getOverViewOffers(context: context, status: _offerStatus,
        baseCurrency: _offerCurrency, daysAgo: _offerDaysAgo);
    print("$responseData OVERVIEW DATA");
    final data = List.from(responseData['data']);
    _overViewOffers = List<OverViewdata>.from(data.map((x) => OverViewdata.fromJson(x)));
    // print("${_overViewOffers.length} llllllllwwwwww");
    notifyListeners();
    return _overViewOffers;
  }
  Future<MarketPlaceOfferOverView?> getMarketPlaceOfferOverView(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getMarketPlaceOfferOverView(context: context,
        baseCurrency: _baseCurrency, daysAgo: _offerDaysAgo, quoteCurrency: _quoteCurrency);
    print("$responseData OVERVIEW DATA");
    // final data = responseData['data'];
    _marketPlaceOfferOverView =  MarketPlaceOfferOverView.fromJson(responseData);
    _totalOffers = _marketPlaceOfferOverView?.totalOffers ?? 0;
    _totalNGNGBP = _marketPlaceOfferOverView?.totalOffers ?? 0;
        print("${_marketPlaceOfferOverView?.toJson()} dddddddddddooo");
    notifyListeners();
    return _marketPlaceOfferOverView;
  }
  Future<MarketPlaceRevenueModel?> getMarketPlaceRevenue(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getMarketPlaceRevenue(context: context, daysAgo: _offerDaysAgo);
    print("$responseData REVENUE DATA");
    // final data = responseData['data'];
    _marketPlaceRevenue =  MarketPlaceRevenueModel.fromJson(responseData);
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


  Future<Data?> getKyshiConnectOverView(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getKyshiConnectOverView(context: context, daysAgo: _offerDaysAgo, connectService: _connectService2);
    // print("${responseData["data"]} CONNECT DATA");
    // print("tessttststtststtsst");
    // final data = responseData['data'];
    _kyshiConnectOverViewResponse =  Data.fromJson(responseData["data"]);
    _totalConnectTrx = _kyshiConnectOverViewResponse?.totalConnectTransaction ?? 0;
    notifyListeners();
    return _kyshiConnectOverViewResponse;
  }


  Future<List<ConnectOverViewGraph>>getKyshiConnectGraph(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
    await OverViewService().getKyshiConnectGraph(context: context, daysAgo: _offerDaysAgo, connectService: _connectService, connectBaseCur: _connectBaseCur);
    // print("$responseData CONNECT DATA");
    // final data = responseData['data'];
    final data = List.from(responseData['data']);
    _kyshiConnectGraph = List<ConnectOverViewGraph>.from(data.map((x) => ConnectOverViewGraph.fromJson(x)));
    // print("${_overViewOffers.length} llllllllwwwwww");
    notifyListeners();
    return _kyshiConnectGraph;
  }
}
