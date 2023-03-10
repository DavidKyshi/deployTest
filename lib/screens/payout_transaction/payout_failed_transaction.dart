// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../providers/payout_transactions.dart';
import '../../widgets/accept_offer_alertbox.dart';
import 'payout_all_transaction.dart';

class PayOutFailedTransactionTable extends StatefulWidget {
  PayOutFailedTransactionTable({super.key});

  @override
  State<PayOutFailedTransactionTable> createState() =>
      _PayOutFailedTransactionTableState();
}

class _PayOutFailedTransactionTableState
    extends State<PayOutFailedTransactionTable> {
  late ScrollController controller;
  PayOutTransactionProvider get payOutTransactionProvider =>
      Provider.of<PayOutTransactionProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final failedPayOutTransactionData =
        payOutTransactionProvider.failedPayOutTransactionData;
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
                child: failedPayOutTransactionData.isEmpty
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
                                .failedPayOutTransactionData
                                .map((failedPayOutTransactionData) => Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: 83,
                                                child: Text(convertDateTime(
                                                    failedPayOutTransactionData
                                                        .createdAt
                                                        .toString()))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                                width: 157,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                            .user ??
                                                        "")),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            SizedBox(
                                                width: 97,
                                                child: subText(
                                                    failedPayOutTransactionData
                                                            .ledgerOperation ??
                                                        "")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            SizedBox(
                                                width: 85,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                            .amount ??
                                                        "")),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            SizedBox(
                                                width: 45,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                            .processor ??
                                                        "")),

                                            SizedBox(
                                              width: 60,
                                            ),

                                            SizedBox(
                                                width: 74,
                                                child: subText(
                                                    failedPayOutTransactionData
                                                            .channel ??
                                                        "")),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                                width: 20,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                            .type ??
                                                        "")),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            SizedBox(
                                                width: 39,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                            .serviceCharge ??
                                                        "")),

                                            SizedBox(
                                              width: 50,
                                            ),

                                            SizedBox(
                                                width: 83,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                        .ledgerBalance
                                                        .toString())),

                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 83,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                        .availableBalance
                                                        .toString())),
                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 150,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                            .beneficiary ??
                                                        "")),
                                            SizedBox(
                                              width: 25,
                                            ),

                                            SizedBox(
                                                width: 40,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                            .offerId ??
                                                        "")),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                                width: 65,
                                                child: Text(
                                                    failedPayOutTransactionData
                                                            .id ??
                                                        "")),
                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 80,
                                                child: StatusText(
                                                    text:
                                                        failedPayOutTransactionData
                                                                .status ??
                                                            "")),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 80,
                                              child: PayOutTransactionButton(
                                                containerColor:
                                                    failedPayOutTransactionData
                                                                    .status ==
                                                                "SUCCESS" ||
                                                            failedPayOutTransactionData
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

Text titleText(String title) {
  return Text(
    title,
    style: TextStyle(
      color: primaryColor,
      fontFamily: 'PushPenny',
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
  );
}

Text subText(String sub) {
  return Text(
    sub,
    style: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff233375)),
  );
}
