import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchField.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchFieldDropdown.dart';
import 'package:kyshi_operations_dashboard/helper/currencyConverter.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/models/cardResponse.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/transactions.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/user_account_index.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../models/connectServices.dart';

class UserTransactions {
  String wallet;
  String dates;
  String provider;
  String rate;
  String amount;
  String phoneNumber;
  String status;

  UserTransactions(
      {required this.wallet,
      required this.dates,
      required this.rate,
      required this.phoneNumber,
      required this.provider,
      required this.amount,
      required this.status});
}

class KyshiCard extends StatefulWidget {
  const KyshiCard({Key? key}) : super(key: key);

  @override
  State<KyshiCard> createState() => _KyshiCardState();
}

class _KyshiCardState extends State<KyshiCard> {
  final _debouncer = Debouncer();
  List<String> dates = [
    "Nov 28, 20223:58 PM",
    "Nov 28, 20223:58 PM",
    "Nov 28, 20223:58 PM"
  ];
  List<String> wallets = ["NGN", "GBP", "USD"];
  List<UserTransactions> userList = [
    UserTransactions(
        wallet: "USD",
        dates: "Nov 28, 20223:58 PM",
        amount: '3000',
        phoneNumber: '+23049949904004',
        rate: '£1/₦900',
        status: 'Successful',
        provider: 'Seerbit'),
  ];
  List<String> transactionType = ['Top up', "Debit" , "All"];
  String type = "All";
  ScrollController? controller;
  List<CardTransactions>? kyshiCardsTransaction;
  @override
  void initState() {
    kyshiCardsTransaction = Provider.of<UsersProvider>(context, listen: false).kyshiCardTransactions;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              width: MediaQuery.of(context).size.width / 1.6,
              decoration: BoxDecoration(
                  color: const Color(0XFFF4F5F8),
                  borderRadius: BorderRadius.circular(12)),
              child: kyshiCardsTransaction!.isEmpty
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        SvgPicture.asset(empty),
                        Text(
                          "The user is yet to activate the Kyshi card"
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
                  : SizedBox(
                height: 400,
                    child: ListView.builder(
                    itemBuilder: (context,index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 400,
                            height: 200,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 15),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.98),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildRow(
                                    title:
                                    "Activation date\n${kyshiCardsTransaction![index].createdAt}",
                                    image: SvgPicture.asset(logo)),
                                const SizedBox(
                                  height: 20,
                                ),
                                SvgPicture.asset(sound),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildRow(
                                    title: "Bright George Card balance",
                                    image: const SizedBox()),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildRow(
                                    // Util.formatAmount(cards?.amount)
                                    title: "09000",
                                    image: SvgPicture.asset(visa),
                                    isBold: true)
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            height: 200,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 15),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.98),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildRow(
                                    title: "Virtual Dollar Card",
                                    image: SvgPicture.asset(logo)),
                                const SizedBox(
                                  height: 20,
                                ),
                                SvgPicture.asset(sound),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildRow(
                                    title: "**** **** **** 90182",
                                    isBold: true),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildRow(
                                        title: "Valid thru",
                                        image: const Text(
                                          "CVV",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    const SizedBox()
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildRow(
                                        title: "07/24    ",
                                        image: const Text(
                                          "    ***",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    const SizedBox()
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
              },
                itemCount: 1,
              ),
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            // SearchField(
            //   hintText: "Search card transactions....",
            //   onChanged: (value){
            //     _debouncer.run(() {
            //       setState(() {
            //         // Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, entrySize: value);
            //         List<CardTransactions>? cardTransactions =Provider.of<UsersProvider>(context, listen: false).kyshiCard;
            //         kyshiCardsTransaction = cardTransactions!.where((element) => element.amount!.toLowerCase().contains(value.toLowerCase())).toList();
            //         // isLoading = false;
            //         // print("$user SEARCHED USERS");
            //       });
            //     });
            //   },
            // ),
            SearchFieldDropdown(
              hintText: "Search with amount...",
              // dropDownTitle: "Airtime",
              onChanged: (value){
                _debouncer.run(() {
                  setState(() {
                    final provider = Provider.of<UsersProvider>(context, listen: false);
                    // Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, entrySize: value);
                    List<CardTransactions>? kyshiCardsTrans =type == "Top up"? provider.kyshiCardTransactions : provider.kyshiCardDebitTransactions;
                    kyshiCardsTransaction = kyshiCardsTrans!.where((element) => element.amount!.toLowerCase().contains(value.toLowerCase())).toList();
                    // isLoading = false;
                    // print("$user SEARCHED USERS");
                  });
                });
              }, connect: type,
              connectOnChanged: (String? res){
                setState(() {
                  type = res!;
                });
                final provider = Provider.of<UsersProvider>(context, listen: false);
                // Provider.of<UsersProvider>(context, listen: false).getConnectAirtimeSerivice(context,connect);
                setState(() {
                  kyshiCardsTransaction =type == "Top up"? provider.kyshiCardTransactions : type =="All"? provider.kyshiCardAllTransactions : provider.kyshiCardDebitTransactions;
                });
              }, connectData: transactionType,
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
                child: kyshiCardsTransaction!.isEmpty
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Dates",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'PushPenny',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                              Text("Wallet",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'PushPenny',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                              Text("Provider",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'PushPenny',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                              Text("Transaction ID",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'PushPenny',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                              Text("Amount (₦)",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'PushPenny',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12)),
                              // Text("Exchange rate",
                              //     style: TextStyle(
                              //         color: primaryColor,
                              //         fontFamily: 'PushPenny',
                              //         fontWeight: FontWeight.w500,
                              //         fontSize: 12)),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          SvgPicture.asset(empty),
                          Text(
                            "The user is yet to make a top up"
                            " \n to Kyshi card,"
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
                    : DataTable(
                        columns:  <DataColumn>[
                          DataColumn(
                            label: Text("Dates",style: headerStyle,),
                            // tooltip: "To Display name"
                          ),
                          DataColumn(label: Text("Wallet",style: headerStyle,)),
                          DataColumn(label: Text("Provider",style: headerStyle,)),
                          DataColumn(label: Text("Transaction ID",style: headerStyle,)),
                          DataColumn(label: Text("Amount (₦)",style: headerStyle,)),
                          // DataColumn(label: Text("Exchange rate")),
                          DataColumn(label: Text("Status",style: headerStyle,)),
                        ],
                        rows: kyshiCardsTransaction!
                            .map(
                              (user) => DataRow(
                                cells: [
                                  DataCell(
                                    Text(user.createdAt ??"",style: subHeaderStyle,),
                                  ),
                                  DataCell(
                                    Text(user.currency ??"",style: subHeaderStyle,),
                                  ),
                                  DataCell(
                                    Text(user.processor??"",style: subHeaderStyle,),
                                  ),
                                  DataCell(
                                    Text(user.id ?? "",style: subHeaderStyle,),
                                  ),
                                  DataCell(
                                    Text(user.amount??"",style: subHeaderStyle,),
                                  ),
                                  DataCell(Text(user.status ?? "",style: subHeaderStyle,)),
                                ],
                              ),
                            )
                            .toList(),
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

  Row buildRow(
      {required String title, bool isBold = false, Widget? image}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: isBold ? 28 : 10,
              fontFamily: 'PushPenny',
              color: Colors.white),
        ),
        const SizedBox(
          width: 15,
        ),
        image ??  SizedBox()
      ],
    );
  }
}

class CardDetailRow extends StatelessWidget {
  final String? title;
  final String? trailing;
  final Function()? callback;
  final bool canCopy;
  final bool isDelete;
  const CardDetailRow({
    this.title,
    this.trailing,
    this.isDelete = false,
    this.callback,
    this.canCopy = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (canCopy) ...[
          GestureDetector(
            onTap: () async {
              // await Clipboard.setData(ClipboardData(text: trailing ?? ""))
              //     .then((result) {
              //   Fluttertoast.showToast(
              //       msg: 'Copied',
              //       toastLength: Toast.LENGTH_SHORT,
              //       gravity: ToastGravity.CENTER,
              //       backgroundColor: Colors.blue,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              // });
            },
            child: const Center(
                child: Text(
              "Tap to copy",
              style: TextStyle(
                  fontFamily: 'PushPenny',
                  color: Colors.red,
                  fontSize: 12,
                  // decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w400),
            )),
          ),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$title",
              style: TextStyle(
                  fontFamily: 'PushPenny',
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            if (isDelete)
              GestureDetector(
                  onTap: callback,
                  child: Icon(Icons.chevron_right_outlined,
                      color: Color(0xff8C8C8C)))
            else
              SelectableText(
                "$trailing",
                style: TextStyle(
                    fontFamily: 'PushPenny',
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
          ],
        ),
        if (!isDelete) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Divider(
              color: const Color(0xff1E347A).withOpacity(.09),
            ),
          ),
        ],
      ],
    );
  }
}
