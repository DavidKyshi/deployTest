import 'package:flutter/material.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchField.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchFieldDropdown.dart';

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
    UserTransactionHistory(
        wallet: "NGN",
        dates: "Nov 28, 20223:58 PM",
        channel: "Swap",
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
    UserTransactionHistory(
        wallet: "NGN",
        dates: "Nov 28, 20223:58 PM",
        channel: "Express",
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
    UserTransactionHistory(
        wallet: "NGN",
        dates: "Nov 28, 20223:58 PM",
        channel: "Card",
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
        processor: 'VFDBank')
  ];
  ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            const SearchField(),
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 60,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text("Dates"),
                        // tooltip: "To Display name"
                      ),
                      DataColumn(label: Text("Type")),
                      DataColumn(label: Text("Beneficiary")),
                      DataColumn(label: Text("Channel")),
                      DataColumn(label: Text("Amount")),
                      DataColumn(label: Text("Charges")),
                      DataColumn(label: Text("Offer")),
                      DataColumn(
                        label: Text("Processor"),
                        // tooltip: "To Display name"
                      ),
                      DataColumn(label: Text("Sender")),
                      DataColumn(label: Text("Purpose")),
                      DataColumn(label: Text("Recipient")),
                      DataColumn(label: Text("Operation")),
                      DataColumn(label: Text("ID")),
                      DataColumn(label: Text("Ledger")),
                      DataColumn(label: Text("Status")),
                    ],
                    rows: userList
                        .map(
                          (user) => DataRow(
                            cells: [
                              DataCell(
                                Text(user.dates),
                              ),
                              DataCell(
                                Text(user.type),
                              ),
                              DataCell(
                                Text(user.beneficiary),
                              ),
                              DataCell(
                                Text(user.channel),
                              ),
                              DataCell(
                                Text(user.amount),
                              ),
                              DataCell(Text(user.charges)),
                              DataCell(Text(user.offer)),
                              DataCell(
                                Text(user.processor),
                              ),
                              DataCell(Text(user.sender)),
                              DataCell(Text(user.purpose)),
                              DataCell(Text(user.recipient)),
                              DataCell(Text(user.operation ?? " ")),
                              DataCell(Text(user.id)),
                              DataCell(Text(user.ledger)),
                              DataCell(Text(user.status)),
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
