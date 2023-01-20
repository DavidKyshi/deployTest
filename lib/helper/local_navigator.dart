
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';



Navigator localNavigator() => Navigator(
  key: navigationController.navigationKey,
  initialRoute: UserAccountPageRoute,
  onGenerateRoute: genrateRoute,
);
