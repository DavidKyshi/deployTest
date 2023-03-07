import 'dart:js';

import '../helper/screen_export.dart';
import '../models/pay_out_transaction/pay_out_transaction_data.dart';
import '../userService/userService.dart';

class PayOutTransactionProvider extends ChangeNotifier {
  List<PayOutTransactionUserData> allPayOutTransactionData= [];
  List<PayOutTransactionUserData> pendingPayOutTransactionData= [];
  List<PayOutTransactionUserData> failedPayOutTransactionData= [];
  List<PayOutTransactionUserData> completedPayOutTransactionData= [];
  List<PayOutTransactionUserData> reversedPayOutTransactionData= [];

  Future<List<PayOutTransactionUserData>> getAllPayOutTransactions(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getPayoutTransactions("all", context);
    final data = List.from(responseData['data']);
    allPayOutTransactionData = List<PayOutTransactionUserData>.from(data.map((x) => PayOutTransactionUserData.fromMap(x)));
    notifyListeners();
    return allPayOutTransactionData;
  }

  Future<List<PayOutTransactionUserData>> getPendingPayOutTransactions(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getPayoutTransactions("pending", context);
    final data = List.from(responseData['data']);
    pendingPayOutTransactionData = List<PayOutTransactionUserData>.from(data.map((x) => PayOutTransactionUserData.fromMap(x)));
    notifyListeners();
    return pendingPayOutTransactionData;
  }

  Future<List<PayOutTransactionUserData>> getFailedPayOutTransactions(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getPayoutTransactions("failed", context);
    final data = List.from(responseData['data']);
    failedPayOutTransactionData = List<PayOutTransactionUserData>.from(data.map((x) => PayOutTransactionUserData.fromMap(x)));
    notifyListeners();
    return failedPayOutTransactionData;
  }

  Future<List<PayOutTransactionUserData>> getCompletedPayOutTransactions(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getPayoutTransactions("completed", context);
    final data = List.from(responseData['data']);
    completedPayOutTransactionData = List<PayOutTransactionUserData>.from(data.map((x) => PayOutTransactionUserData.fromMap(x)));
    notifyListeners();
    return completedPayOutTransactionData;
  }

  Future<List<PayOutTransactionUserData>> getReversedPayOutTransactions(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getPayoutTransactions("reversed",context);
    final data = List.from(responseData['data']);
    reversedPayOutTransactionData = List<PayOutTransactionUserData>.from(data.map((x) => PayOutTransactionUserData.fromMap(x)));
    notifyListeners();
    return reversedPayOutTransactionData;
  }
}