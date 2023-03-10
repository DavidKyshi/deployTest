import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/models/connectServices.dart';
import 'package:kyshi_operations_dashboard/models/users.dart';
import 'package:kyshi_operations_dashboard/models/wallet_management.dart';

import '../helper/internalDio.dart';
import '../models/transactions.dart';
import '../userService/userService.dart';

class UsersProvider extends ChangeNotifier {
 
  List<User> editUsers = [];
  List<User> _users = [];
  String? currentSelectedUserId;

  //String? currency = users.first.wallets!.first.currency;
  String? _currentUserName = "";
  String? _accessToken;

  List<Services> _connectService = [];
  List<WalletResponse> _allWallets = [];
  List<WalletResponse> _pendingWallets = [];
  List<WalletResponse> _activeWallets = [];
  List<WalletResponse> _rejectedWallets = [];
  List<TransactionsData> _transactions = [];

  // get wallet => _wallet;
  get accessToken => _accessToken;
  get users => _users;
  get connectService => _connectService;
  get transactions => _transactions;
  get currentUserName => _currentUserName;
  get allWallets => _allWallets;
  get activeWallets => _activeWallets;
  get rejectedWallets => _rejectedWallets;
  // get inActiveWallets => _inActiveWallets;
  get pendingWallets => _pendingWallets;

  void selectUser(String id) {
    currentSelectedUserId = id;
    notifyListeners();
  }

  User? getUserById([String? id]) {
    if (users.isEmpty) return null;
    if (id == null && currentSelectedUserId == null) return null;
    //notifyListeners();
    return users.firstWhere(
        (element) => element.id == (id ?? currentSelectedUserId),
        orElse: null);
  }

  void setCurrentUser(String name) {
    _currentUserName = name;
    notifyListeners();
  }

  void setAccessToken(String token) {
    _accessToken = token;
    notifyListeners();
  }

  Future<List<User>> getUsers(
      {required BuildContext context, required String entrySize}) async {
    print("GET USERS CALLED");
    Map<String, dynamic> responseData =
        await UserService().getAllUsers(context: context, entrySize: entrySize);
    // print("$responseData RAW DATA");
    final data = List.from(responseData['data']);
    _users = List<User>.from(data.map((x) => User.fromJson(x)));
    notifyListeners();
    return users;
  }

  Future<List<Services>> getConnectSerivices(BuildContext context) async {
    // 182e04da-a23b-4a73-8bd8-9bbabc19525d
    Map<String, dynamic> responseData = await UserService()
        .getKyshiConnectServices(
            userId: currentSelectedUserId ?? "", context: context);
    final data = List.from(responseData['data']);
    _connectService =
        List<Services>.from(data.map((x) => Services.fromJson(x)));
    notifyListeners();
    return _connectService;
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
            userId: currentSelectedUserId ?? "", context: context);
    final data = List.from(responseData['data']);
    _transactions = List<TransactionsData>.from(
        data.map((x) => TransactionsData.fromJson(x)));
    notifyListeners();
    return _transactions;
  }

  Future<List<Services>> getCards(BuildContext context) async {
    Map<String, dynamic> responseData = await UserService()
        .getKyshiConnectServices(
            userId: currentSelectedUserId ?? "", context: context);
    final data = List.from(responseData['data']);
    _connectService =
        List<Services>.from(data.map((x) => Services.fromJson(x)));
    notifyListeners();
    return _connectService;
  }

  Future<List<WalletResponse>> getAllWallets(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getWalletManagement(context: context);
    final data = List.from(responseData['data']);
    _allWallets =
        List<WalletResponse>.from(data.map((x) => WalletResponse.fromJson(x)));
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
        data: {"wallet_id": currentSelectedUserId, "status": ""},
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
