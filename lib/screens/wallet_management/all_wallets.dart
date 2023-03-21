import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:kyshi_operations_dashboard/models/wallet_comment_model.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/all_offer.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/wallet/wallet_beneficiaries.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:provider/provider.dart';

import '../../customWidget/searchField.dart';
import '../../models/wallet_management.dart';
import '../../userService/userService.dart';
import '../../widgets/accept_offer_alertbox.dart';
import '../user_account_page/user_account_index.dart';

class AllWallets extends StatefulWidget {
    List<Wallet> allWallets;
   AllWallets({Key? key,required this.allWallets}) : super(key: key);

  @override
  State<AllWallets> createState() => _AllWalletsState();
}

class _AllWalletsState extends State<AllWallets> {
  ScrollController? controller;
  final TextEditingController _controller = TextEditingController();
  // List<Wallet>? allWallets;
  final _debouncer = Debouncer();

  bool activeWalletSwitchValue = false;
  bool pendingWalletSwitchValue = false;
  bool rejectedWalletSwitchValue = false;
  bool changeStatus = false;
  bool manageWallet = false;
  List<CommentDetails> comments = [];
  String walletStatus = '';
  String walletId = "";
  String? selectedId;
  String dropdownvalue = '100';
  var currency = ['100', '300', '500', '700', "1000"];
  bool isLoading = false;
  @override
  void initState() {
    // allWallets = Provider.of<UsersProvider>(context, listen: false).allWallets;
    selectedId = Provider.of<UsersProvider>(context, listen: false)
        .currentSelectedUserId;
    // TODO: implement initState
    super.initState();
    // getAllWallet();
  }
  // DataTableSource dataSource() =>
  //     AllWalletTableRow(allWallets: widget.allWallets, contexts: context);

  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);
  // getAllWallet()async{
  //   Map<String, dynamic> response = await UserService().getWalletComments(context: context);
  //   WalletCommentModel commentModel = WalletCommentModel.fromJson(response);
  //   setState(() {
  //     comments = commentModel.data ?? [];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print("${allWallets!.map((e) => e.status)} from build");
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: SingleChildScrollView(
              child: StatefulBuilder(builder: (context, state) {
                return 
                Column(
                  children: [
                     SearchField(
                       hintText: "Search wallet....",
                      onChanged: (value){
                        _debouncer.run(() {
                          setState(() {
                            // Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, entrySize: value);
                            List<Wallet> result =Provider.of<UsersProvider>(context, listen: false).allWallets;
                            widget.allWallets = result.where((element) => element.user!.toLowerCase().contains(value.toLowerCase())).toList();
                            // isLoading = false;
                            // print("$user SEARCHED USERS");
                          });
                        });
                      },
                    ),
                    const SizedBox(height: 20,),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 28),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         'Wallet Management',
                    //         style: TextStyle(
                    //             fontSize: 32,
                    //             fontWeight: FontWeight.w700,
                    //             fontFamily: "PushPenny",
                    //             color: primaryColor),
                    //       ),
                    //       const SizedBox(),
                    //       // Row(
                    //       //   children: [
                    //       //     Text(
                    //       //       "Show entries",
                    //       //       style: TextStyle(
                    //       //           fontSize: 14,
                    //       //           fontWeight: FontWeight.w500,
                    //       //           fontFamily: "PushPenny",
                    //       //           color: primaryColor),
                    //       //     ),
                    //       //     const SizedBox(width: 10,),
                    //       //     // Container(
                    //       //     //   width: 70,
                    //       //     //   height: 50,
                    //       //     //   decoration: BoxDecoration(
                    //       //     //       color: Colors.white,
                    //       //     //       borderRadius:  BorderRadius.circular(8),
                    //       //     //       border: Border.all(color: Colors.grey)
                    //       //     //   ),
                    //       //     //   child: Padding(
                    //       //     //     padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    //       //     //     child: Center(
                    //       //     //       child: Column(
                    //       //     //         crossAxisAlignment: CrossAxisAlignment.center,
                    //       //     //         mainAxisAlignment: MainAxisAlignment.center,
                    //       //     //         children: [
                    //       //     //           DropdownButtonHideUnderline(
                    //       //     //             child: DropdownButton(
                    //       //     //               isExpanded: true,
                    //       //     //               borderRadius: BorderRadius.circular(10),
                    //       //     //               dropdownColor: Colors.white,
                    //       //     //               elevation: 1,
                    //       //     //               // Initial Value
                    //       //     //               value: dropdownvalue,
                    //       //     //               selectedItemBuilder: (BuildContext context) {
                    //       //     //                 return currency.map((String items) {
                    //       //     //                   return Center(
                    //       //     //                       child: RichText(
                    //       //     //                         text: TextSpan(
                    //       //     //                           text: dropdownvalue,
                    //       //     //                           style:  TextStyle(
                    //       //     //                               fontWeight: FontWeight.w400,
                    //       //     //                               fontSize: 15,
                    //       //     //                               color: primaryColor),
                    //       //     //                         ),
                    //       //     //                       )
                    //       //     //                     //             Text(
                    //       //     //                     //   dropdownvalue,
                    //       //     //                     //   style: const TextStyle( fontWeight: FontWeight.w500,
                    //       //     //                     //                 fontSize: 16,
                    //       //     //                     //                 color: Color(0xff0D2C65) ),
                    //       //     //                     // ),
                    //       //     //                   );
                    //       //     //                 }).toList();
                    //       //     //               },
                    //       //     //               // Down Arrow Icon
                    //       //     //               icon:  Icon(
                    //       //     //                 Icons.keyboard_arrow_down,
                    //       //     //                 color: primaryColor,
                    //       //     //               ),
                    //       //     //
                    //       //     //               // Array list of items
                    //       //     //               items: currency.map((String items) {
                    //       //     //                 return DropdownMenuItem(
                    //       //     //                   value: items,
                    //       //     //                   child: Container(
                    //       //     //                     // width:double.infinity,
                    //       //     //                     alignment: Alignment.centerLeft,
                    //       //     //                     padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                    //       //     //                     decoration: const BoxDecoration(
                    //       //     //                         border: Border(
                    //       //     //                             bottom: BorderSide(
                    //       //     //                                 color: Color(0xffDDDDDD), width: 0.3))),
                    //       //     //                     child: Text(
                    //       //     //                       items,
                    //       //     //                       style: const TextStyle(
                    //       //     //                           fontWeight: FontWeight.w400,
                    //       //     //                           fontSize: 14,
                    //       //     //                           color: Colors.black),
                    //       //     //                     ),
                    //       //     //                   ),
                    //       //     //                 );
                    //       //     //               }).toList(),
                    //       //     //               // After selecting the desired option,it will
                    //       //     //               // change button value to selected value
                    //       //     //               onChanged: (String? newValue) {
                    //       //     //                 setState(() {
                    //       //     //                   dropdownvalue = newValue!;
                    //       //     //                   isLoading = true;
                    //       //     //                   Provider.of<UsersProvider>(context, listen: false).getAllWallets(context,dropdownvalue);
                    //       //     //                 });
                    //       //     //                 Future.delayed( Duration(seconds:double.tryParse(dropdownvalue)! > 500 ? 10 : 5)).then((value) {
                    //       //     //                   setState(() {
                    //       //     //                     isLoading = false;
                    //       //     //                   });
                    //       //     //                 }
                    //       //     //                 );
                    //       //     //               },
                    //       //     //             ),
                    //       //     //           ),
                    //       //     //         ],
                    //       //     //       ),
                    //       //     //     ),
                    //       //     //   ),
                    //       //     // )
                    //       //
                    //       //   ],
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                    // isLoading ?  Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children:  [
                    //     CupertinoActivityIndicator(
                    //       color: primaryColor,
                    //       animating: true,
                    //       radius: 20,
                    //     )
                    //   ],
                    // ):
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: const Color(0XFFEAEBF1),
                          borderRadius: BorderRadius.circular(12)),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: SingleChildScrollView(
                        // scrollDirection: Axis.horizontal,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              cardColor: Colors.transparent,
                              dividerColor: Colors.grey.withOpacity(0.3),
                              shadowColor: Colors.transparent
                          ),
                          child: PaginatedDataTable(
                              dataRowHeight: 60,
                              showCheckboxColumn: false,
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
                              source: AllWalletTableRow(allWallets: widget.allWallets, contexts: context,
                                  onTapWalletComment: () async{
                                    Map<String, dynamic> response =
                                      await UserService()
                                          .getWalletComments(
                                          context: context);
                                      WalletCommentModel commentModel =
                                      WalletCommentModel.fromJson(
                                          response);
                                      // print("${commentModel.data![0].details} wallet");
                                      // print("${commentModel.data!.map((e) => e.toJson())} all comments");
                                      setState(() {
                                        comments = commentModel.data ?? [];
                                      });
                                      viewCommentAlertBox(
                                          context: context,
                                          comment: comments);
                                  }, controller: _controller,
                              )
                              // widget.allWallets
                              //     .map((e) => DataRow(
                              //     cells: [
                              //       DataCell(
                              //         Text(e.createdAt ?? "",
                              //             style: TextStyle(
                              //                 color: primaryColor,
                              //                 fontFamily: 'PushPenny',
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 14)),
                              //       ),
                              //       DataCell(
                              //         Text(e.user ?? "",
                              //             style: TextStyle(
                              //                 color: primaryColor,
                              //                 fontFamily: 'PushPenny',
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 14)),
                              //       ),
                              //       DataCell(
                              //         Text(e.currency ?? "",
                              //             style: TextStyle(
                              //                 color: primaryColor,
                              //                 fontFamily: 'PushPenny',
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 14)),
                              //       ),
                              //       DataCell(
                              //         Text(e.provider ?? "",
                              //             style: TextStyle(
                              //                 color: primaryColor,
                              //                 fontFamily: 'PushPenny',
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 14)),
                              //       ),
                              //       DataCell(
                              //         Text("${e.availableBalance ?? ""}",
                              //             style: TextStyle(
                              //                 color: primaryColor,
                              //                 fontFamily: 'PushPenny',
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 14)),
                              //       ),
                              //       DataCell(
                              //         Text("${e.ledgerBalance ?? ""}",
                              //             style: TextStyle(
                              //                 color: primaryColor,
                              //                 fontFamily: 'PushPenny',
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 14)),
                              //       ),
                              //       DataCell(
                              //         Text("${e.tier?.name ?? ""}",
                              //             style: TextStyle(
                              //                 color: primaryColor,
                              //                 fontFamily: 'PushPenny',
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 14)),
                              //       ),
                              //       DataCell(
                              //         Text( e.status ?? "",
                              //             style: TextStyle(
                              //                 color: e.status == "PENDING"
                              //                     ? warning
                              //                     : e.status == "ACTIVE"
                              //                     ? kyshiGreen
                              //                     : kyshiRed,
                              //                 fontFamily: 'PushPenny',
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 14)),
                              //       ),
                              //       DataCell(InkWell(
                              //         onTap: () async {
                              //           Map<String, dynamic> response =
                              //           await UserService()
                              //               .getWalletComments(
                              //               context: context);
                              //           WalletCommentModel commentModel =
                              //           WalletCommentModel.fromJson(
                              //               response);
                              //           // print("${commentModel.data![0].details} wallet");
                              //           // print("${commentModel.data!.map((e) => e.toJson())} all comments");
                              //           setState(() {
                              //             comments = commentModel.data ?? [];
                              //           });
                              //           viewCommentAlertBox(
                              //               context: context,
                              //               comment: comments);
                              //         },
                              //         child: OfferButton(
                              //           isBorder: false,
                              //           text: 'VIEW COMMENT',
                              //           comment: true,
                              //           commentBackground: false,
                              //           color: const Color(0XFF6D48FF),
                              //         ),
                              //       )),
                              //       DataCell(
                              //         InkWell(
                              //             onTap: () {
                              //               userProvider.selectWalletId(e.id ?? "");
                              //               editWalletStatusDialog(
                              //                 context,
                              //                 walletType: "NGN",
                              //                 title: 'Add comment', ontap:  () async {
                              //                 ContentType contentTypeSuccess = ContentType.success;
                              //                 ContentType contentTypeFail = ContentType.failure;
                              //                 final id = Provider.of<UsersProvider>(context, listen: false).currentSelectedWalletId;
                              //                 print("$id ${_controller.text} changing wallet");
                              //                 // updateStatus(
                              //                 //     context: context,
                              //                 //     id: id,
                              //                 //     text: _controller.text,
                              //                 //     dropDown: dropDownValue);
                              //                 Map<String, dynamic> response = await UserService().updateWalletStatus(data: {
                              //                   "wallet_id": id,
                              //                   "details": _controller.text,
                              //                   // controller.text,
                              //                   "status": dropDownValue.toUpperCase()
                              //                 }, context: context);
                              //                 if(mounted){
                              //                   if (response["status"] == "True") {
                              //                     Provider.of<UsersProvider>(context, listen: false).getAllWallets(context, "50");
                              //                     snackBar(context, contentTypeSuccess,
                              //                         title: "Awesome!!", message: ' Request sent Successfully ');
                              //                   } else {
                              //                     snackBar(
                              //                       context,
                              //                       contentTypeFail,
                              //                       title: 'OoPs!!',
                              //                       message: 'Error updating wallet status',
                              //                     );
                              //                   }
                              //                   Navigator.pop(context);
                              //                 }
                              //                 state(() {
                              //                   widget.allWallets = Provider.of<UsersProvider>(context, listen: false).allWallets ?? [];
                              //                   walletStatus = e.status ??"";
                              //                   walletId = e.id ?? "";
                              //                 });
                              //                 // Future.delayed(Duration (seconds: 6)).then((value) =>
                              //                 //     print("${allWallets!.map((e) => e.status)} ALL WALLETSSSSS")
                              //                 // );
                              //               }, controller: _controller,
                              //               );
                              //             },
                              //             child: OfferButton(
                              //               isBorder: false,
                              //               text: 'MANAGE WALLET',
                              //               comment: false,
                              //             )),
                              //       ),
                              //     ]))
                              //     .toList()
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
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
  // manageWalletStatusAlertBox(BuildContext context){
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context){
  //         return   AlertDialog(
  //           insetPadding: EdgeInsets.all(20),
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(48))),
  //           content: Container(
  //               padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
  //               height: 250,
  //               width: 529,
  //               child:  Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text("Manage wallet status",style: TextStyle(
  //                           color: primaryColor,
  //                           fontWeight: FontWeight.w700,
  //                           fontSize: 28,
  //                           fontFamily: 'PushPenny'
  //                       ),),
  //                       InkWell(
  //                           onTap: (){
  //                             Navigator.of(context).pop();
  //                           },
  //                           child: Image.asset('assets/images/cancel.png',width: 40, height: 40,))
  //                     ],
  //                   ),
  //                   SizedBox(height: 30,),
  //                   Text("Overrides the status of the user's KYC for the wallet.\nWill"
  //                       "all be set to PASSED, trigger the creation of the \nledger on"
  //                       "RB/VFD/Evolve and Send out a notification \ninforming the user"
  //                       "that their wallet is now ready for use",
  //                     style: TextStyle(
  //                         color: kyshiGreyishBlue,
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 18,
  //                         fontFamily: 'PushPenny'
  //                     ),),
  //                   Row(
  //                     children: [
  //                       Text("Manage wallet state",style: TextStyle(
  //                           color: kyshiGreyishBlue,
  //                           fontWeight: FontWeight.w400,
  //                           fontSize: 18,
  //                           fontFamily: 'PushPenny'
  //                       ),),
  //                       Transform.scale(
  //                         scale: 0.8,
  //                         child: CupertinoSwitch(
  //                             activeColor: kyshiGreen,
  //                             trackColor: Colors.grey,
  //                             thumbColor:manageWallet ? primaryColor: Colors.white,
  //                             value: manageWallet, onChanged: (value){
  //                           setState(() {
  //                             manageWallet = value;
  //                           });
  //                         }),
  //                       ),
  //                     ],
  //                   )
  //                   // "Overrides the status of the user's KYC for the wallet.Will" all be set to PASSED, trigger the creation of the ledger on RB/VFD/Evolve and Send out a notification informing the user that their wallet is now ready for use."
  //                 ],
  //               )),
  //
  //         );}
  //   );
  // }

}

