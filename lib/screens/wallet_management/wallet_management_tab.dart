import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/screens/payout_transaction/payout_failed_transaction.dart';
import 'package:kyshi_operations_dashboard/screens/payout_transaction/payout_pending_transaction.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/active_wallets.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/all_wallets.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/inActive_wallet.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/pending_wallets.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/rejected_wallets.dart';

import '../../customWidget/searchField.dart';
import '../../styleguide/colors.dart';
import '../../widgets/date_filters.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wallet Management',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontFamily: "PushPenny",
                      color: primaryColor),
                ),
                Row(
                  children: [
                    Text(
                      "Show entries",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: "PushPenny",
                          color: primaryColor),
                    ),
                    SizedBox()
                  ],
                ),
              ],
            ),
          ),
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
                        text: 'All Wallets',
                      ),
                      Tab(
                        text: 'Pending Wallets',
                      ),
                      Tab(
                        text: 'Reject Wallets',
                      ),
                      Tab(
                        text: 'Active Wallets',
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
                  child: const TabBarView(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      AllWallets(),
                      PendingWallets(),
                      RejectedWallets(),
                      ActiveWallets(),
                      // InActiveWallets()
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
