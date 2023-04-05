import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/models/cardResponse.dart';
import 'package:kyshi_operations_dashboard/models/connectServices.dart';
import 'package:kyshi_operations_dashboard/models/login.dart';
import 'package:kyshi_operations_dashboard/models/users.dart';
import 'package:kyshi_operations_dashboard/models/wallet_management.dart';

import '../helper/internalDio.dart';
import '../models/transactions.dart';
import '../userService/userService.dart';

class UsersProvider extends ChangeNotifier {
  List<User> editUsers = [];
  List<User> _users = [];
  dynamic _page = "0";
  dynamic _totalUserPage = 0;
  List<User> _singleUser = [];
  String _loginError = "";
  String? _currentSelectedUserId;
  String? _currentSelectedWalletId = "";
  bool _single = false;
  late LoginModel _loggedInAdmin;
  String? _adminName;

  //String? currency = users.first.wallets!.first.currency;
  String? _currentUserName = "";
  String? _accessToken;

  List<Services> _connectAirtimeService = [];
  List<Services> _connectDataService = [];
  List<Services> _connectHealthService = [];
  Services? _cards;
  List<CardTransactions> _kyshiCard = [];
  List<CardTransactions> _kyshiCardCreditTransactions = [];
  List<CardTransactions> _kyshiCardDebitTransactions = [];
  List<Wallet> _allWallets = [];
  List<Wallet> _pendingWallets = [];
  List<Wallet> _activeWallets = [];
  List<Wallet> _rejectedWallets = [];
  List<TransactionsData> _transactions = [];

  // get wallet => _wallet;
  get accessToken => _accessToken;
  get users => _users;
  get page => _page;
  get totalUserPage => _totalUserPage;
  get cards => _cards;
  get adminName => _adminName;
  List<User> get singleUser => _singleUser;
  get single => _single;
  get loginError => _loginError;
  get currentSelectedUserId => _currentSelectedUserId;
  get currentSelectedWalletId => _currentSelectedWalletId;
  get loggedInAdmin => _loggedInAdmin;
  get connectAirtimeService => _connectAirtimeService;
  get connectDataService => _connectDataService;
  get connectHealthService => _connectHealthService;
  get kyshiCard => _kyshiCard;
  get kyshiCardTransactions => _kyshiCardCreditTransactions;
  get kyshiCardDebitTransactions => _kyshiCardDebitTransactions;
  get transactions => _transactions;
  get currentUserName => _currentUserName;
  get allWallets => _allWallets;
  get activeWallets => _activeWallets;
  get rejectedWallets => _rejectedWallets;
  // get inActiveWallets => _inActiveWallets;
  get pendingWallets => _pendingWallets;

  void selectUser(String id) {
    _currentSelectedUserId = id;
    notifyListeners();
  }
  void setAdminName(String name) {
    _adminName = name;
    notifyListeners();
  }

  User? getUserById([String? id]) {
    // print("getuserID called$currentSelectedUserId");
    // print("$users get$_single users $currentSelectedUserId");
    List<User> userss = singleUser;
    // _single ?   singleUser.firstWhere(
    //         (element) => element.id == (id ?? _currentSelectedUserId)) :users.firstWhere(
    //         (element) => element.id == (id ?? _currentSelectedUserId));
    if(!_single){
      return users.firstWhere(
              (element) => element.id == (id ?? _currentSelectedUserId));
    }else{
      return  singleUser.firstWhere(
              (element) => element.id == (id ?? _currentSelectedUserId));
    }
    // if (users.isEmpty) return null;
    // if (id == null && currentSelectedUserId == null) return null;
    // notifyListeners();
    // print("${userss.firstWhere((element) => element.id == (id ?? currentSelectedUserId))}kjkjkjsjskj");
    // return userss.firstWhere(
    //     (element) => element.id == (id ?? currentSelectedUserId),
    //     orElse: null);

  }

  void setCurrentUser(String name) {
    _currentUserName = name;
    notifyListeners();
  }

  void selectWalletId(String id) {
    _currentSelectedWalletId = id;
    notifyListeners();
  }

  void setAccessToken(String token) {
    _accessToken = token;
    notifyListeners();
  }

  void setSingle(bool user) {
    _single = user;
    notifyListeners();
  }

  void setLoginError(String error) {
    _loginError = error;
    notifyListeners();
  }

  void setAdmin(LoginModel admin) {
    _loggedInAdmin = admin;
    notifyListeners();
  }

