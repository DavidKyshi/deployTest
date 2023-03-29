import 'dart:js';

import '../helper/screen_export.dart';
import '../models/offer_management_api_response/offer_data.dart';
import '../userService/userService.dart';

class OfferManagementProvider extends ChangeNotifier {
  List<OfferData> offerData = [];
  List<OfferData> openOfferData = [];
  List<OfferData> closedOfferData = [];
  List<OfferData> withdrawOfferData = [];
  List<OfferData> acceptedOfferData = [];
  List<OfferData> acceptedUserOfferData = [];
  List<OfferData> createdOfferData = [];
  // final user = UsersProvider().getUserById();
  // String? currentSelectedUserId;

  Future<List<OfferData>> getAllOfferManagement(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("all", context: context);
    final data = List.from(responseData['data']);
    offerData = List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return offerData;
  }

  Future<List<OfferData>> getOpenOfferManagement(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("open", context: context);
    final data = List.from(responseData['data']);
    openOfferData = List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return openOfferData;
  }

  Future<List<OfferData>> getCloseOfferManagement(BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("closed", context: context);
    final data = List.from(responseData['data']);
    closedOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return closedOfferData;
  }

  Future<List<OfferData>> getWithdrawnOfferManagement(
      BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("withdrawn", context: context);
    final data = List.from(responseData['data']);
    withdrawOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return withdrawOfferData;
  }

  Future<List<OfferData>> getAcceptedOfferManagement(
      BuildContext context) async {
    Map<String, dynamic> responseData =
        await UserService().getOfferManagement("accepted", context: context);
    final data = List.from(responseData['data']);
    acceptedOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return acceptedOfferData;
  }

  Future<List<OfferData>?> getCreatedOffer(
      BuildContext context, String userId) async {
    Map<String, dynamic> responseData = await UserService()
        .getOfferManagement("created_offer", context: context, userId: userId);
    final data = List.from(responseData['data']);
    createdOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return createdOfferData;
  }

  Future<List<OfferData>?> getAcceptedUserOffer(
      BuildContext context, String userId) async {
    Map<String, dynamic> responseData = await UserService().getOfferManagement(
        "accepted_user_offer",
        context: context,
        userId: userId);
    final data = List.from(responseData['data']);
    acceptedUserOfferData =
        List<OfferData>.from(data.map((x) => OfferData.fromMap(x)));
    notifyListeners();
    return acceptedUserOfferData;
  }
}