class AllWalletTableRow extends DataTableSource {
  // Function(bool?)? selectChanged;
  // Function ()? onTap;
  BuildContext contexts;
  List<Wallet>? allWallets;
  // Function ()? onTapViewWallet;
  Function ()? onTapWalletComment;
  TextEditingController controller;
  AllWalletTableRow({Key? key, required this.allWallets,required this.contexts,required this.onTapWalletComment,required this.controller}) : super();
  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(contexts, listen: false);
  // late UsersProvider usersProvider;
  @override
  DataRow? getRow(int index) {
    final pageProvider = Provider.of<PageViewProvider>(contexts);
    return DataRow.byIndex(
        index: index,
        onSelectChanged: (value){
          if(value!){
            userProvider.selectWalletId(allWallets![index].id ?? "");
            // print("${user![index].id } ID FROM USERINDEX");
            // userProvider.selectUser(user![index].id ??"");
            // userProvider.setCurrentUser("${user![index].firstName} " " ${user![index].firstName}");
            // userProvider.getConnectSerivices(contexts);
            // userProvider.getCards(contexts);
            // userProvider.getTransactions(contexts);
            // Provider.of<TransactionSummaryProvider>(contexts, listen: false)
            //     .getAllTransactionSummary(contexts, user![index].id ??"");
            // pageProvider.gotoPage(PAGES.home);
          }
        },
        cells: [
          DataCell(
            Text( allWallets![index].createdAt ?? "",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ),
          DataCell(
            Text(allWallets![index].user ?? "",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ),
          DataCell(
            Text(allWallets![index].currency ?? "",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ),
          DataCell(
            Text(allWallets![index].provider ?? "",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ),
          DataCell(
            Text("${allWallets![index].availableBalance ?? ""}",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ),
          DataCell(
            Text("${allWallets![index].ledgerBalance ?? ""}",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ),
          DataCell(
            Text("${allWallets![index].tier!.name ?? ""}",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ),
          DataCell(
            Text( allWallets![index].status ?? "",
                style: TextStyle(
                    color: allWallets![index].status == "PENDING"
                        ? warning
                        : allWallets![index].status== "ACTIVE"
                        ? kyshiGreen
                        : kyshiRed,
                    fontFamily: 'PushPenny',
                    fontWeight: FontWeight.w400,
                    fontSize: 14)),
          ),
          DataCell(InkWell(
            onTap: onTapWalletComment,
            //     () async {
            //   Map<String, dynamic> response =
            //   await UserService()
            //       .getWalletComments(
            //       context: context);
            //   WalletCommentModel commentModel =
            //   WalletCommentModel.fromJson(
            //       response);
            //   // print("${commentModel.data![0].details} wallet");
            //   // print("${commentModel.data!.map((e) => e.toJson())} all comments");
            //   setState(() {
            //     comments = commentModel.data ?? [];
            //   });
            //   viewCommentAlertBox(
            //       context: context,
            //       comment: comments);
            // },
            child: OfferButton(
              isBorder: false,
              text: 'VIEW COMMENT',
              comment: true,
              commentBackground: false,
              color: const Color(0XFF6D48FF),
            ),
          )),
          DataCell(
            InkWell(
                onTap: ()async{
                  editWalletStatusDialog(
                      contexts,
                      walletType: "NGN",
                      title: 'Add comment', ontap:  () async {
                    userProvider.selectWalletId(allWallets![index].id ?? "");
                    ContentType contentTypeSuccess = ContentType.success;
                    ContentType contentTypeFail = ContentType.failure;
                    final id = Provider.of<UsersProvider>(contexts, listen: false).currentSelectedWalletId;
                    // print("$id ${_controller.text} changing wallet");
                    // updateStatus(
                    //     context: context,
                    //     id: id,
                    //     text: _controller.text,
                    //     dropDown: dropDownValue);
                    Map<String, dynamic> response = await UserService().updateWalletStatus(data: {
                      "wallet_id": id,
                      "details": controller.text,
                      // controller.text,
                      "status": dropDownValue.toUpperCase()
                    }, context: contexts);
                    // if(mounted){
                      if (response["status"] == "True") {
                        Provider.of<UsersProvider>(contexts, listen: false).getAllWallets(contexts, "50");
                        snackBar(contexts, contentTypeSuccess,
                            title: "Awesome!!", message: ' Request sent Successfully ');
                      } else {
                        snackBar(
                          contexts,
                          contentTypeFail,
                          title: 'OoPs!!',
                          message: 'Error updating wallet status',
                        );
                      }
                      Navigator.pop(contexts);
                    // }
                    // state(() {
                    //   widget.allWallets = Provider.of<UsersProvider>(context, listen: false).allWallets ?? [];
                    //   walletStatus = e.status ??"";
                    //   walletId = e.id ?? "";
                    // });
                    // Future.delayed(Duration (seconds: 6)).then((value) =>
                    //     print("${allWallets!.map((e) => e.status)} ALL WALLETSSSSS")
                    // );
                  }, controller: controller);
                },
                //     () {
                //   userProvider.selectWalletId(e.id ?? "");
                //   editWalletStatusDialog(
                //     context,
                //     walletType: "NGN",
                //     title: 'Add comment', ontap:  () async {
                //     ContentType contentTypeSuccess = ContentType.success;
                //     ContentType contentTypeFail = ContentType.failure;
                //     final id = Provider.of<UsersProvider>(context, listen: false).currentSelectedWalletId;
                //     print("$id ${_controller.text} changing wallet");
                //     // updateStatus(
                //     //     context: context,
                //     //     id: id,
                //     //     text: _controller.text,
                //     //     dropDown: dropDownValue);
                //     Map<String, dynamic> response = await UserService().updateWalletStatus(data: {
                //       "wallet_id": id,
                //       "details": _controller.text,
                //       // controller.text,
                //       "status": dropDownValue.toUpperCase()
                //     }, context: context);
                //     if(mounted){
                //       if (response["status"] == "True") {
                //         Provider.of<UsersProvider>(context, listen: false).getAllWallets(context, "50");
                //         snackBar(context, contentTypeSuccess,
                //             title: "Awesome!!", message: ' Request sent Successfully ');
                //       } else {
                //         snackBar(
                //           context,
                //           contentTypeFail,
                //           title: 'OoPs!!',
                //           message: 'Error updating wallet status',
                //         );
                //       }
                //       Navigator.pop(context);
                //     }
                //     state(() {
                //       widget.allWallets = Provider.of<UsersProvider>(context, listen: false).allWallets ?? [];
                //       walletStatus = e.status ??"";
                //       walletId = e.id ?? "";
                //     });
                //     // Future.delayed(Duration (seconds: 6)).then((value) =>
                //     //     print("${allWallets!.map((e) => e.status)} ALL WALLETSSSSS")
                //     // );
                //   }, controller: _controller,
                //   );
                // },
                child: OfferButton(
                  isBorder: false,
                  text: 'MANAGE WALLET',
                  comment: false,
                )),
          ),
          // DataCell(
          //   Text(user![index].firstName ?? ""),
          // ),
          // DataCell(
          //   Text(user![index].lastName ?? ""),
          // ),
          // DataCell(
          //   Text(user![index].middleName ?? ""),
          // ),
          // DataCell(
          //   Text(user![index].email ?? ""),
          // ),
          // DataCell(
          //   Text(user![index].phoneNumber ?? ""),
          // ),
          // DataCell(
          //     Text(user![index].dob?? "",style: TextStyle(
          //         color: primaryColor,
          //         fontFamily: 'PushPenny',
          //         fontWeight: FontWeight.w400,
          //         fontSize: 14
          //     ),)
          // ),
          // DataCell(
          //     Text(user![index].bvn ?? "",style: TextStyle(
          //         color: primaryColor,
          //         fontFamily: 'PushPenny',
          //         fontWeight: FontWeight.w400,
          //         fontSize: 14
          //     ))
          // ),
          // DataCell(
          //   Text(user![index].countryOfResidence ?? "",style: TextStyle(
          //       color: primaryColor,
          //       fontFamily: 'PushPenny',
          //       fontWeight: FontWeight.w400,
          //       fontSize: 14
          //   )),
          // ),
          // DataCell(
          //     Text(user![index].nationality1 ?? "",style: TextStyle(
          //         color: primaryColor,
          //         fontFamily: 'PushPenny',
          //         fontWeight: FontWeight.w400,
          //         fontSize: 14
          //     ))
          // ),
          // DataCell(
          //   Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       SvgPicture.asset(user![index].emailVerified! == true ?mailUn :mailV),
          //       SvgPicture.asset(user![index].phoneVerified == true?callUn :callV),
          //       SvgPicture.asset(user![index].bvnVerified == true ? shieldUn :shieldV),
          //       SvgPicture.asset(giftUn)
          //     ],
          //   ),
          // ),
          // DataCell(
          //     InkWell(
          //         onTap: () {
          //           // print("${user![index].id } bbbbbbbbbbb");
          //           userProvider.selectUser(user![index].id ??"");
          //           userProvider.setCurrentUser("${user![index].firstName} " " ${user![index].firstName}");
          //           userProvider.getConnectSerivices(contexts);
          //           userProvider.getCards(contexts);
          //           userProvider.getTransactions(contexts);
          //           Provider.of<TransactionSummaryProvider>(contexts, listen: false)
          //               .getAllTransactionSummary(contexts, user![index].id ??"");
          //           pageProvider.gotoPage(PAGES.home);
          //           //getAllTransactionSummary
          //         },
          //         child: Container(
          //           height: 20,
          //           width: 60,
          //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          //           decoration: BoxDecoration(
          //               color: primaryColor,
          //               borderRadius:
          //               BorderRadius.circular(24)),
          //           child: const Text(
          //             "View",
          //             style: TextStyle(
          //                 fontFamily: "PushPenny",
          //                 fontWeight:
          //                 FontWeight.w400,
          //                 color: Colors.white,
          //                 fontSize: 10),
          //             textAlign: TextAlign.center,
          //           ),
          //         ))
          // ),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => allWallets!.length;

  @override
  int get selectedRowCount => allWallets!.length;
}