  Future<List<User>> getUsers(
      {required BuildContext context,  String? entrySize, int? page}) async {
    print("GET USERS CALLED");
    Map<String, dynamic> responseData;
    if(page == null){
       responseData =
      await UserService().getAllUsers(context: context, entrySize: entrySize);
    }else{
      responseData =
      await UserService().getAllUsers(context: context, entrySize: entrySize,page: page);
    }
    UserApiResponse res = UserApiResponse.fromJson(responseData);
    _page = res.page ?? "0";
    _totalUserPage = res.totalPages ?? 0;
      final data = List.from(responseData['data']);
      _users = List<User>.from(data.map((x) => User.fromJson(x)));
      print("${_users.length} ALL USERS RAW DATA");

    // print("$responseData RAW DATA");
    notifyListeners();
    return users;
  }
  Future<List<User>> getSingleUser(
      {required BuildContext context, String? email }) async {
    print("GET USERS CALLED");
    Map<String, dynamic> responseData = await UserService().getAllUsers(context: context, email: email);
      // Map<String, dynamic> responseData =
      // await UserService().getAllUsers(context: context, email: email);
      final data = List.from(responseData['data']);
      _singleUser = List<User>.from(data.map((x) => User.fromJson(x)));
      // _users = _singleUser;
      print("${_singleUser} _usersssss");
      // return _singleUser;

    // print("$responseData RAW DATA");
    notifyListeners();
    return singleUser;
  }

  Future<List<User>> getDaysAgo(
      {required BuildContext context, required String? daysAgo}) async {
    print("GET USERS CALLED");
    Map<String, dynamic> responseData =
        await UserService().getAllUsers(context: context, daysAgo: 1);
    // print("$responseData RAW DATA");
    final data = List.from(responseData['data']);
    _users = List<User>.from(data.map((x) => User.fromJson(x)));
    print("${_users.length} ALL USERS RAW DATA");
    notifyListeners();
    return users;
  }

  Future<List<User>> getUsersByRange(
      {required BuildContext context,
      required String startDate,
      required String endDate}) async {
    print("GET USERS CALLED");
    Map<String, dynamic> responseData = await UserService()
        .getAllUsers(context: context, startDate: startDate, endDate: endDate);
    // print("$responseData RAW DATA");
    final data = List.from(responseData['data']);
    _users = List<User>.from(data.map((x) => User.fromJson(x)));
    print("${_users.length} ALL USERS RAW DATA");
    notifyListeners();
    return users;
  }

  Future<List<Services>> getConnectAirtimeService(BuildContext context, String service) async {
    // 182e04da-a23b-4a73-8bd8-9bbabc19525d
    Map<String, dynamic> responseData = await UserService()
        .getKyshiConnectServices(userId: _currentSelectedUserId ?? "", context: context,daysAgo: "120",service: service);
    final data = List.from(responseData['data']);
    _connectAirtimeService = List<Services>.from(data.map((x) => Services.fromJson(x)));
    notifyListeners();
    return _connectAirtimeService;
  }
  Future<List<Services>> getConnectHealthService(BuildContext context, String service) async {
    // 182e04da-a23b-4a73-8bd8-9bbabc19525d
    Map<String, dynamic> responseData = await UserService()
        .getKyshiConnectServices(userId: _currentSelectedUserId ?? "", context: context,daysAgo: "120",service: service);
    final data = List.from(responseData['data']);
    _connectHealthService =List<Services>.from(data.map((x) => Services.fromJson(x)));
    notifyListeners();
    return _connectHealthService;
  }
  Future<List<Services>> getConnectDataService(BuildContext context, String service) async {
    // 182e04da-a23b-4a73-8bd8-9bbabc19525d
    Map<String, dynamic> responseData = await UserService()
        .getKyshiConnectServices(userId: _currentSelectedUserId ?? "", context: context,daysAgo: "120",service: service);
    final data = List.from(responseData['data']);
    _connectDataService =List<Services>.from(data.map((x) => Services.fromJson(x)));
    notifyListeners();
    return _connectDataService;
  }

  // Future<List<User>> getAllEditProfile({
  //    required String user_id,
  //    required String first_name,
  //    required String last_name,
  //    required String middle_name,
  //    required String email,
  //    required String phone_number,
  //    required String occupation,
  //    required String nationality,
  //    required String residence,
  //    required String dob,
  //    required String gender,
  //    required BuildContext context}) async {
  //   // 182e04da-a23b-4a73-8bd8-9bbabc19525d
  //   Map<String, dynamic> responseData = await UserService().getEditProfile(
  //       user_id: user_id,
  //       first_name: first_name,
  //       last_name: last_name,
  //        middle_name: middle_name,
  //       gender: gender,
  //       email: email,
  //      phone_number: phone_number,
  //      occupation: occupation,
  //       nationality: nationality,
  //       residence: residence,
  //       dob: dob,
  //       context:context);
  //   final data = List.from(responseData['data']);
  //   editUsers = List<User>.from(data.map((x) => User.fromJson(x)));
  //   notifyListeners();
  //   return editUsers;
  // }
  //getEditProfile

