import 'package:intl/intl.dart';

String convertDay(String dateTimeStr) {
  // Parse the date-time string
  DateTime dateTime = DateTime.parse(dateTimeStr);
  // Create a DateFormat object with the desired format
  DateFormat dateFormat = DateFormat('EEEE');
  // Convert the DateTime object to a formatted string
  String formattedDateTime = dateFormat.format(dateTime);
  return formattedDateTime;
}