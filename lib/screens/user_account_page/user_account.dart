// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/user_account_index.dart';

class _FilterRanger {
  final String title;
  final int daysAgo;

  const _FilterRanger(this.title, this.daysAgo);
}

const List<_FilterRanger> lastDays = [
  _FilterRanger('Today', 0),
  _FilterRanger('Yesterday', 1),
  _FilterRanger('Last 7 days', 6),
  _FilterRanger('Last 30 days', 29),
  _FilterRanger('Last 1826 days', 1825),
];

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});
  static const String route = "UserAccountScreen";

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  _FilterRanger dropdownvalue = lastDays[2];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

          //color: Colors.amber,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         
          Container(
              //  width: 500,
              height: MediaQuery.of(context).size.height,
              child: UserAccountIndex())
        ],
      )
          
          
    );
  }
}
