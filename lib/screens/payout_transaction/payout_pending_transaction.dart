// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../providers/payout_transactions.dart';
import '../../widgets/accept_offer_alertbox.dart';
import 'payout_all_transaction.dart';
import 'payout_failed_transaction.dart';

class PayOutPendingTransactionTable extends StatefulWidget {
  PayOutPendingTransactionTable({super.key});

  @override
  State<PayOutPendingTransactionTable> createState() =>
      _PayOutPendingTransactionTableState();
}

class _PayOutPendingTransactionTableState
    extends State<PayOutPendingTransactionTable> {
  late ScrollController controller;
  PayOutTransactionProvider get payOutTransactionProvider =>
      Provider.of<PayOutTransactionProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final pendingPayOutTransactionData =
        payOutTransactionProvider.pendingPayOutTransactionData;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color(0XFFEAEBF1),
                  borderRadius: BorderRadius.circular(12)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: pendingPayOutTransactionData.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/book-search.png',
                            width: 66,
                            height: 67,
                          ),
                          Text(
                            'We currently don’t have any offer at \n the Kyshi marketplace,  it will appear \n here when we do',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontFamily: "PushPenny",
                                color: primaryColor),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 190,
                                  child: Row(
                                    children: [
                                      titleText('Created'),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      titleText('User'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      titleText('Operation'),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      titleText('Amount'),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      titleText('Processor'),
                                    ],
                                  ),
                                ),
                                // SizedBox(width: 30,),
                                SizedBox(
                                  width: 230,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      titleText('Channel'),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      titleText('Type'),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      titleText('Charges'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 210,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      titleText('Ledger'),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      titleText('Available'),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  width: 450,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      titleText('Beneficiary'),
                                      SizedBox(
                                        width: 88,
                                      ),
                                      titleText('Offer'),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      titleText('ID'),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      titleText('Status'),
                                      SizedBox(
                                        width: 38,
                                      ),
                                      titleText('Action'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(850, 0, 0, 20),
                              child: Text(
                                'Wallet Balance',
                                style: TextStyle(
                                    color: primaryColor.withOpacity(0.5),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ...payOutTransactionProvider
                                .pendingPayOutTransactionData
                                .map((pendingPayOutTransactionData) => Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: 83,
                                                child: Text(convertDateTime(
                                                    pendingPayOutTransactionData
                                                        .createdAt
                                                        .toString()))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                                width: 157,
                                                child: Text(
                                                    pendingPayOutTransactionData
                                                            .user ??
                                                        "")),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            SizedBox(
                                                width: 97,
                                                child: subText(
                                                    pendingPayOutTransactionData
                                                            .ledgerOperation ??
                                                        "")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            SizedBox(
                                                width: 85,
                                                child: Text(
                                                    pendingPayOutTransactionData
                                                            .amount ??
                                                        "")),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            SizedBox(
                                                width: 45,
                                                child: Text(
                                                    pendingPayOutTransactionData
                                                            .processor ??
                                                        "")),

                                            SizedBox(
                                              width: 60,
                                            ),

                                            SizedBox(
                                                width: 74,
                                                child: subText(
                                                    pendingPayOutTransactionData
                                                            .channel ??
                                                        "")),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                                width: 20,
                                                child: Text(
                                                    pendingPayOutTransactionData
                                                            .type ??
                                                        "")),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            SizedBox(
                                                width: 39,
                                                child: Text(
                                                    pendingPayOutTransactionData
                                                            .serviceCharge ??
                                                        "")),

                                            SizedBox(
                                              width: 50,
                                            ),

                                            SizedBox(
                                                width: 83,
                                                child: Text(
                                                    pendingPayOutTransactionData
                                                        .ledgerBalance
                                                        .toString())),

                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 83,
                                                child: Text(
                                                    pendingPayOutTransactionData
                                                        .availableBalance
                                                        .toString())),
                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 150,
                                                child: Text(
                                                    pendingPayOutTransactionData
                                                            .beneficiary ??
                                                        "")),
                                            SizedBox(
                                              width: 25,
                                            ),

                                            SizedBox(
                                                width: 40, child: Text("")),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                                width: 65, child: Text("")),
                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 80,
                                                child: StatusText(
                                                    text:
                                                        pendingPayOutTransactionData
                                                                .status ??
                                                            "")),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 80,
                                              child: PayOutTransactionButton(
                                                containerColor:
                                                    pendingPayOutTransactionData
                                                                    .status ==
                                                                "SUCCESS" ||
                                                            pendingPayOutTransactionData
                                                                    .status ==
                                                                "REVERSED"
                                                        ? Color(0xff6E80A3)
                                                        : primaryColor,
                                                text: "RETRY",
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ))
                                .toList()
                          ],
                        ),
                      ),
              )),
        ),
      ),
    );
  }
}
