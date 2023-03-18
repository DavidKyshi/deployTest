import 'dart:convert';

import 'package:kyshi_operations_dashboard/models/transaction_summary_data/transaction_summary_user_data.dart';

import '../helper/screen_export.dart';
import '../userService/userService.dart';

class TransactionSummaryProvider extends ChangeNotifier {
  TransactionSummaryUserData allUsersTransactionSummary =
      TransactionSummaryUserData();

  Future<TransactionSummaryUserData> getAllTransactionSummary(
      BuildContext context, String userId) async {
    // 182e04da-a23b-4a73-8bd8-9bbabc19525d
    Map<String, dynamic> responseData = await UserService()
        .getTransactionSummary(userId: userId, context: context);
    final data = Map<String, dynamic>.from(responseData['data']);
    print(data);
    allUsersTransactionSummary = TransactionSummaryUserData.fromMap(data);
    notifyListeners();
    return allUsersTransactionSummary;
  }
}
