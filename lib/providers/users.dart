import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kyshi_operations_dashboard/models/connectServices.dart';
import 'package:kyshi_operations_dashboard/models/users.dart';
import 'package:kyshi_operations_dashboard/models/wallet_management.dart';

import '../models/transactions.dart';
import '../userService/userService.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  String? currentSelectedUserId;
  // List <Wallet>? _wallet;
  List<Services> _connectService = [];
  List<WalletResponse> _allWallets = [];
  List<WalletResponse> _pendingWallets = [];
  List<TransactionsData> _transactions = [];


  // get wallet => _wallet;
  get connectService => _connectService;
  get transactions => _transactions;
  get allWallets => _allWallets;
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

  Future<List<User>> getUsers() async {
    Map<String, dynamic> responseData = await UserService().getAllUsers();
    // print("$responseData RAW DATA");
    final data = List.from(responseData['data']);
    users = List<User>.from(data.map((x) => User.fromJson(x)));
    notifyListeners();
    return users;
  }
  Future<List<Services>> getConnectSerivices() async {
    // 182e04da-a23b-4a73-8bd8-9bbabc19525d
    Map<String, dynamic> responseData = await UserService().getKyshiConnectServices(userId:currentSelectedUserId ?? "");
    final data = List.from(responseData['data']);
    _connectService = List<Services>.from(data.map((x) => Services.fromJson(x)));
    notifyListeners();
    return _connectService;
  }
  Future<List<TransactionsData>> getTransactions() async {
    Map<String, dynamic> responseData = await UserService().getKyshiConnectTransactions(userId: currentSelectedUserId ?? "");
    final data = List.from(responseData['data']);
    _transactions = List<TransactionsData>.from(data.map((x) => TransactionsData.fromJson(x)));
    notifyListeners();
    return _transactions;
  }
  Future<List<Services>> getCards() async {
    Map<String, dynamic> responseData = await UserService().getKyshiConnectServices(userId:currentSelectedUserId ?? "");
    final data = List.from(responseData['data']);
    _connectService = List<Services>.from(data.map((x) => Services.fromJson(x)));
    notifyListeners();
    return _connectService;
  }
  Future<List<WalletResponse>> getAllWallets() async {
    Map<String, dynamic> responseData = await UserService().getWalletManagement();
    final data = List.from(responseData['data']);
    _allWallets = List<WalletResponse>.from(data.map((x) => WalletResponse.fromJson(x)));
    notifyListeners();
    return _allWallets;
  }
  Future<List<WalletResponse>> getDifferentWallet() async {
    Map<String, dynamic> responseData = await UserService().getDifferentWallet(status: "PENDING");
    final data = List.from(responseData['data']);
    _pendingWallets = List<WalletResponse>.from(data.map((x) => WalletResponse.fromJson(x)));
    notifyListeners();
    return _pendingWallets;
  }
}
