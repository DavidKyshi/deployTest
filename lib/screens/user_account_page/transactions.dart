import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchField.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchFieldDropdown.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/user_account_index.dart';
import 'package:provider/provider.dart';

import '../../models/transactions.dart';
import '../../providers/users.dart';
import '../../styleguide/colors.dart';
import '../../styleguide/image_asset.dart';

TextStyle headerStyle = TextStyle(
    color: primaryColor,
    fontFamily: 'PushPenny',
    fontWeight: FontWeight.w500,
    fontSize: 12);
TextStyle subHeaderStyle = TextStyle(
    color: primaryColor,
    fontFamily: 'PushPenny',
    fontWeight: FontWeight.w400,
    fontSize: 14);

class UserTransactionHistory {
  String wallet;
  String dates;
  String charges;
  String channel;
  String amount;
  String? operation;
  String status;
  String type;
  String offer;
  String sender;
  String processor;
  String id;
  String purpose;
  String recipient;
  String beneficiary;
  String ledger;

  UserTransactionHistory(
      {required this.wallet,
      required this.dates,
      required this.channel,
      required this.charges,
      required this.amount,
      required this.status,
      required this.type,
      required this.beneficiary,
      required this.offer,
      required this.sender,
      required this.purpose,
      required this.recipient,
      this.operation,
      required this.id,
      required this.ledger,
      required this.processor});
}

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final _debouncer = Debouncer();
  List<String> dates = [
    "Nov 28, 20223:58 PM",
    "Nov 28, 20223:58 PM",
    "Nov 28, 20223:58 PM"
  ];
  List<String> wallets = ["NGN", "GBP", "USD"];
  List<String> items = [
    "Dates",
    "Wallet",
    "Provider",
    "Phone Number",
    "Exchange rate",
    "Status"
  ];
  List<String> provider = ["Seerbit", "Seerbit", "Seerbit"];
  List<String> rate = ["£1/₦900", "£1/₦900", "£1/₦900"];
  List<String> status = ["Successful", "Successful", "Failed"];
  List<String> amount = ["3000", "3000", "3000"];
  List<String> phoneNumber = [
    "+2341988736636",
    "+2341988736636",
    "+2341988736636"
  ];
  List<UserTransactionHistory> userList = [
    UserTransactionHistory(
        wallet: "NGN",
        dates: "Nov 28, 20223:58 PM",
        channel: "Fund",
        charges: "NGN:0.00",
        amount: "NGN100,00.00",
        status: "Successful",
        type: "DR",
        beneficiary: "NIL",
        offer: "NIL",
        sender: "Emma Levick\nSort: 929917\nAcc No: 9298198301",
        purpose: "For Upkeep and school",
        recipient: "Emma Levick\nSort: 929917\nAcc No: 9298198301",
        id: "6086346c-c5ac-98-6086346c-c5ac-98",
        ledger: "NIL",
        processor: 'VFDBank'),

  ];
  ScrollController? controller;
  List<TransactionsData>? transactions;

  @override
  void initState() {
    transactions =
        Provider.of<UsersProvider>(context, listen: false).transactions;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
          SearchField(
             hintText: "Search amount....",
            onChanged: (value){
              _debouncer.run(() {
                setState(() {
                  // Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, entrySize: value);
                  List<TransactionsData>? transaction =Provider.of<UsersProvider>(context, listen: false).transactions;
                  transactions = transaction!.where((element) => element.amount!.toLowerCase().contains(value.toLowerCase())).toList();
                  // isLoading = false;
                  // print("$user SEARCHED USERS");
                });
              });
            },
          ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                    color: const Color(0XFFEAEBF1),
                    borderRadius: BorderRadius.circular(12)),
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: transactions!.isEmpty
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Dates", style: headerStyle),
                              Text("Type", style: headerStyle),
                              Text("Beneficiary", style: headerStyle),
                              Text("Channel", style: headerStyle),
                              Text("Amount (₦)", style: headerStyle),
                              Text("Charges", style: headerStyle),
                              Text("Offer", style: headerStyle)

                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          SvgPicture.asset(empty),
                          Text(
                            "The user is yet to make transaction"
                            "  it will\n appear here when the user does",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PushPenny',
                            ),
                          )
                        ],
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          dataRowHeight: 60,
                          columns:  <DataColumn>[
                            DataColumn(
                              label: Text("Dates", style: headerStyle),
                              // tooltip: "To Display name"
                            ),
                            DataColumn(label: Text("Type", style: headerStyle)),
                            DataColumn(label: Text("Beneficiary", style: headerStyle)),
                            DataColumn(label: Text("Channel", style: headerStyle)),
                            DataColumn(label: Text("Amount", style: headerStyle)),
                            DataColumn(label: Text("Charges", style: headerStyle)),
                            DataColumn(label: Text("Offer", style: headerStyle)),
                            DataColumn(
                              label: Text("Processor", style: headerStyle),
                              // tooltip: "To Display name"
                            ),
                            DataColumn(
                                label: Text("Sender", style: headerStyle)),
                            DataColumn(
                                label: Text("Purpose", style: headerStyle)),
                            DataColumn(
                                label: Text("Recipient", style: headerStyle)),
                            DataColumn(
                                label: Text("Operation", style: headerStyle)),
                            DataColumn(
                                label: Text("ID", style: headerStyle)),
                            DataColumn(
                                label: Text("Ledger", style: headerStyle)),
                            DataColumn(
                                label: Text("Status", style: headerStyle)),
                          ],
                          rows: transactions!
                              .map(
                                (trx) => DataRow(
                                  cells: [
                                    DataCell(
                                      Text("${trx.createdAt}",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    DataCell(
                                      Text(trx.type ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    DataCell(
                                      Text(trx.beneficiary ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    DataCell(
                                      Text(trx.channel ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    DataCell(
                                      Text(trx.amount ?? "", style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                    ),
                                    DataCell(Text(trx.serviceCharge ?? "", style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14))),
                                     DataCell(Text("NIL", style: TextStyle(
                                         color: primaryColor,
                                         fontFamily: 'PushPenny',
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14))),
                                    DataCell(
                                      Text(trx.processor ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                     DataCell(Text("No sender", style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14))),
                                     DataCell(Text("No purpose", style: TextStyle(
                                         color: primaryColor,
                                         fontFamily: 'PushPenny',
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14))),
                                    DataCell(Text(trx.beneficiary ?? "",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14))),
                                    const DataCell(Text("")),
                                     DataCell(Text("No ID",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14))),
                                    DataCell(Text(trx.ledgerOperation ?? "")),
                                    DataCell(Text(trx.status ?? "",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14))),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
              //   height:600,
              //   width: MediaQuery.of(context).size.width,
              //   decoration:  BoxDecoration(
              //       color:const Color(0XFFEAEBF1),
              //       borderRadius: BorderRadius.circular(12)
              //   ),
              //   child: SizedBox(
              //     height: 500,
              //     width: MediaQuery.of(context).size.width,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context,index){
              //       return UserAccountTable(title: items[index],name: SizedBox(
              //         height: 500,
              //         width: 100,
              //         child: ListView.builder(
              //           controller: controller,
              //           physics: const PageScrollPhysics(),
              //           itemBuilder: (context,index){
              //             return Container(
              //                 decoration: const BoxDecoration(
              //                     border: Border(bottom: BorderSide(color: Colors.greenAccent))
              //                 ),
              //                 padding: const EdgeInsets.symmetric(vertical: 15),
              //                 child:Text(items[index]== "Dates" ? dates[index]:
              //                 items[index]=="Wallet" ?wallets[index]:
              //                 items[index]=="Provider"? provider[index]:
              //                 items[index]=="Phone Number" ? phoneNumber[index]: rate[index]
              //                 ));
              //           },
              //           itemCount: dates.length,
              //         ),
              //       ),);
              //       //   Row(
              //       //   children: [
              //       //     UserAccountTable(title: "Date",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(dates[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Wallet",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(wallets[index]));
              //       //         },
              //       //         itemCount: wallets.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Provider",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(provider[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Phone number",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(phoneNumber[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Amount (₦)",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(amount[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Exchange Rate",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(rate[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Status",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(status[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //   ],
              //       // )
              //     },itemCount: items.length,),
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
