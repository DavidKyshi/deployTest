import '../helper/screen_export.dart';
import '../models/offer_management_api_response/offer_data.dart';
import '../userService/userService.dart';

class OfferManagementProvider extends ChangeNotifier {
  List<OfferData> offerData = [];
  List<OfferData> openOfferData = [];
  List<OfferData> closedOfferData = [];
  List<OfferData> withdrawOfferData = [];
  List<OfferData> acceptedOfferData = [];
  List<User> users = [];
  String? currentSelectedUserId;

  

  Future<List<OfferData>> getAllOfferManagement() async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("all");
    final data = List.from(responseData['data']);
    offerData = List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return offerData;
  }

  Future<List<OfferData>> getOpenOfferManagement() async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("open");
    final data = List.from(responseData['data']);
    openOfferData = List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return openOfferData;
  }

  Future<List<OfferData>> getCloseOfferManagement() async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("closed");
    final data = List.from(responseData['data']);
    closedOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return closedOfferData;
  }

  Future<List<OfferData>> getWithdrawnOfferManagement() async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("withdrawn");
    final data = List.from(responseData['data']);
    withdrawOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return withdrawOfferData;
  }

  Future<List<OfferData>> getAcceptedOfferManagement() async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("accepted");
    final data = List.from(responseData['data']);
    acceptedOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return acceptedOfferData;
  }
   
  Future<List<OfferData>?> getCreatedUserAccount() async {
    //  if (users.isEmpty) return null;
    // if (id == null && currentSelectedUserId == null) return null;
    // //notifyListeners();
    // // return users.firstWhere(
    // //     (element) => element.id == (id ?? currentSelectedUserId),
    // //     orElse: null);
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("created_offer");
    final data = List.from(responseData['data']);
    acceptedOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return acceptedOfferData;
  }

}
