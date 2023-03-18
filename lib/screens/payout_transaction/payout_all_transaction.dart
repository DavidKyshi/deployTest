// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:intl/intl.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../providers/payout_transactions.dart';
import '../../widgets/accept_offer_alertbox.dart';
import '../offers_management/all_offer.dart';
import 'payout_failed_transaction.dart';

class PayOutAllTransactionTable extends StatefulWidget {
  PayOutAllTransactionTable({super.key});

  @override
  State<PayOutAllTransactionTable> createState() =>
      _PayOutAllTransactionTableState();
}

class _PayOutAllTransactionTableState extends State<PayOutAllTransactionTable> {
  late ScrollController controller;

  PayOutTransactionProvider get payOutTransactionProvider =>
      Provider.of<PayOutTransactionProvider>(context, listen: false);
    Color _colorContainer = primaryColor;

  @override
  Widget build(BuildContext context) {
    final allPayOutTransactionData =
        payOutTransactionProvider.allPayOutTransactionData;
    var f = NumberFormat("###.0#", "en_US");
  
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
                child: allPayOutTransactionData.isEmpty
                    ? Center(
                        child: Column(
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
                        ),
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
                                .allPayOutTransactionData
                                .map((allPayOutTransactionData) => Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: 83,
                                                child: Text(convertDateTime(
                                                    allPayOutTransactionData
                                                        .createdAt
                                                        .toString()))),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                                width: 157,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    subText(
                                                        allPayOutTransactionData
                                                                .user ?? 
                                                            ""),
                                                            Text(
                                                        allPayOutTransactionData
                                                                .email ?? 
                                                            ""),
                                                  ],
                                                )),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            SizedBox(
                                                width: 97,
                                                child: subText(
                                                    allPayOutTransactionData
                                                            .ledgerOperation ??
                                                        "")),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            SizedBox(
                                                width: 85,
                                                child: Text(
                                                    allPayOutTransactionData
                                                            .amount ??
                                                        "")),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            SizedBox(
                                                width: 80,
                                                child: Text(
                                                    allPayOutTransactionData
                                                            .processor ??
                                                        "")),

                                            // SizedBox(
                                            //   width: 50,
                                            // ),

                                            SizedBox(
                                                width: 110,
                                                child: subText(
                                                    allPayOutTransactionData
                                                            .channel ??
                                                        "")),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                                width: 20,
                                                child: Text(
                                                    allPayOutTransactionData
                                                            .type ??
                                                        "")),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            SizedBox(
                                                width: 39,
                                                child: Text(
                                                    allPayOutTransactionData
                                                            .serviceCharge ??
                                                        "")),

                                            SizedBox(
                                              width: 50,
                                            ),

                                            SizedBox(
                                                width: 83,
                                                child: Text(
                                                    allPayOutTransactionData
                                                        .ledgerBalance
                                                        .toString())),

                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 83,
                                                child: Text(
                                                    allPayOutTransactionData
                                                        .availableBalance
                                                        .toString())),
                                            //  allPayOutTransactionData                                                  allPayOutTransactionData
                                            //   .availableBalance
                                            //   .toString()
// )),
                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 150,
                                                child: Text(
                                                    allPayOutTransactionData
                                                            .beneficiary ??
                                                        "")),
                                            SizedBox(
                                              width: 25,
                                            ),

                                            SizedBox(
                                                width: 40,
                                                child: Text(
                                                    allPayOutTransactionData
                                                            .offerId ??
                                                        "")),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                                width: 65,
                                                child: Text(
                                                    allPayOutTransactionData
                                                            .id ??
                                                        "")),
                                            SizedBox(
                                              width: 20,
                                            ),

                                            SizedBox(
                                                width: 80,
                                                child: StatusText(
                                                    text:
                                                        allPayOutTransactionData
                                                                .status ??
                                                            "")),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 80,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                  _colorContainer = _colorContainer == Color(0xff6E80A3) ? 
                    primaryColor : 
                    Color(0xff6E80A3);
                                                  });
                                                },
                                                child: PayOutTransactionButton(
                                                  containerColor:
                                                      allPayOutTransactionData
                                                                      .status ==
                                                                  "SUCCESS" ||
                                                              allPayOutTransactionData
                                                                      .status ==
                                                                  "REVERSED"
                                                          ? Color(0xff6E80A3)
                                                          : _colorContainer,
                                                  text: "RETRY",
                                                ),
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

class StatusText extends StatelessWidget {
  StatusText({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          fontFamily: "PushPenny",
          color: text == "SUCCESS"
              ? Color(0xff23CE6B)
              : text == "PENDING"
                  ? Color(0xffFBCD58)
                  : text == "REVERSED"
                      ? Color(0xff6D48FF)
                      : Color(0xffFF5C5C)),
    );
  }
}

class PayOutTransactionButton extends StatelessWidget {
  PayOutTransactionButton(
      {super.key,
      // required this.isBorder,
      required this.text,
      required this.containerColor});

  // bool isBorder;
  String text;
  final Color containerColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73,
      height: 24,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
