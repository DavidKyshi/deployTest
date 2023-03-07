import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/screens/payout_transaction/payout_failed_transaction.dart';
import 'package:kyshi_operations_dashboard/screens/payout_transaction/payout_pending_transaction.dart';

import '../../customWidget/searchField.dart';
import '../../widgets/date_filters.dart';
import 'payout_all_transaction.dart';
import 'payout_completed_transaction.dart';
import 'payout_reversed_transaction.dart';

class PayOutTransactionTab extends StatelessWidget {
  const PayOutTransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const TabBar(
                    isScrollable: true,
                    labelColor: Color(0xff233375),
                    labelStyle: TextStyle(
                      fontFamily: "PushPenny",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontFamily: "PushPenny",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    unselectedLabelColor: Color(0xff233375),
                    indicatorColor: Colors.black,
                    indicatorWeight: 1.5,
                    tabs: [
                      Tab(
                        text: 'All transactions',
                      ),
                      Tab(
                        text: 'Pending Transactions',
                      ),
                      Tab(
                        text: 'Failed Transactions',
                      ),
                      Tab(
                        text: 'Completed Transaction',
                      ),
                      Tab(
                        text: 'Reversed Transaction',
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: MediaQuery.of(context).size.height/1.1, //height of TabBarView
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SearchField(),
                Container(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: TabBarView(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      PayOutAllTransactionTable(),
                      PayOutPendingTransactionTable(),
                      PayOutFailedTransactionTable(),
                      PayOutCompletedTransactionTable(),
                      PayOutReversedTransactionTable()
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
