import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kyshi_operations_dashboard/models/users.dart';

import '../userService/userService.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  String? currentSelectedUserId;

  void selectUser(String id) {
    currentSelectedUserId = id;
    notifyListeners();
  }

  User? getUserById([String? id]) {
    if (users.isEmpty) return null;
    if (id == null && currentSelectedUserId == null) return null;
    // notifyListeners();
    return users.firstWhere(
        (element) => element.id == (id ?? currentSelectedUserId),
        orElse: null);
        

  }

  Future<List<User>> getUsers() async {
    Map<String, dynamic> responseData = await UserService().getAllUsers();
    final data = List.from(responseData['data']);
    users = List<User>.from(data.map((x) => User.fromJson(x)));
    // print("${user.data![0].lastName} GETTING FIRSTNAME reading");
    // _users = user;
    notifyListeners();
    return users;
  }
}
