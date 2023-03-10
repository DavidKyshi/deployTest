import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/all_offer.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:provider/provider.dart';

import '../../customWidget/searchField.dart';
import '../../models/wallet_comment_model.dart';
import '../../models/wallet_management.dart';
import '../../userService/userService.dart';
import '../../widgets/accept_offer_alertbox.dart';
import '../user_account_page/wallet/wallet_beneficiaries.dart';

class PendingWallets extends StatefulWidget {
  const PendingWallets({Key? key}) : super(key: key);

  @override
  State<PendingWallets> createState() => _PendingWallets();
}

class _PendingWallets extends State<PendingWallets> {
  ScrollController? controller;
  List<WalletResponse>? pendingWallets;

  final List<String> date = [
    "Active",
    "Rejected",
    "Pending",
  ];
  final List<String> date2 = [
    "Nov 28, 2022 3:58 PM",
    "Nov 28, 2022 3:58 PM",
  ];

  final List<String> email2 = [
    "Bright George brightgerg@yahoo.com",
    "Bright George brightgerg@yahoo.com",
  ];
  bool activeWalletSwitchValue = false;
  bool pendingWalletSwitchValue = false;
  bool rejectedWalletSwitchValue = false;
  bool manageWallet = false;
  List<CommentDetails> comments = [];
  @override
  void initState() {
    pendingWallets =
        Provider.of<UsersProvider>(context, listen: false).pendingWallets;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> id = [
      Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
            activeColor: kyshiGreen,
            trackColor: Colors.grey,
            thumbColor: activeWalletSwitchValue ? primaryColor : Colors.white,
            value: activeWalletSwitchValue,
            onChanged: (value) {
              setState(() {
                activeWalletSwitchValue = value;
              });
            }),
      ),
      Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
            activeColor: Colors.grey,
            trackColor: kyshiRed.withOpacity(0.4),
            thumbColor: pendingWalletSwitchValue ? Colors.white : kyshiRed,
            value: pendingWalletSwitchValue,
            onChanged: (value) {
              setState(() {
                pendingWalletSwitchValue = value;
              });
            }),
      ),
      Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
            activeColor: kyshiGreen,
            trackColor: Colors.grey.withOpacity(0.4),
            thumbColor: rejectedWalletSwitchValue ? primaryColor : Colors.grey,
            value: rejectedWalletSwitchValue,
            onChanged: (value) {
              setState(() {
                rejectedWalletSwitchValue = value;
              });
            }),
      ),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: SingleChildScrollView(
              child: Container(
                height: 800,
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
                            label: Text("Created",
                                style: TextStyle(
                                    //color: primaryColor,
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("User",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("Currency",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("Provider",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("Available",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("Total",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("Tier",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("Status",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("Comments",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                        DataColumn(
                            label: Text("Actions",
                                style: TextStyle(
                                    color: Color(0XFF233375),
                                    fontFamily: 'PushPenny',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12))),
                      ],
                      rows: pendingWallets!
                          .map((e) => DataRow(cells: [
                                DataCell(
                                  Text(e.createdAt ?? "",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                                DataCell(
                                  Text(e.user ?? "",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                                DataCell(
                                  Text(e.currency ?? "",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                                DataCell(
                                  Text(e.provider ?? "",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                                DataCell(
                                  Text("${e.availableBalance ?? ""}",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                                DataCell(
                                  Text("${e.ledgerBalance ?? ""}",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                                DataCell(
                                  Text("${e.tier?.name ?? ""}",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                                DataCell(
                                  Text(e.status ?? "",
                                      style: TextStyle(
                                          color: e.status == "PENDING"
                                              ? warning
                                              : e.status == "ACTIVE"
                                                  ? kyshiGreen
                                                  : kyshiRed,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                                DataCell(InkWell(
                                  onTap: () async {
                                    Map<String, dynamic> response =
                                        await UserService().getWalletComments(
                                            context: context);
                                    WalletCommentModel commentModel =
                                        WalletCommentModel.fromJson(response);
                                    setState(() {
                                      comments = commentModel.data ?? [];
                                    });
                                    viewCommentAlertBox(
                                        context: context, comment: comments);
                                  },
                                  child: OfferButton(
                                    isBorder: false,
                                    text: 'VIEW COMMENT',
                                    comment: true,
                                    commentBackground: false,
                                    color: const Color(0XFF6D48FF),
                                  ),
                                )),
                                DataCell(
                                  // e.status == "PENDING" ? InkWell(
                                  //   onTap: (){
                                  //     manageWalletStatusAlertBox(context);
                                  //   },
                                  // viewCommentAlertBox(context);
                                  //   child: OfferButton(
                                  //     isBorder: false,
                                  //     text: 'MANAGE WALLET',
                                  //     comment: true,
                                  //   ),
                                  // ):
                                  InkWell(
                                      onTap: () {
                                        editWalletStatusDialog(
                                          context,
                                          walletType: "NGN",
                                          title: 'Add comment',
                                        );
                                      },
                                      child: OfferButton(
                                        isBorder: false,
                                        text: 'MANAGE WALLET',
                                        comment: false,
                                      )),
                                ),
                              ]))
                          .toList()),
                ),
              ),
            ),
            // Column(
            //   children: [
            //     // const SearchField(),
            //     // const SizedBox(height: 10,),
            //     Padding(
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            //       child: Stack(
            //         children: [
            //           Container(
            //               // padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
            //               height: MediaQuery.of(context).size.height,
            //               width: MediaQuery.of(context).size.width,
            //               decoration: BoxDecoration(
            //                   color: const Color(0XFFEAEBF1),
            //                   borderRadius: BorderRadius.circular(12)),
            //               child: ListView(
            //                   scrollDirection: Axis.horizontal,
            //                   children: [
            //                     Container(
            //                       height: MediaQuery.of(context).size.height,
            //                       width: 340,
            //                       decoration: BoxDecoration(
            //                         //color: Colors.amber,
            //                         border: Border(
            //                           right: BorderSide(
            //                             color: primaryColor,
            //                             width: 2,
            //                           ),
            //                         ),
            //                       ),
            //                       padding: const EdgeInsets.symmetric(
            //                           vertical: 20, horizontal: 25),
            //                       child: Row(
            //                         children: [
            //                           AllOfferTitleTable(
            //                             title: 'Created',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context)
            //                                   .size
            //                                   .height,
            //                               width: 83,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics: const PageScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       // padding: const EdgeInsets.symmetric(vertical: 15),
            //                                       child: Column(
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.start,
            //                                     children: [
            //                                       Text(
            //                                         allWallets![index].createdAt ?? "",
            //                                         style: const TextStyle(
            //                                             fontSize: 14,
            //                                             fontWeight:
            //                                                 FontWeight.w400,
            //                                             color:
            //                                                 Color(0xff233375)),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 50,
            //                                       )
            //                                     ],
            //                                   ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 20,
            //                           ),
            //                           AllOfferTitleTable(
            //                             title: 'User',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context)
            //                                   .size
            //                                   .height,
            //                               width: 155,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics: const NeverScrollableScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       //  padding: const EdgeInsets.symmetric(vertical: 15),
            //                                       child: Column(
            //                                     children: [
            //                                       Text(
            //                                         allWallets![index].user ?? "",
            //                                         style: const TextStyle(
            //                                             fontSize: 14,
            //                                             fontWeight:
            //                                                 FontWeight.w400,
            //                                             color:
            //                                                 Color(0xff233375)),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 30,
            //                                       )
            //                                     ],
            //                                   ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     Container(
            //                       padding: const EdgeInsets.symmetric(
            //                           vertical: 20, horizontal: 25),
            //                       decoration: const BoxDecoration(
            //                         //color: Colors.amber,
            //                         color: Colors.white,
            //                         border: Border(
            //                           right: BorderSide(
            //                             color: Color(0xffF4F5F8),
            //                             width: 2,
            //                           ),
            //                         ),
            //                       ),
            //                       child: Row(
            //                         children: [
            //                           AllOfferTitleTable(
            //                             title: 'Currency',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context)
            //                                   .size
            //                                   .height,
            //                               width: 110,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics: const NeverScrollableScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       //  padding: const EdgeInsets.symmetric(vertical: 15),
            //                                       child: Column(
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.start,
            //                                     children: [
            //                                       Text(
            //                                         allWallets![index].currency ?? "",
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 50,
            //                                       )
            //                                     ],
            //                                   ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 30,
            //                           ),
            //                           AllOfferTitleTable(
            //                             title: 'Provider',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context)
            //                                   .size
            //                                   .height,
            //                               width: 80,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics: const NeverScrollableScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       //   padding: const EdgeInsets.symmetric(vertical: 15),
            //                                       child: Column(
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.start,
            //                                     children: [
            //                                       Text(
            //                                         allWallets![index].provider ?? "",
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 50,
            //                                       )
            //                                     ],
            //                                   ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 30,
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     Container(
            //                       padding: const EdgeInsets.symmetric(
            //                           vertical: 20, horizontal: 25),
            //                       decoration: const BoxDecoration(
            //                         //color: Colors.amber,
            //                         color: Colors.white,
            //                         border: Border(
            //                           right: BorderSide(
            //                             color: Color(0xffF4F5F8),
            //                             width: 2,
            //                           ),
            //                         ),
            //                       ),
            //                       child: Row(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           AllOfferTitleTable(
            //                             title: 'Available',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context)
            //                                   .size
            //                                   .height,
            //                               width: 110,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics:
            //                                     NeverScrollableScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       //  padding: const EdgeInsets.symmetric(vertical: 15),
            //                                       child: Column(
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.start,
            //                                     children: [
            //                                       Text(
            //                                         "${allWallets![index].availableBalance ?? 0} " ,
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 50,
            //                                       )
            //                                     ],
            //                                   ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 20,
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(top: 30),
            //                             child: Text(
            //                               "wallet balance",
            //                               style: TextStyle(
            //                                   color:
            //                                       primaryColor.withOpacity(0.5),
            //                                   fontFamily: 'PushPenny',
            //                                   fontSize: 12,
            //                                   fontWeight: FontWeight.w500),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 20,
            //                           ),
            //                           AllOfferTitleTable(
            //                             title: 'Total',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context)
            //                                   .size
            //                                   .height,
            //                               width: 120,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics:
            //                                     NeverScrollableScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       //   padding: const EdgeInsets.symmetric(vertical: 15),
            //                                       child: Column(
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.start,
            //                                     children: [
            //                                       Text(
            //                                         "${allWallets![index].ledgerBalance ?? 0}",
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 50,
            //                                       )
            //                                     ],
            //                                   ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                           // const SizedBox(width: 30,),
            //                         ],
            //                       ),
            //                     ),
            //                     Container(
            //                       height: MediaQuery.of(context).size.height,
            //                       // width: 640,
            //                       padding: const EdgeInsets.symmetric(
            //                           vertical: 20, horizontal: 25),
            //                       child: Row(
            //                         children: [
            //                           AllOfferTitleTable(
            //                             title: 'Tier',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context)
            //                                   .size
            //                                   .height,
            //                               width: 52,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics: PageScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       // padding: const EdgeInsets.symmetric(vertical: 15),
            //                                       child: Column(
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.start,
            //                                     children: [
            //                                       Text(
            //                                         "${allWallets![index].tier?.name ?? ""}",
            //                                         style: const TextStyle(
            //                                             fontSize: 14,
            //                                             fontWeight:
            //                                                 FontWeight.w400,
            //                                             color:
            //                                                 Color(0xff233375)),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 50,
            //                                       )
            //                                     ],
            //                                   ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 20,
            //                           ),
            //                           AllOfferTitleTable(
            //                             title: 'Status',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context)
            //                                   .size
            //                                   .height,
            //                               width: 83,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics:
            //                                     NeverScrollableScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       //  padding: const EdgeInsets.symmetric(vertical: 15),
            //                                       child: Column(
            //                                     crossAxisAlignment:
            //                                         CrossAxisAlignment.start,
            //                                     children: [
            //                                       Text(
            //                                         allWallets![index].status ?? "",
            //                                         style: const TextStyle(
            //                                             fontSize: 14,
            //                                             fontWeight:
            //                                                 FontWeight.w400,
            //                                             color:
            //                                                 Color(0xff233375)),
            //                                       ),
            //                                       const SizedBox(
            //                                         height: 50,
            //                                       )
            //                                     ],
            //                                   ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 20,
            //                           ),
            //                           AllOfferTitleTable(
            //                             title: 'Actions',
            //                             name: SizedBox(
            //                               height: MediaQuery.of(context).size.height,
            //                               width: 65,
            //                               child: ListView.builder(
            //                                 // controller: controller,
            //                                 physics: const NeverScrollableScrollPhysics(),
            //                                 itemBuilder: (context, index) {
            //                                   return Container(
            //                                       padding: const EdgeInsets.only(right: 25),
            //                                       child: Column(
            //                                         crossAxisAlignment: CrossAxisAlignment.start,
            //                                         children: [
            //                                           id[index],
            //                                           const SizedBox(
            //                                             height: 24,
            //                                           )
            //                                         ],
            //                                       ));
            //                                 },
            //                                 itemCount: allWallets?.length,
            //                               ),
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 20,
            //                           ),
            //                           AllOfferTitleTable(
            //                             title: 'Status',
            //                             name: SizedBox(
            //                                 height: MediaQuery.of(context)
            //                                     .size
            //                                     .height,
            //                                 width: 100,
            //                                 child: Column(
            //                                   crossAxisAlignment:
            //                                       CrossAxisAlignment.start,
            //                                   children: [
            //                                     InkWell(
            //                                         onTap: () {
            //                                           manageWalletStatusAlertBox(
            //                                               context);
            //                                         },
            //                                         child: OfferButton(
            //                                           isBorder: false,
            //                                           text: 'ADD COMMENT',
            //                                           comment: true,
            //                                           commentBackground: false,
            //                                         )),
            //                                     const SizedBox(
            //                                       height: 35,
            //                                     ),
            //                                     InkWell(
            //                                         onTap: () {
            //                                           // acceptOfferAlertBox(context);
            //                                           viewCommentAlertBox(
            //                                               context);
            //                                         },
            //                                         child: OfferButton(
            //                                           isBorder: false,
            //                                           text: 'VIEW COMMENT',
            //                                           comment: true,
            //                                         )),
            //                                     const SizedBox(
            //                                       height: 35,
            //                                     ),
            //                                     OfferButton(
            //                                       isBorder: false,
            //                                       text: 'VIEW COMMENT',
            //                                       comment: true,
            //                                     ),
            //                                   ],
            //                                 )),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ])),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ),
        ));
  }
}
