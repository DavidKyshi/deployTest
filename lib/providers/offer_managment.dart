import '../helper/screen_export.dart';
import '../models/offer_management_api_response/offer_data.dart';
import '../userService/userService.dart';

class OfferManagementProvider extends ChangeNotifier {
  List<OfferData> offerData = [];
  String? currentSelectedofferManagementId;

  void selectOffer(String id) {
    currentSelectedofferManagementId = id;
     notifyListeners();
  }

  OfferData? getAllOfferManagementById([String? id]) {
    if (offerData.isEmpty) return null;
    if (id == null && currentSelectedofferManagementId == null) return null;
     notifyListeners();
    return offerData.firstWhere(
        (element) => element.id == (id ?? currentSelectedofferManagementId),
        orElse: null);
  }

  Future<List<OfferData>> getAllOfferManagement(BuildContext context) async {
    Map<String, dynamic> responseData = await UserService().getOfferManagement(context);
    final data = List.from(responseData['data']);
    offerData = List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return offerData;
  }

}
