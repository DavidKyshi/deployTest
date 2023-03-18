 import 'package:intl/intl.dart';

class Util {
  static formatAmount([dynamic amount = 0]) {
    var amountFormat = NumberFormat('##,##0.00', 'en_US');
    amount = amount ?? "0.00";
    final num value = amount.runtimeType == String
        ? amountFormat.parse(amount).toDouble()
        : amount;

    return amountFormat.format(value );
  }
}
