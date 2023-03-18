import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/userService/userService.dart';
import 'package:kyshi_operations_dashboard/widgets/create_an_offer_screen_widget.dart';
import 'package:provider/provider.dart';

import '../../customWidget/searchField.dart';
import '../../models/users.dart';
import '../../providers/transaction_summary_provider.dart';
import '../../providers/users.dart';

class _FilterRanger {
  final String title;
  final int daysAgo;

  const _FilterRanger(this.title, this.daysAgo);
}

const List<_FilterRanger> lastDays = [
  _FilterRanger('Today', 0),
  _FilterRanger('Yesterday', 1),
  _FilterRanger('Last 7 days', 6),
  _FilterRanger('Last 30 days', 29),
  _FilterRanger('Last 1826 days', 1825),
];

class UserAccountIndex extends StatefulWidget {
  const UserAccountIndex({Key? key}) : super(key: key);

  @override
  State<UserAccountIndex> createState() => _UserAccountIndexState();
}

class _UserAccountIndexState extends State<UserAccountIndex> {
  List<User>? user = [];

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
  final TextEditingController _textEditingController = TextEditingController();
  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);

  ScrollController? controller;
  final _debouncer = Debouncer();

  @override
  void initState() {
    // TODO: implement initState
    user = Provider.of<UsersProvider>(context, listen: false).users;
    super.initState();
  }

  String dropdownvalue2 = '100';
  var currency = ['100', '300', '500', '700', "1000"];
  bool isLoading = false;
  _FilterRanger dropdownvalue = lastDays[2];

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageViewProvider>(context);
    // final getuser = userProvider.getUserById();
    // print("${userProvider.users} ALL USERS");
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 97.55,
                  color: Color(0xffF9F9F9),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 164,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffDDDDDD),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Column(
                              children: [
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<_FilterRanger>(
                                    isExpanded: true,
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Colors.white,
                                    elevation: 1,
                                    // Initial Value
                                    value: dropdownvalue,
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return lastDays.map((items) {
                                        return Center(
                                          child: Text(
                                            dropdownvalue.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Color(0xff0D2C65)),
                                          ),
                                        );
                                      }).toList();
                                    },
                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: lastDays.map((items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Container(
                                          // width:double.infinity,
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8.0, 0, 6.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Color(0xffDDDDDD),
                                                      width: 0.5))),
                                          child: Text(
                                            items.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                      Provider.of<UsersProvider>(context,
                                              listen: false)
                                          .getDaysAgo(
                                              context: context,
                                              daysAgo:
                                                  newValue?.daysAgo.toString());
                                      List<User> result =
                                          Provider.of<UsersProvider>(context,
                                                  listen: false)
                                              .users;
                                      user = result
                                          .where((element) => element.createdAt!
                                              .toLowerCase()
                                              .contains(newValue!.daysAgo
                                                  .toString()
                                                  .toLowerCase()))
                                          .toList();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),

/////////////////////////////////////////////////////////
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User Accounts',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                fontFamily: "PushPenny",
                                color: primaryColor),
                          ),
                          Row(
                            children: [
                              Text(
                                "Show entries",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "PushPenny",
                                    color: primaryColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 70,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            dropdownColor: Colors.white,
                                            elevation: 1,
                                            // Initial Value
                                            value: dropdownvalue2,
                                            selectedItemBuilder:
                                                (BuildContext context) {
                                              return currency
                                                  .map((String items) {
                                                return Center(
                                                    child: RichText(
                                                  text: TextSpan(
                                                    text: dropdownvalue2,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        color: primaryColor),
                                                  ),
                                                )
                                                    //             Text(
                                                    //   dropdownvalue,
                                                    //   style: const TextStyle( fontWeight: FontWeight.w500,
                                                    //                 fontSize: 16,
                                                    //                 color: Color(0xff0D2C65) ),
                                                    // ),
                                                    );
                                              }).toList();
                                            },
                                            // Down Arrow Icon
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: primaryColor,
                                            ),

                                            // Array list of items
                                            items: currency.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Container(
                                                  // width:double.infinity,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 8.0, 0, 6.0),
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Color(
                                                                  0xffDDDDDD),
                                                              width: 0.3))),
                                                  child: Text(
                                                    items,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            // After selecting the desired option,it will
                                            // change button value to selected value
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalue2 = newValue!;
                                                isLoading = true;
                                                Provider.of<UsersProvider>(
                                                        context,
                                                        listen: false)
                                                    .getUsers(
                                                        context: context,
                                                        entrySize:
                                                            dropdownvalue2);
                                              });
                                              Future.delayed(Duration(
                                                      seconds: double.tryParse(
                                                                  dropdownvalue2)! >
                                                              500
                                                          ? 15
                                                          : 10))
                                                  .then((value) {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            statusIcons("Email Status", mail),
                            const SizedBox(
                              width: 14,
                            ),
                            statusIcons("Phone number Status", call),
                            const SizedBox(
                              width: 14,
                            ),
                            statusIcons("Identity Status", shield),
                            const SizedBox(
                              width: 14,
                            ),
                            statusIcons("Free Swap Status ", gift),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchField(
                      exportCvsTap: () {
                        final service =
                            UserService().exportCsv(context: context);
                      },
                      controller: _textEditingController,
                      hintText: "Search users....",
                      onChanged: (value) {
                        setState(() {
                          isLoading = true;
                        });
                        _debouncer.run(() {
                          setState(() {
                            Provider.of<UsersProvider>(context, listen: false)
                                .getUsers(context: context, entrySize: value);
                            List<User> result = Provider.of<UsersProvider>(
                                    context,
                                    listen: false)
                                .users;
                            user = result
                                .where((element) => element.email!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                            isLoading = false;
                            // print("$user SEARCHED USERS");
                          });
                        });
                        // if(value.length > 4){
                        //   setState(() {
                        //     isLoading = true;
                        //   });
                        //   print(value);
                        //   Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, entrySize: value);
                        //   Future.delayed(const Duration(seconds: 5)).then((value) {
                        //     setState(() {
                        //       isLoading = false;
                        //       user =Provider.of<UsersProvider>(context, listen: false).users;
                        //     });
                        //   });
                        // }
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: isLoading ? 30 : 10,
                    ),
                    // if (getuser == null) Text("User not found"),
                    // if (getuser != null)
                    isLoading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CupertinoActivityIndicator(
                                color: primaryColor,
                                animating: true,
                                radius: 20,
                              )
                            ],
                          )
                        : user!.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("First Name",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("Last Name",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("Middle Name",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("Email  Address",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("Phone Number",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("Date of Birth",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("BVN",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                      Text("Residence",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                  SvgPicture.asset(empty),
                                  Text(
                                    "We currently don’t have users on the \nKyshi database,  it will appear here \nwhen we do",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'PushPenny',
                                    ),
                                  )
                                ],
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 25),
                                height: 600,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: const Color(0XFFEAEBF1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
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
                                            DataColumn(
                                                label: Text("Last Name")),
                                            DataColumn(
                                                label: Text("Middle Name")),
                                            DataColumn(
                                                label: Text("Email  Address")),
                                            DataColumn(
                                                label: Text("Phone Number")),
                                            DataColumn(
                                                label: Text("Date of Birth")),
                                            DataColumn(label: Text("BVN")),
                                            DataColumn(
                                              label: Text("Residence"),
                                              // tooltip: "To Display name"
                                            ),
                                            DataColumn(
                                                label: Text("Nationality")),
                                            DataColumn(label: Text("Status")),
                                            DataColumn(label: Text("Action")),
                                          ],
                                          rows: user!
                                              .map(
                                                (user) => DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                          user.firstName ?? ""),
                                                    ),
                                                    DataCell(
                                                      Text(user.lastName ?? ""),
                                                    ),
                                                    DataCell(
                                                      Text(user.middleName ??
                                                          ""),
                                                    ),
                                                    DataCell(
                                                      Text(user.email ?? ""),
                                                    ),
                                                    DataCell(
                                                      Text(user.phoneNumber ??
                                                          ""),
                                                    ),
                                                    DataCell(Text(
                                                      user.dob ?? "",
                                                      style: TextStyle(
                                                          color: primaryColor,
                                                          fontFamily:
                                                              'PushPenny',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14),
                                                    )),
                                                    DataCell(Text(
                                                        user.bvn ?? "",
                                                        style: TextStyle(
                                                            color: primaryColor,
                                                            fontFamily:
                                                                'PushPenny',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14))),
                                                    DataCell(
                                                      Text(
                                                          user.countryOfResidence ??
                                                              "",
                                                          style: TextStyle(
                                                              color:
                                                                  primaryColor,
                                                              fontFamily:
                                                                  'PushPenny',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14)),
                                                    ),
                                                    DataCell(Text(
                                                        user.nationality1 ?? "",
                                                        style: TextStyle(
                                                            color: primaryColor,
                                                            fontFamily:
                                                                'PushPenny',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14))),
                                                    DataCell(
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SvgPicture.asset(
                                                              user.emailVerified! ==
                                                                      true
                                                                  ? mailUn
                                                                  : mailV),
                                                          SvgPicture.asset(
                                                              user.phoneVerified! ==
                                                                      true
                                                                  ? callUn
                                                                  : callV),
                                                          SvgPicture.asset(
                                                              user.bvnVerified! ==
                                                                      true
                                                                  ? shieldUn
                                                                  : shieldV),
                                                          SvgPicture.asset(
                                                              giftUn)
                                                        ],
                                                      ),
                                                    ),
                                                    DataCell(InkWell(
                                                        onTap: () {
                                                          userProvider
                                                              .selectUser(
                                                                  user.id!);
                                                          userProvider.setCurrentUser(
                                                              "${user.firstName} "
                                                              " ${user.lastName}");
                                                          pageProvider.gotoPage(
                                                              PAGES.home);
                                                          userProvider
                                                              .getConnectSerivices(
                                                                  context);
                                                          userProvider.getCards(
                                                              context);
                                                          userProvider
                                                              .getTransactions(
                                                                  context);
                                                          Provider.of<TransactionSummaryProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .getAllTransactionSummary(
                                                                  context,
                                                                  user.id!);
                                                          //getAllTransactionSummary
                                                        },
                                                        child: Container(
                                                          height: 20,
                                                          width: 60,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      15,
                                                                  vertical: 4),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24)),
                                                          child: const Text(
                                                            "View",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "PushPenny",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ))),
                                                  ],
                                                ),
                                              )
                                              .toList()),
                                    ),
                                  ),
                                )),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Row statusIcons(String title, String image) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Color(0XFF6E80A3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'PushPenny'),
        ),
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(image)
      ],
    );
  }
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
