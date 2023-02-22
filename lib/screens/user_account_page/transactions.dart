import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchField.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchFieldDropdown.dart';
import 'package:provider/provider.dart';

import '../../models/transactions.dart';
import '../../providers/users.dart';
import '../../styleguide/colors.dart';
import '../../styleguide/image_asset.dart';

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

  UserTransactionHistory({required this.wallet,
    required this.dates,required this.channel,
    required this.charges,required this.amount, required this.status,
    required this.type,required this.beneficiary,required this.offer,
    required this.sender,required this.purpose,required this.recipient,
    this.operation,required this.id,required this.ledger,required this.processor});
}
class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  List<String> dates = ["Nov 28, 20223:58 PM","Nov 28, 20223:58 PM","Nov 28, 20223:58 PM"];
  List<String> wallets = ["NGN","GBP","USD"];
  List<String> items =["Dates","Wallet","Provider","Phone Number", "Exchange rate","Status"];
  List<String> provider = ["Seerbit","Seerbit","Seerbit"];
  List<String> rate = ["£1/₦900","£1/₦900","£1/₦900"];
  List<String> status = ["Successful","Successful","Failed"];
  List<String> amount = ["3000","3000","3000"];
  List<TransactionsData>? transactions;
  List<String> phoneNumber = ["+2341988736636","+2341988736636","+2341988736636"];
  List<UserTransactionHistory> userList = [
    UserTransactionHistory(wallet: "NGN", dates: "Nov 28, 20223:58 PM", channel: "Fund", charges:
    "NGN:0.00", amount: "NGN100,00.00", status: "Successful", type: "DR", beneficiary: "NIL", offer:
    "NIL", sender: "Emma Levick\nSort: 929917\nAcc No: 9298198301", purpose: "For Upkeep and school",
        recipient: "Emma Levick\nSort: 929917\nAcc No: 9298198301", id: "6086346c-c5ac-98-6086346c-c5ac-98", ledger: "NIL", processor: 'VFDBank'),
    UserTransactionHistory(wallet: "NGN", dates: "Nov 28, 20223:58 PM", channel: "Swap", charges:
    "NGN:0.00", amount: "NGN100,00.00", status: "Successful", type: "DR", beneficiary: "NIL", offer:
    "NIL", sender: "Emma Levick\nSort: 929917\nAcc No: 9298198301", purpose: "For Upkeep and school",
        recipient: "Emma Levick\nSort: 929917\nAcc No: 9298198301", id: "6086346c-c5ac-98-6086346c-c5ac-98", ledger: "NIL", processor: 'VFDBank'),
    UserTransactionHistory(wallet: "NGN", dates: "Nov 28, 20223:58 PM", channel: "Express", charges:
    "NGN:0.00", amount: "NGN100,00.00", status: "Successful", type: "DR", beneficiary: "NIL", offer:
    "NIL", sender: "Emma Levick\nSort: 929917\nAcc No: 9298198301", purpose: "For Upkeep and school",
        recipient: "Emma Levick\nSort: 929917\nAcc No: 9298198301", id: "6086346c-c5ac-98-6086346c-c5ac-98", ledger: "NIL", processor: 'VFDBank'),
    UserTransactionHistory(wallet: "NGN", dates: "Nov 28, 20223:58 PM", channel: "Card", charges:
    "NGN:0.00", amount: "NGN100,00.00", status: "Successful", type: "DR", beneficiary: "NIL", offer:
    "NIL", sender: "Emma Levick\nSort: 929917\nAcc No: 9298198301", purpose: "For Upkeep and school",
        recipient: "Emma Levick\nSort: 929917\nAcc No: 9298198301", id: "6086346c-c5ac-98-6086346c-c5ac-98", ledger: "NIL", processor: 'VFDBank')
  ];
  ScrollController? controller;
   @override
  void initState() {
     transactions =Provider.of<UsersProvider>(context, listen: false).transactions;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        child: Column(
          children:  [
            const SearchField(),
            const SizedBox(height: 20,),
            SingleChildScrollView(
              child: Container(
                height:600,
                decoration:  BoxDecoration(
                    color:const Color(0XFFEAEBF1),
                    borderRadius: BorderRadius.circular(12)
                ),
                width: MediaQuery.of(context).size.width,
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:transactions!.isEmpty?
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Type",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Beneficiary",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Channel",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Charges",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Offer",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Sender",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Purpose",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Recipient",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Operation",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("ID",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                          Text("Ledger",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          )),
                        ],
                      ),
                      const SizedBox(height: 100,),
                      SvgPicture.asset(empty),
                      Text("The user is yet to make a transaction,\n  it will appear here when the user\n does",style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'PushPenny',
                      ),)
                    ],
                  ):
                  DataTable(
                    dataRowHeight: 60,
                    columns:  <DataColumn>[
                      DataColumn(label: Text("Dates",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )),
                        // tooltip: "To Display name"
                      ),
                      DataColumn(label: Text("Type",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Beneficiary",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Channel",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Amount",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Charges",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Offer",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Processor",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )),
                        // tooltip: "To Display name"
                      ),
                      DataColumn(label: Text("Sender",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Purpose",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Recipient",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Operation",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("ID",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Ledger",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                      DataColumn(label: Text("Status",style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'PushPenny',
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      ))),
                    ],
                    rows: transactions!.map(
                          (trx) => DataRow(
                        cells: [
                          DataCell(
                            Text("${trx.createdAt}",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            )),
                          ),
                          DataCell(
                            Text(trx.type ?? "",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            )),
                          ),
                          DataCell(
                            Text(trx.beneficiary ?? "",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            )),
                          ),
                          DataCell(
                            Text(trx.channel ?? "",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            )),
                          ),
                          DataCell(
                            Text(trx.amount ?? ""),
                          ),
                          DataCell(
                              Text(trx.serviceCharge ?? "")
                          ),
                          const DataCell(
                              Text( "NIL")
                          ),
                          DataCell(
                              Text(trx.processor ?? "",style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'PushPenny',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
                              )),
                          ),
                          const DataCell(
                              Text( "No sender")
                          ),
                          const DataCell(
                              Text("No purpose")
                          ),
                          DataCell(
                              Text(trx.beneficiary ?? "",style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'PushPenny',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
                              ))
                          ),
                           const DataCell(
                              Text( "")
                          ),
                          const DataCell(
                              Text( "No ID")
                          ),
                          DataCell(
                              Text(trx.ledgerOperation ?? "")
                          ),
                          DataCell(
                              Text(trx.status ?? "",style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'PushPenny',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14
                              ))
                          ),
                        ],
                      ),
                    ).toList(),
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
