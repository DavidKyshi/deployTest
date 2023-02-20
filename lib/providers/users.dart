import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kyshi_operations_dashboard/models/users.dart';

import '../userService/userService.dart';

class UsersProvider extends ChangeNotifier{
   Users? _users;

  get users => _users;

   Future<Users> getUsers () async{
     Response response =await UserService().getAllUsers();
     Users user =Users.fromJson(response.data);
     // print("${user.data![0].lastName} GETTING FIRSTNAME reading");
    _users = user;
   notifyListeners();
   return user;
  }

}