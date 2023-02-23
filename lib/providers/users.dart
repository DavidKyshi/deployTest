import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kyshi_operations_dashboard/models/connectServices.dart';
import 'package:kyshi_operations_dashboard/models/users.dart';

import '../models/transactions.dart';
import '../userService/userService.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  String? currentSelectedUserId;
  List <Wallet>? _wallet;
  List<Services> _connectService = [];
  List<TransactionsData> _transactions = [];


  get wallet => _wallet;
  get connectService => _connectService;
  get transactions => _transactions;

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
    final data = List.from(responseData['data']);
    users = List<User>.from(data.map((x) => User.fromJson(x)));
    _wallet = List<Wallet>.from(data.map((e) => Wallet.fromJson(e)));
    // print("${user.data![0].lastName} GETTING FIRSTNAME reading");
    // _users = user;
    notifyListeners();
    return users;
  }
  Future<List<Services>> getConnectSerivices() async {
    // 182e04da-a23b-4a73-8bd8-9bbabc19525d
    Map<String, dynamic> responseData = await UserService().getKyshiConnectServices(userId:currentSelectedUserId ?? "");
    final data = List.from(responseData['data']);
    // print("${data} all cbckbckhb ch");
    _connectService = List<Services>.from(data.map((x) => Services.fromJson(x)));
    // print(" GETTING FIRSTNAME reading");
    // _users = user;
    notifyListeners();
    return _connectService;
  }
  Future<List<TransactionsData>> getTransactions() async {
    Map<String, dynamic> responseData = await UserService().getKyshiConnectTransactions();
    final data = List.from(responseData['data']);
    print("${data} allTRANSACTIONS");
    _transactions = List<TransactionsData>.from(data.map((x) => TransactionsData.fromJson(x)));
    print(" GETTING FIRSTNAME reading");
    // _users = user;
    notifyListeners();
    return _transactions;
  }
  Future<List<Services>> getCards() async {
    Map<String, dynamic> responseData = await UserService().getKyshiConnectServices(userId:currentSelectedUserId ?? "");
    final data = List.from(responseData['data']);
    // print("${data} all cbckbckhb ch");
    _connectService = List<Services>.from(data.map((x) => Services.fromJson(x)));
    // print(" GETTING FIRSTNAME reading");
    // _users = user;
    notifyListeners();
    return _connectService;
  }
}
