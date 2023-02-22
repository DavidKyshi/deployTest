// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import 'payout_transacttion_tab.dart';

class PayOutTransactionScreen extends StatelessWidget {
  const PayOutTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transactions',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                fontFamily: "PushPenny",
                color: primaryColor),
          ),
          PayOutTransactionTab(),
        ],
      )),
    );
  }
}