  Future<Response?> getEditProfile({
    required String user_id,
    required String first_name,
    required String last_name,
    required String middle_name,
    required String email,
    required String phone_number,
    required String occupation,
    required String nationality,
    required String residence,
    required String dob,
    required String gender,
    required BuildContext context,
  }) async {
    String baseUrl = dotenv.env['API_URL']!;
    final token =
        Provider.of<UsersProvider>(context, listen: false).accessToken;
    //final Uri uri = Uri.parse("$baseUrl//ops/update-user-details");
    try {
      // customInternalDio.get("/ops/users",)
      Response response = await customInternalDio.post(
        "/ops/update-user-details",
        options: Options(headers: {"authorization": "Bearer $token"}),
        data: {
          "user_id": user_id,
          "first_name": first_name,
          "last_name": last_name,
          "middle_name": middle_name,
          "email": email,
          "phone_number": phone_number,
          "occupation": occupation,
          "nationality": nationality,
          "residence": residence,
          "dob": dob,
          "gender": gender
        },
      );
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("$e An error occurred");
      }
      if (e is DioError) {
        print("${e.response?.data}hkhgjghbjhgb");
        throw e.response?.data;
      }
      rethrow;
    }
  }

  // Future<List<TransactionsData>> getTransactions() async {
  //   Map<String, dynamic> responseData = await UserService()
  //       .getKyshiConnectTransactions(userId: currentSelectedUserId ?? "");
  Future<List<TransactionsData>> getTransactions(BuildContext context) async {
    Map<String, dynamic> responseData = await UserService()
        .getKyshiConnectTransactions(
            userId: _currentSelectedUserId ?? "", context: context);
    final data = List.from(responseData['data']);
    _transactions = List<TransactionsData>.from(
        data.map((x) => TransactionsData.fromJson(x)));
    notifyListeners();
    return _transactions;
  }

  Future<List<CardTransactions>> getCards(BuildContext context) async {
    // Map<String, dynamic> responseData = await UserService()
    Map<String, dynamic> responseData = await UserService()
        .getKyshiCard(userId: _currentSelectedUserId ?? "", context: context);
    final data = List.from(responseData["card_details"]);
    print("${data} raw card data");
    _kyshiCard = List<CardTransactions>.from(data.map((x) => CardTransactions.fromJson(x)));
    print("${_kyshiCard} all cardsssss");
    notifyListeners();
    return _kyshiCard;
  }

  Future<List<CardTransactions>> getCardCreditTransactions(BuildContext context) async {
    // Map<String, dynamic> responseData = await UserService()
    Map<String, dynamic> creditResponseData = await UserService().getKyshiCardTransactions
      (userId: _currentSelectedUserId ?? "", context: context, type: "CR", daysAgo: "120");
    final data = List.from(creditResponseData["data"]);
    _kyshiCardCreditTransactions = List<CardTransactions>.from(data.map((x) => CardTransactions.fromJson(x)));
    print("${_kyshiCardCreditTransactions} all cardsssss");
    notifyListeners();
    return _kyshiCardCreditTransactions;
  }
  Future<List<CardTransactions>> getCardDebitTransactions(BuildContext context) async {
    // Map<String, dynamic> responseData = await UserService()

    Map<String, dynamic> debitResponseData = await UserService().getKyshiCardTransactions
      (userId: _currentSelectedUserId ?? "", context: context, type: "DR", daysAgo: "120");
    final dataBt = List.from(debitResponseData["data"]);
    // print("$data $dataBt raw card data");
    _kyshiCardDebitTransactions = List<CardTransactions>.from(dataBt.map((x) => CardTransactions.fromJson(x)));
    notifyListeners();
    return _kyshiCardDebitTransactions;
  }

  Future<List<Wallet>> getAllWallets(
      BuildContext context, String entrySize) async {
    print("getALL WALLETS CALLED");
    Map<String, dynamic> responseData = await UserService()
        .getWalletManagement(context: context, entrySize: entrySize);
    final data = List.from(responseData['data']);
    _allWallets = List<Wallet>.from(data.map((x) => Wallet.fromJson(x)));
    // print("${_allWallets.map((e) => e.status)} XXXXXXXXXXX");
    // print( _allWallets.map((e) => "${e.toJson()}  ALL WALLETS OBJECT"));

    _pendingWallets = _allWallets
        .where((element) =>
            element.status == "PENDING" || element.status == "IN_PROGRESS")
        .toList();
    _activeWallets =
        _allWallets.where((element) => element.status == "ACTIVE").toList();
    // _inActiveWallets = _allWallets.where((element) => element.status == "IN_PROGRESS").toList();
    _rejectedWallets =
        _allWallets.where((element) => element.status == "REJECTED").toList();
    notifyListeners();
    return _allWallets;
  }

  Future updateWalletStatus(BuildContext context) async {
    Map<String, dynamic> response = await UserService().updateWalletStatus(
        data: {"wallet_id": _currentSelectedUserId, "status": ""},
        context: context);
  }
  // Future<List<WalletResponse>> getDifferentWallet() async {
  //   Map<String, dynamic> responseData = await UserService().getDifferentWallet(status: "PENDING");
  //   final data = List.from(responseData['data']);
  //   _pendingWallets = List<WalletResponse>.from(data.map((x) => WalletResponse.fromJson(x)));
  //   notifyListeners();
  //   return _pendingWallets;
  // }
}
