// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/screens/user_account_page/identification_summary.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/kyshi_card.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/kyshi_connect_services.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/transaction_summary.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/transactions.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/wallet/wallet_beneficiaries.dart';

import '../../helper/screen_export.dart';

import '../../styleguide/colors.dart';
import 'accept_offer.dart';
import 'create_offer.dart';

class UserAccountTab extends StatelessWidget {
  const UserAccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // width: 500,
        // height: 800,
        //  color: Colors.amber,
        child: DefaultTabController(
          length: 9,
          initialIndex: 0,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "User Accounts",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'PushPenny',
                        color: primaryColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: primaryColor,
                    size: 14,
                  ),
                  Text(
                    "Account Profile",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'PushPenny',
                        color: kyshiGreyishBlue),
                  ),
                ],
              ),
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
                      text: 'Account & KYC',
                    ),
                    Tab(
                      text: 'Wallet & Beneficiaries',
                    ),
                    Tab(
                      text: 'Created offers',
                    ),
                    Tab(
                      text: 'Accepted offers',
                    ),
                    Tab(
                      text: 'Kyshi Connect Services',
                    ),
                    Tab(
                      text: 'Kyshi Card',
                    ),
                    Tab(
                      text: 'Transactions',
                    ),
                    Tab(
                      text: 'Transaction Summary',
                    ),
                    Tab(
                      text: 'Identification Summary',
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height /
                    1.1, //height of TabBarView
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: TabBarView(
                  children: [
                    AccountKYC(),
                    WalletAndBeneficiaries(),
                    CreateOfferTable(),
                    AcceptOfferTable(),
                    KyshiConnectServices(),
                    KyshiCard(),
                    TransactionHistory(),
                    TransactionSummaryBoard(),
                    IdentificationSummary(),
                  ],
                ),
              ),

              //       Container(
              //          width: 1179.83,
              // height:  97.55,
              // color: Color(0xffF9F9F9),
              //         child: Row(
              //           children: [
              //             LastDaysFilter(),
              //           ],
              //         ))
            ],
          ),
        ),
      ),
    );
  }
}
