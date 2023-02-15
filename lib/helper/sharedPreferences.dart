// import 'package:shared_preferences/shared_preferences.dart';
//
//
// //Use constant as your key
//
// //SET SHARED PREFERENCE KEY-VALUE PAIRS
// Future addStringToSF(String key, String value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString(key, value);
// }
//
// addIntToSF(String key, int value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setInt(key, value);
// }
//
// addDoubleToSF(String key, double value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setDouble(key, value);
// }
//
// Future<void> reloadSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.reload();
// }
//
// addBoolToSF(String key, bool value) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool(key, value);
// }
//
// //SET SHARED PREFERENCE VALUES
// getStringValuesSF(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return String
//   String? stringValue = prefs.getString(key);
//   return stringValue;
// }
//
// Future<bool> getBoolValuesSF(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return bool
//   bool boolValue = prefs.getBool(key) ?? false;
//   return boolValue;
// }
//
// getIntValuesSF(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return int
//   int? intValue = prefs.getInt(key);
//   return intValue;
// }
//
// getDoubleValuesSF(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return double
//   double? doubleValue = prefs.getDouble(key);
//   return doubleValue;
// }
//
// removeValues(String key) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Remove Value
//   prefs.remove(key);
// }
//
//
