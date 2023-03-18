import '../helper/screen_export.dart';
import '../models/wallet_balance/wallet_balance.dart';
import '../userService/userService.dart';

class WalletBalanceProvider extends ChangeNotifier {
  List<WalletBalance> walletBalance = [];

  Future<List<WalletBalance>> getAllWalletBalanceResponse(
      BuildContext context) async {
    List<dynamic> responseData =
        await UserService().getWalletBalanceResponse(context: context);
    final data = List.from(responseData);
    print(data);
    walletBalance =
        List<WalletBalance>.from(data.map((x) => WalletBalance.fromMap(x)));
    notifyListeners();
    return walletBalance;
  }
}
