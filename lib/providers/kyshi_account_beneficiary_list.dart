import 'package:kyshi_operations_dashboard/models/user_beneficiary_list/user_beneficiary_list.dart';
import 'package:kyshi_operations_dashboard/userService/userService.dart';

import '../helper/screen_export.dart';

class KyshiBeneficiaryAccountProvider extends ChangeNotifier {
  List<UserBeneficiaryList> allUserBeneficiaryList =[];

  Future<List<UserBeneficiaryList>> getAllUserBeneficiaryList(
      BuildContext context) async {
    // 182e04da-a23b-4a73-8bd8-9bbabc19525d
    List<dynamic> responseData = await UserService()
        .getAccountBeneficiary(context: context);
    final data = List.from(responseData);
    print(data);
    allUserBeneficiaryList = List<UserBeneficiaryList>.from(
        data.map((x) => UserBeneficiaryList.fromMap(x)));
    notifyListeners();
    return allUserBeneficiaryList;
  }
}