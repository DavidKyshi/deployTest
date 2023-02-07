
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/offers_management.dart';
import 'package:kyshi_operations_dashboard/screens/page_not_found/page_not_found.dart';


Route<dynamic> genrateRoute(RouteSettings settings){
  switch (settings.name) {
    case UserAccountPageRoute:
        return _getPageRoute(UserAccountScreen());
      case OfferManagementPageRoute:
       return _getPageRoute(OffersManagementScreen());
      
        //  case AuthenticationPageRoute:
        //  return _customImage(userAccountIcon, itemName);
      default: 
        return _getPageRoute(UserAccountTab());
  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context)=>child);
}