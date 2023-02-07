
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/first_time_login.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/forgot_password.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/offers_management.dart';
import 'package:kyshi_operations_dashboard/screens/page_not_found/page_not_found.dart';

import '../screens/authentication/welcome_back.dart';


Route<dynamic> genrateRoute(RouteSettings settings){
  switch (settings.name) {
    case UserAccountPageRoute:
        return _getPageRoute( ForgetPassword());
      case OfferManagementPageRoute:
       return _getPageRoute(OffersManagementScreen());
    case welcomeBackPage:
      return _getPageRoute(FirstTimer());
        // case AuthenticationPageRoute:
        // return _customImage(userAccountIcon, itemName);
      default: 
        return _getPageRoute(PageNotFoundScreen());
  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context)=>child);
}