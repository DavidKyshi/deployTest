import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:provider/provider.dart';

import '../../customWidget/searchField.dart';
import '../../models/users.dart';
import '../../providers/users.dart';

class UserAccountIndex extends StatefulWidget {
  const UserAccountIndex({Key? key}) : super(key: key);

  @override
  State<UserAccountIndex> createState() => _UserAccountIndexState();
}

class _UserAccountIndexState extends State<UserAccountIndex> {
  User? user;
  final List<String> names = [
    "Mohammed",
    "Rab",
    "Gbemi",
    "david",
    "Tobiloba",
    "George",
    "Bright",
    "Mohammed",
    "Rab",
    "Gbemi",
    "david",
    "Tobiloba",
    "George",
    "Bright",
    "Mohammed",
    "Rab",
    "Gbemi",
    "david",
    "Tobiloba",
    "George",
    "Bright"
  ];
  final List<Widget> action = [
    Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(24)),
          child: const Text(
            "View",
            style: TextStyle(
                fontFamily: "PushPenny",
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 10),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    )
  ];
  final List<int> ages = [1, 2, 3, 4, 5];
  final List<IconData> icons = [
    Icons.mail,
    Icons.phone,
    Icons.wallet_giftcard_rounded,
    Icons.check_circle_rounded
  ];
  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);
  ScrollController? controller;

  @override
  void initState() {
    // TODO: implement initState
    // user = Provider.of<UsersProvider>(context, listen: false).users;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageViewProvider>(context);
    // user = userProvider.getUserById();
    // print("${userProvider.users} ALL USERS");
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
              children: [
                const SearchField(),
                const SizedBox(
                  height: 10,
                ),
                // if (user == null) Text("User not found"),
                // if (user != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0XFFEAEBF1),
                      borderRadius: BorderRadius.circular(12)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          dataRowHeight: 60,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text("First Name"),
                              // tooltip: "To Display name"
                            ),
                            DataColumn(label: Text("Last Name")),
                            DataColumn(label: Text("Middle Name")),
                            DataColumn(label: Text("Email  Address")),
                            DataColumn(label: Text("Phone Number")),
                            DataColumn(label: Text("Date of Birth")),
                            DataColumn(label: Text("BVN")),
                            DataColumn(
                              label: Text("Residence"),
                              // tooltip: "To Display name"
                            ),
                            DataColumn(label: Text("Nationality")),
                            DataColumn(label: Text("Status")),
                            DataColumn(label: Text("Action")),
                            // DataColumn(label: Text("Nationality")),
                            // DataColumn(label: Text("ID")),
                            // DataColumn(label: Text("Ledger")),
                            // DataColumn(label: Text("Status")),
                          ],
                          rows: userProvider.users
                              .map(
                                (user) => DataRow(
                                  cells: [
                                    DataCell(
                                      Text(user.firstName ?? ""),
                                    ),
                                    DataCell(
                                      Text(user.lastName ?? ""),
                                    ),
                                    DataCell(
                                      Text(user.middleName ?? ""),
                                    ),
                                    DataCell(
                                      Text(user.email ?? ""),
                                    ),
                                    DataCell(
                                      Text(user.phoneNumber ?? ""),
                                    ),
                                    DataCell(Text(
                                      user.dob ?? "",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    )),
                                    DataCell(Text(user.bvn ?? "",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14))),
                                    DataCell(
                                      Text(user.countryOfResidence ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    DataCell(Text(user.nationality1 ?? "",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14))),
                                    DataCell(
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            icons[0],
                                            size: 18,
                                            color: const Color(0XFF23CE6B)
                                                .withOpacity(0.4),
                                          ),
                                          Icon(
                                            icons[1],
                                            size: 18,
                                            color: const Color(0XFF23CE6B)
                                                .withOpacity(0.4),
                                          ),
                                          Icon(
                                            icons[2],
                                            size: 18,
                                            color: const Color(0XFFFF5C5C)
                                                .withOpacity(0.4),
                                          ),
                                          Icon(
                                            icons[3],
                                            size: 18,
                                            color: const Color(0XFF23CE6B)
                                                .withOpacity(0.4),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DataCell(InkWell(
                                        onTap: () {
                                          userProvider.selectUser(user.id!);
                                          pageProvider.gotoPage(PAGES.home);
                                          userProvider.getConnectSerivices();
                                          userProvider.getTransactions();
                                          userProvider.getAllWallets();
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 60,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          child: const Text(
                                            "View",
                                            style: TextStyle(
                                                fontFamily: "PushPenny",
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ))),
                                    // DataCell(
                                    //     Text(user.operation ?? " ")
                                    // ),
                                    // DataCell(
                                    //     Text(user.id)
                                    // ),
                                    // DataCell(
                                    //     Text(user.ledger)
                                    // ),
                                    // DataCell(
                                    //     Text(user.status)
                                    // ),
                                  ],
                                ),
                              )
                              .toList()),
                    ),
                  ),
                )
                // ListView(
                //   // scrollDirection: Axis.horizontal,
                //   children: [
                //     /// Header Row
                //
                //     Row(
                //      // crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: const [
                //        UserAccountTableRow(title: 'First Name',),
                //         UserAccountTableRow(title: 'Last Name',),
                //        UserAccountTableRow(title: 'Middle Name',),
                //         UserAccountTableRow(title: 'Email  Address',),
                //         UserAccountTableRow(title: 'Phone Number',),
                //         UserAccountTableRow(title: 'Date of Birth',),
                //         UserAccountTableRow(title: 'BVN',),
                //         UserAccountTableRow(title: 'Residence',),
                //         UserAccountTableRow(title: 'Nationality',),
                //         UserAccountTableRow(title: 'Status',),
                //         UserAccountTableRow(title: 'Action',),
                //       ],
                //     ),
                //     ...userProvider.users
                //         .map((user) => Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 UserAccountTableCell(
                //
                //                   name: Container(
                //                     color: Colors.amber,
                //                     // height: 500,
                //                      width: 78,
                //                     child: Text(user.firstName??"ddddd"),
                //                   ),
                //                 ),
                //                 // const SizedBox(
                //                 //   width: 10,
                //                 // ),
                //                 UserAccountTableCell(
                //
                //                   name: SizedBox(
                //                     // height: 500,
                //                      width: 78,
                //                     child: Text(user.lastName??"No lastname"),
                //                   ),
                //                 ),
                //                 // const SizedBox(
                //                 //   width: 10,
                //                 // ),
                //                 UserAccountTableCell(
                //                  // title: "Middle Name",
                //                   name: SizedBox(
                //                     // height: 500,
                //                      width: 78,
                //                     child: Text(user.middleName??"No Middlename"),
                //                   ),
                //                 ),
                //                 // const SizedBox(
                //                 //   width: 10,
                //                 // ),
                //                 UserAccountTableCell(
                //                   name: SizedBox(
                //                     // height: 500,
                //                    //  width: 158,
                //                     child: Text(user.email??""),
                //                   ),
                //                 ),
                //                 UserAccountTableCell(
                //
                //                   name: SizedBox(
                //                     // height: 500,
                //                    //  width: 100,
                //                     child: Text(user.phoneNumber??""),
                //                   ),
                //                 ),
                //                 UserAccountTableCell(
                //                   name: SizedBox(
                //                     // height: 500,
                //                     // width: 73,
                //                     child: Text( user.dob??""),
                //                   ),
                //                 ),
                //                 UserAccountTableCell(
                //                   name: SizedBox(
                //                     // height: 500,
                //                      //width: 83,
                //                     child: Text(user.bvn??""),
                //                   ),
                //                 ),
                //                 UserAccountTableCell(
                //                   name: SizedBox(
                //                     // height: 500,
                //                      width: 83,
                //                     child: Text(user.countryOfResidence??""),
                //                   ),
                //                 ),
                //                 UserAccountTableCell(
                //                   name: SizedBox(
                //                     // height: 500,
                //                      width: 83,
                //                     child: Text(user.nationality1??""),
                //                   ),
                //                 ),
                //                 SizedBox(
                //    // height: 500,
                //     width: 100,
                //     child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //          mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Icon(icons[0],size: 18,color: const Color(0XFF23CE6B).withOpacity(0.4),),
                //               Icon(icons[1],size: 18,color: const Color(0XFF23CE6B).withOpacity(0.4),),
                //               Icon(icons[2],size: 18,color: const Color(0XFFFF5C5C).withOpacity(0.4),),
                //               Icon(icons[3],size: 18,color: const Color(0XFF23CE6B).withOpacity(0.4),),
                //             ],
                //           ),
                //   ),
                //                 UserAccountTableCell(
                //                 //  title: "Action",
                //                   name: SizedBox(
                //
                //                     child: InkWell(
                //                         onTap: () {
                //                           userProvider.selectUser(user.id!);
                //                           pageProvider.gotoPage(PAGES.home);
                //                         },
                //                         child: Container(
                //                           height: 20,
                //                     width: 60,
                //                           padding: const EdgeInsets
                //                           .symmetric(
                //                               horizontal: 15,
                //                               vertical: 2),
                //                           decoration: BoxDecoration(
                //                               color: primaryColor,
                //                               borderRadius:
                //                                   BorderRadius.circular(
                //                                       24)),
                //                           child: const Text(
                //                             "View",
                //                             style: TextStyle(
                //                                 fontFamily: "PushPenny",
                //                                 fontWeight:
                //                                     FontWeight.w400,
                //                                 color: Colors.white,
                //                                 fontSize: 10),
                //                             textAlign: TextAlign.center,
                //                           ),
                //                         )),
                //                   ),
                //                 )
                //               ],
                //             ))
                //         .toList()
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}
