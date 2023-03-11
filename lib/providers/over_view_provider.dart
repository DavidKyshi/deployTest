import 'package:kyshi_operations_dashboard/models/express_chart.dart';

import '../helper/screen_export.dart';
import '../userService/userService.dart';

class OverViewProvider extends ChangeNotifier {
  List<ExpressChart> expressChart = [];

  Future<List<ExpressChart>> getAllExpressChart(
      {required BuildContext context}) async {
    Map<String, dynamic> responseData =
        await UserService().getExpressChart(context: context);
    // print("$responseData RAW DATA");
    final data = List.from(responseData['data']);
    expressChart =
        List<ExpressChart>.from(data.map((x) => ExpressChart.fromJson(x)));
    notifyListeners();
    return expressChart;
  }
}
