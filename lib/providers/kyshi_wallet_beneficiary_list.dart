import 'package:kyshi_operations_dashboard/models/kyshi_user_wallet/kyshi_user_wallet_data.dart';

import '../helper/screen_export.dart';
import '../userService/userService.dart';

class KyshiBeneficiaryWalletProvider extends ChangeNotifier {
  List<KyshiUserWalletData> allKyshiUserWalletData = [];

  Future<List<KyshiUserWalletData>> getAllKyshiUserWalletData() async {
    Map<String, dynamic> responseData = await UserService().getAllKyshiWallet();
    final data = List.from(responseData['data']);
    print(data);
    allKyshiUserWalletData = List<KyshiUserWalletData>.from(
        data.map((x) => KyshiUserWalletData.fromMap(x)));
    notifyListeners();
    return allKyshiUserWalletData;
  }
}
