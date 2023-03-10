// ignore_for_file: prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

class ProfiePictureAvater extends StatelessWidget {
  const ProfiePictureAvater({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.3, color: Colors.black),
        image: DecorationImage(
            image: AssetImage(profilePicture), fit: BoxFit.fill),
      ),
    );
  }
}

class TotalTransactionRow extends StatefulWidget {
  const TotalTransactionRow({super.key});

  @override
  State<TotalTransactionRow> createState() => _TotalTransactionRowState();
}

class _TotalTransactionRowState extends State<TotalTransactionRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.79,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/transactionTotalIcon.png',
                  width: 65,
                  height: 65,
                ),
                SizedBox(
                  width: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: '0',
                        style: TextStyle(
                            color: Color(0xff233375),
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                        children: [
                      TextSpan(
                          text: '/0',
                          style: TextStyle(
                              color: Color(0xff6F6F6F),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: "PushPenny"))
                    ])),
              ],
            ),
            Text(
              'Total transactions',
              style: TextStyle(
                  color: Color(0xff233375),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "PushPenny"),
            )
          ],
        ),
      ),
    );
  }
}

class TransactionBoardChat extends StatefulWidget {
  TransactionBoardChat(
      {super.key,
      required this.successfulTopUpTransaction,
      required this.successfulWithdrawlTransaction,
      required this.successfulExpressTransaction,
      required this.successfulSwapTransaction,
      required this.successfulConnectTransaction,
      required this.successfulCardTransaction,
      required this.failedTopUpTransaction,
      required this.failedWithdrawlTransaction,
      required this.failedExpressTransaction,
      required this.failedSwapTransaction,
      required this.failedConnectTransaction,
      required this.failedCardTransaction});
  final String successfulTopUpTransaction,
      successfulWithdrawlTransaction,
      successfulExpressTransaction,
      successfulSwapTransaction,
      successfulConnectTransaction,
      successfulCardTransaction,
      failedTopUpTransaction,
      failedWithdrawlTransaction,
      failedExpressTransaction,
      failedSwapTransaction,
      failedConnectTransaction,
      failedCardTransaction;
  @override
  State<TransactionBoardChat> createState() => _TransactionBoardChatState();
}

class _TransactionBoardChatState extends State<TransactionBoardChat> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 495.67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromRGBO(119, 119, 119, 0.2)),
      ),
      child: Column(
        children: [
          _selectedIndex == 0
              ? SucessfullTransaction(
                  successfulCardTransaction: widget.successfulCardTransaction,
                  successfulConnectTransaction:
                      widget.successfulConnectTransaction,
                  successfulExpressTransaction:
                      widget.successfulExpressTransaction,
                  successfulSwapTransaction: widget.successfulSwapTransaction,
                  successfulTopUpTransaction: widget.successfulTopUpTransaction,
                  successfulWithdrawlTransaction:
                      widget.successfulWithdrawlTransaction,
                )
              : FailedTransaction(
                  failedCardTransaction: widget.failedCardTransaction,
                  failedConnectTransaction: widget.failedConnectTransaction,
                  failedExpressTransaction: widget.failedExpressTransaction,
                  failedSwapTransaction: widget.failedSwapTransaction,
                  failedTopUpTransaction: widget.failedTopUpTransaction,
                  failedWithdrawlTransaction: widget.failedWithdrawlTransaction,
                ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Radio(
                  activeColor: primaryColor,
                  value: 0,
                  groupValue: _selectedIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedIndex = value!;
                    });
                  },
                ),
                Text(
                  "Successful Transaction",
                  style: TextStyle(
                      color: Color(0xff0A0A0A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "PushPenny"),
                ),

                Radio(
                  activeColor: primaryColor,
                  value: 1,
                  groupValue: _selectedIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedIndex = value!;
                    });
                  },
                ),
                Text(
                  "Failed Transaction",
                  style: TextStyle(
                      color: Color(0xff0A0A0A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "PushPenny"),
                ),

                // TransactionStatus(
                //   color: Color(0xff233375),
                //   text: 'Successful Transaction',
                // ),
                // TransactionStatus(
                //   color: Color(0xffD9D9D9),
                //   text: 'Failed Transaction',
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SucessfullTransaction extends StatelessWidget {
  SucessfullTransaction(
      {super.key,
      required this.successfulTopUpTransaction,
      required this.successfulWithdrawlTransaction,
      required this.successfulExpressTransaction,
      required this.successfulSwapTransaction,
      required this.successfulConnectTransaction,
      required this.successfulCardTransaction});
  final String successfulTopUpTransaction,
      successfulWithdrawlTransaction,
      successfulExpressTransaction,
      successfulSwapTransaction,
      successfulConnectTransaction,
      successfulCardTransaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 441.05,
      decoration: BoxDecoration(
          color: Color(0xffE9EBF1), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 10, 0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transaction(
                  image: 'assets/images/topup.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Topup Transaction',
                ),
                SizedBox(
                  height: 50,
                ),
                Transaction(
                  image: 'assets/images/express.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Express transactions',
                ),
                SizedBox(
                  height: 50,
                ),
                Transaction(
                  image: 'assets/images/connect.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Connect transactions',
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transaction(
                  image: 'assets/images/withdrawl.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Withdrawal transactions',
                ),
                SizedBox(
                  height: 50,
                ),
                Transaction(
                  image: 'assets/images/swap.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Swap transactions',
                ),
                SizedBox(
                  height: 50,
                ),
                Transaction(
                  image: 'assets/images/card.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Card transactions',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FailedTransaction extends StatelessWidget {
  const FailedTransaction(
      {super.key,
      required this.failedTopUpTransaction,
      required this.failedWithdrawlTransaction,
      required this.failedExpressTransaction,
      required this.failedSwapTransaction,
      required this.failedConnectTransaction,
      required this.failedCardTransaction});
  final String failedTopUpTransaction,
      failedWithdrawlTransaction,
      failedExpressTransaction,
      failedSwapTransaction,
      failedConnectTransaction,
      failedCardTransaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 441.05,
      decoration: BoxDecoration(
          color: Color(0xffE9EBF1), borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 10, 0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transaction(
                  image: 'assets/images/topup.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Topup Transaction',
                ),
                SizedBox(
                  height: 50,
                ),
                Transaction(
                  image: 'assets/images/express.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Express transactions',
                ),
                SizedBox(
                  height: 50,
                ),
                Transaction(
                  image: 'assets/images/connect.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Connect transactions',
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transaction(
                  image: 'assets/images/withdrawl.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Withdrawal transactions',
                ),
                SizedBox(
                  height: 50,
                ),
                Transaction(
                  image: 'assets/images/swap.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Swap transactions',
                ),
                SizedBox(
                  height: 50,
                ),
                Transaction(
                  image: 'assets/images/card.png',
                  number: '0',
                  subNumber: '0',
                  text: 'Card transactions',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Transaction extends StatelessWidget {
  Transaction(
      {super.key,
      required this.image,
      required this.number,
      required this.subNumber,
      required this.text});
  String image;
  String number;
  String subNumber;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                image,
                width: 60,
                height: 60,
              ),
              SizedBox(
                width: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: number,
                      style: TextStyle(
                          color: Color(0xff233375),
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                      children: [
                    TextSpan(
                        text: '/$subNumber',
                        style: TextStyle(
                            color: Color(0xff6F6F6F),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "PushPenny"))
                  ])),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: TextStyle(
                color: Color(0xff233375),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "PushPenny"),
          )
        ],
      ),
    ));
  }
}
