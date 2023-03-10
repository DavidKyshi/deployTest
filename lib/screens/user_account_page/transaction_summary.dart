// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/providers/transaction_summary_provider.dart';

import '../../widgets/transaction_widgets.dart';

class TransactionSummaryBoard extends StatefulWidget {
  const TransactionSummaryBoard({super.key});

  @override
  State<TransactionSummaryBoard> createState() =>
      _TransactionSummaryBoardState();
}

class _TransactionSummaryBoardState extends State<TransactionSummaryBoard> {
  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);
TransactionSummaryProvider get transactionSummaryProvider =>
      Provider.of<TransactionSummaryProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    final user = userProvider.getUserById();
    final transaction = transactionSummaryProvider.allUsersTransactionSummary;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProfiePictureAvater(),
                    SizedBox(
                      width: 30,
                    ),
                    TotalTransactionRow()
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Overview transaction of ',
                        style: TextStyle(
                            color: Color(0xff233375),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            fontFamily: "PushPenny"),
                        children: [
                      TextSpan(
                        text: '${user!.firstName}!',
                        style: TextStyle(
                            color: Color(0xff6E80A3),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            fontFamily: "PushPenny"),
                      )
                    ])),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Below is the account statement and report in realtime',
                  style: TextStyle(
                      color: Color(0xff0A0A0A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "PushPenny"),
                ),
                SizedBox(
                  height: 20,
                ),
                // ...transactionSummaryProvider.allUsersTransactionSummary
                // .map((allUsersTransactionSummary)=>
                   TransactionBoardChat(
                  failedCardTransaction: '',
                  failedConnectTransaction: '',
                  failedExpressTransaction: '',
                  failedSwapTransaction: '',
                  failedTopUpTransaction: '',
                  failedWithdrawlTransaction: '',
                  successfulCardTransaction: '',
                  successfulConnectTransaction:'',
                  successfulExpressTransaction: '',
                  successfulSwapTransaction:'',
                  successfulTopUpTransaction: '',
                  successfulWithdrawlTransaction: '',
                )
                // ).toList()
                
                
              ],
            ),
            SizedBox(
              width: 80,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  //'assets/images/graph2.png',
                  width: 633,
                  height: 300,
                  //color: Colors.amber,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 400,
                  height: 167,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get statement',
                        style: TextStyle(
                            color: Color(0xff0A0A0A),
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            fontFamily: "PushPenny"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hello, you can always request for your account statement of each currency wallet.',
                        style: TextStyle(
                          fontFamily: "PushPenny",
                          fontSize: 12,
                          color: Color(0xff0A0A0A),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          WalletFilter(),
                          SizedBox(
                            width: 20,
                          ),
                          CalenderPickDateStatement(),
                          SizedBox(
                            width: 10,
                          ),
                          CalenderPickDateStatement2(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
