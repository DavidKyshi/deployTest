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
import '../../helper/screen_export.dart';
import '../../styleguide/colors.dart';
import '../../widgets/date_filters.dart';

class WalletTab extends StatefulWidget {
  const WalletTab({Key? key}) : super(key: key);

  @override
  State<WalletTab> createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  String dropdownvalue = '100';
  var currency = ['100', '300', '500', '700', "1000"];
  bool isLoading = false;


  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 28),
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
                const SizedBox(),
                // Row(
                //   children: [
                //     Text(
                //       "Show entries",
                //       style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w500,
                //           fontFamily: "PushPenny",
                //           color: primaryColor),
                //     ),
                //     const SizedBox(width: 10,),
                //     Container(
                //       width: 70,
                //       height: 50,
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius:  BorderRadius.circular(8),
                //           border: Border.all(color: Colors.grey)
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                //         child: Center(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               DropdownButtonHideUnderline(
                //                 child: DropdownButton(
                //                   isExpanded: true,
                //                   borderRadius: BorderRadius.circular(10),
                //                   dropdownColor: Colors.white,
                //                   elevation: 1,
                //                   // Initial Value
                //                   value: dropdownvalue,
                //                   selectedItemBuilder: (BuildContext context) {
                //                     return currency.map((String items) {
                //                       return Center(
                //                           child: RichText(
                //                             text: TextSpan(
                //                               text: dropdownvalue,
                //                               style:  TextStyle(
                //                                   fontWeight: FontWeight.w400,
                //                                   fontSize: 15,
                //                                   color: primaryColor),
                //                             ),
                //                           )
                //                         //             Text(
                //                         //   dropdownvalue,
                //                         //   style: const TextStyle( fontWeight: FontWeight.w500,
                //                         //                 fontSize: 16,
                //                         //                 color: Color(0xff0D2C65) ),
                //                         // ),
                //                       );
                //                     }).toList();
                //                   },
                //                   // Down Arrow Icon
                //                   icon:  Icon(
                //                     Icons.keyboard_arrow_down,
                //                     color: primaryColor,
                //                   ),
                //
                //                   // Array list of items
                //                   items: currency.map((String items) {
                //                     return DropdownMenuItem(
                //                       value: items,
                //                       child: Container(
                //                         // width:double.infinity,
                //                         alignment: Alignment.centerLeft,
                //                         padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                //                         decoration: const BoxDecoration(
                //                             border: Border(
                //                                 bottom: BorderSide(
                //                                     color: Color(0xffDDDDDD), width: 0.3))),
                //                         child: Text(
                //                           items,
                //                           style: const TextStyle(
                //                               fontWeight: FontWeight.w400,
                //                               fontSize: 14,
                //                               color: Colors.black),
                //                         ),
                //                       ),
                //                     );
                //                   }).toList(),
                //                   // After selecting the desired option,it will
                //                   // change button value to selected value
                //                   onChanged: (String? newValue) {
                //                     setState(() {
                //                       dropdownvalue = newValue!;
                //                       isLoading = true;
                //                       Provider.of<UsersProvider>(context, listen: false).getAllWallets(context,dropdownvalue);
                //                     });
                //                     Future.delayed( Duration(seconds:double.tryParse(dropdownvalue)! > 500 ? 15 : 10)).then((value) {
                //                       setState(() {
                //                         isLoading = false;
                //                       });
                //                     }
                //                     );
                //                   },
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     )
                //
                //   ],
                // ),
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
                        text: 'Rejected Wallets',
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
