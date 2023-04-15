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
import '../../widgets/kyshi_responsive_button.dart';




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
  DataTableSource dataSource() =>
      TableRow(user: user, contexts: context);
      
  ScrollController? controller;
  final _debouncer = Debouncer();
  String phoneNumDropdownvalue = 'Verified';
  String emailDownValue = 'Verified';
  String identityDownValue = 'Unverified';
  String residencyDownValue = 'NG';
  String nationalityDownValue = 'NG';
  List<String> phoneNumber = ['Verified', 'Unverified'];
  List<String> identity = ['Verified', 'Unverified'];
  List<String> residence = ['UK', 'NG', "US", "CAD"];
  List<String> nationality = ['UK', 'NG', "US", "CAD"];
  List<String> email = ['Verified', 'Unverified'];

  @override
  void initState() {
    userProvider.setSingle(false);
    // TODO: implement initState
    user = Provider.of<UsersProvider>(context, listen: false).users;
    numOfPage = getPages(userProvider.totalUserPage);
    super.initState();
  }
  String dropdownvalue2 = '50';
  var currency =['50', '100', '200', '500', "1000"];
  bool isLoading = false;
  bool _checkBox = false;
  _FilterRanger dropdownvalue = lastDays[2];
  List<int> numOfPage= [];
  int selectedIndex = 0;

  bool isEmailValid(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
  TextStyle headerStyle = TextStyle(
      color: primaryColor,
      fontFamily: 'PushPenny',
      fontWeight: FontWeight.w500,
      fontSize: 12);

  List<int> getPages(int num){
    List<int> arr = [];
    int sum = 0;
    for (int i = 1; i <= num; i++) {
      if (sum + i <= num) {
        arr.add(i);
        sum += i;
      } else {
        break;
      }
    }
    // print(arr);
    return arr;
  }


  @override
  Widget build(BuildContext context) {
    // final pageProvider = Provider.of<PageViewProvider>(context);
    // final getuser = userProvider.getUserById();
    // print("${user!.length} ALL USERS before lennn");
    // userProvider.setSingle(false);
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
              selectedItemBuilder: (BuildContext context) {
                return lastDays.map((items) {
                  return Center(
                    child: Text(
                      dropdownvalue.title,
                      style:  TextStyle(
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
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffDDDDDD), width: 0.5))),
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
              onChanged: ( newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
                Provider.of<UsersProvider>(context,listen:false).getDaysAgo(context:context,daysAgo:newValue?.daysAgo.toString());
                List<User> result =Provider.of<UsersProvider>(context, listen: false).users;
                     user = result.where((element) => element.createdAt!.toLowerCase().contains(newValue!.daysAgo.toString().toLowerCase())).toList();
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
                padding: const EdgeInsets.only(top: 16, left: 12,right: 12),
                child: Column(
            children: [
                 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 28),
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
                              fontWeight: FontWeight.w400,
                              fontFamily: "PushPenny",
                              color: primaryColor),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:  BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      borderRadius: BorderRadius.circular(10),
                                      dropdownColor: Colors.white,
                                      elevation: 1,
                                      // Initial Value
                                      value: dropdownvalue2,
                                      selectedItemBuilder: (BuildContext context) {
                                        return currency.map((String items) {
                                          return Center(
                                              child: RichText(
                                                text: TextSpan(
                                                  text: dropdownvalue2,
                                                  style:  TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 22,
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
                                      icon:  Icon(
                                        Icons.keyboard_arrow_down,
                                        color: primaryColor,
                                      ),

                                      // Array list of items
                                      items: currency.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Container(
                                            // width:double.infinity,
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 15),
                                            decoration: const BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Color(0xffDDDDDD), width: 0.3))),
                                            child: Text(
                                              items,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
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
                                          // isLoading = true;
                                          Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, entrySize: dropdownvalue2);
                                          user = Provider.of<UsersProvider>(context, listen: false).users;
                                        });
                                        // Future.delayed( Duration(seconds:double.tryParse(dropdownvalue2)! > 500 ? 15 : 10)).then((value) {
                                        //   setState(() {
                                        //     isLoading = false;
                                        //   });
                                        // }
                                        // );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:  BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)
                          ),
                          // Icon(Icons.arrow_forward_ios_outlined, color: kyshiGreyishBlue,)
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index){
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          Provider.of<UsersProvider>(context, listen: false)
                                              .getUsers(context: context, page: numOfPage[index]);
                                          setState(() {
                                            selectedIndex = index;
                                            print("${numOfPage[index]} $selectedIndex index clicked");
                                            user = Provider.of<UsersProvider>(context, listen: false).users;
                                          });
                                          // print("${user!.length} after page picked");
                                        },
                                        child: Text("${numOfPage.length < 5 ? numOfPage[index] : numOfPage.sublist(0,5)[index]}",
                                          style: TextStyle(color:selectedIndex == index
                                               ? primaryColor : kyshiGreyishBlue,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'PushPenny'
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                  itemCount: numOfPage.length< 5 ? numOfPage.length :numOfPage.sublist(0,5).length,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex == 5 ? selectedIndex = 0 : selectedIndex++;
                                    Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, page: selectedIndex);
                                    user = Provider.of<UsersProvider>(context, listen: false).users;
                                  });
                                },
                                  child: Icon(Icons.arrow_forward_ios_outlined, color: kyshiGreyishBlue,size: 13,))
                            ],
                          ),
                        ),
                        const SizedBox(width: 15,),

                      ],
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statusIcons("Email Status", mail),
                      const SizedBox(width: 14,),
                      statusIcons("Phone number Status", call),
                      const SizedBox(width: 14,),
                      statusIcons("Identity Status", shield),
                      const SizedBox(width: 14,),
                      statusIcons("Free Swap Status ", gift),
                    ],
                  )
                ],
            ),
            const SizedBox(height: 20,),
             SearchField(
                 exportCvsTap: (){
                   final service = UserService().exportCsv(context: context);
                 },
               onTapPrefixIcon: ()async{
                 return await  showModalBottomSheet<void>(
                     context: context,
                     backgroundColor: Colors.white,
                     shape: const RoundedRectangleBorder(
                       borderRadius: BorderRadius.vertical(
                         top: Radius.circular(10),
                       ),
                     ),
                     constraints:const BoxConstraints(
                       maxWidth:  400,
                     ),
                     builder: (BuildContext context) {
                       return StatefulBuilder(builder: (context ,mystate){
                         return SingleChildScrollView(
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                             child: Column(
                               children: [
                                 filterField(dropDownValue: residencyDownValue, data: residence, label: 'Residence',
                                     onChangedData: (String? value) {
                                       mystate(() {
                                         residencyDownValue = value!;
                                       });
                                     }),
                                 const SizedBox(height: 20,),
                                 filterField(dropDownValue: nationalityDownValue, data: nationality, label: 'Nationality',
                                     onChangedData: (String? value) {
                                       mystate(() {
                                         nationalityDownValue = value!;
                                       });
                                     }
                                 ),
                                 const SizedBox(height: 20,),
                                 filterField(dropDownValue: phoneNumDropdownvalue, data: phoneNumber, label: 'Phone Number Verification',
                                     onChangedData: (String? value) {
                                       mystate(() {
                                         phoneNumDropdownvalue = value!;
                                       });
                                     }
                                 ),
                                 const SizedBox(height: 20,),
                                 filterField(dropDownValue: emailDownValue, data: email, label: 'Email Address Verification',
                                     onChangedData: (String? value) {
                                       mystate(() {
                                         emailDownValue = value!;
                                       });
                                     }
                                 ),
                                 const SizedBox(height: 20,),
                                 filterField(dropDownValue: identityDownValue, data: identity, label: 'Identity Verification',
                                     onChangedData: (String? value) {
                                       mystate(() {
                                         identityDownValue = value!;
                                       });
                                     }
                                 ),
                                 const SizedBox(height: 30,),
                                 Row(
                                   children: [
                                    Checkbox(value: _checkBox, onChanged: (bool? value){
                                      mystate(() {
                                        _checkBox = value!;
                                      });
                                    }),
                                     const SizedBox(width: 8,),
                                     Text("Save as default filter",style: TextStyle(color: kyshiGreyishBlue,
                                         fontSize: 10,fontWeight: FontWeight.w400,fontFamily: 'PushPenny'),),
                                   ],
                                 ),
                                 const SizedBox(height: 20,),
                                 KyshiButtonResponsive(
                                   color: primaryColor,
                                   onPressed: () {
                                     setState(() {
                                       bool phone = phoneNumDropdownvalue =="Verified" ? true :false;
                                       bool email =  emailDownValue == 'Verified'? true :false;
                                       bool identity = identityDownValue == 'Verified'? true :false;
                                       // print("$phone $email $identity allllllllvvvv");

                                       List<User> result =Provider.of<UsersProvider>(context, listen: false).users;
                                       user = result.where((element) => element.countryOfResidence!.toLowerCase().contains(residencyDownValue.toLowerCase())
                                           && element.nationality1!.toLowerCase().contains(nationalityDownValue.toLowerCase())
                                           && element.phoneVerified == phone
                                           && element.emailVerified == email
                                           && element.bvnVerified == identity
                                       ).toList();
                                     });
                                     Navigator.pop(context);
                                     // david@david.david
                                   },
                                   text: "FILTER",
                                   size: 400,
                                 ),
                               ],
                             ),
                           ),
                         );
                       });
                     }
                 );
               },
                controller: _textEditingController,
                 hintText: "Search users....",
                 onChanged: (value){
                 if(isEmailValid(value)){
                   setState(() {
                     isLoading = true;
                   });
                   print("${isEmailValid(value)} email nsnsnn");
                   Provider.of<UsersProvider>(context, listen: false).getSingleUser(context: context, email: value);
                   // setState(() {
                   //   print("$isLoading loading::::value");
                   //
                   // });
                   Future.delayed(const Duration(seconds: 3)).then((value) {
                     setState(() {
                       isLoading = false;
                       user = userProvider.singleUser;
                       // user =Provider.of<UsersProvider>(context, listen: false).users;
                     });
                     user!.isNotEmpty ? userProvider.setSingle(true) :userProvider.setSingle(false);
                   });
                   print("${userProvider.singleUser} llllllllwwwwwww");
                 }
                   _debouncer.run(() {
                     setState(() {
                       List<User> result =Provider.of<UsersProvider>(context, listen: false).users;
                       user = result.where((element) => element.email!.toLowerCase().contains(value.toLowerCase())).toList();
                       // isLoading = false;
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
                height:10,
            ),
            // if (getuser == null) Text("User not found"),
            // if (getuser != null)
            // isLoading ?  Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children:  [
            //       CupertinoActivityIndicator(
            //         color: primaryColor,
            //         animating: true,
            //         radius: 20,
            //       )
            //     ],
            // ):
              isLoading ? Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(
                    color: primaryColor,
                    animating: true,
                    radius: 20,
                  )
                ],
              ):
            user!.isEmpty ?
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("First Name",
                          style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                      Text("Last Name",
                          style: headerStyle),
                      Text("Middle Name",
                          style:headerStyle),
                      Text("Email  Address",
                          style: headerStyle),
                      Text("Phone Number",
                          style:headerStyle),
                      Text("Date of Birth",
                          style:headerStyle),
                      Text("BVN",
                          style: headerStyle),
                      Text("Residence",
                          style:headerStyle),
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
            ):
            Container(
                padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color:  const Color(0XFFF4F5F8),
                    borderRadius: BorderRadius.circular(12)),
                child: SingleChildScrollView(
                  // scrollDirection: Axis.vertical,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        cardColor: Colors.transparent,
                        dividerColor: Colors.grey.withOpacity(0.3),
                      shadowColor: Colors.transparent
                    ),
                    child: PaginatedDataTable(
                        // header: Text("Pagination Example"),
                        rowsPerPage: 50,
                        dataRowHeight: 70,
                        showCheckboxColumn: false,
                        // onRowsPerPageChanged: (perPage) {},
                        // rowsPerPage: 10,
                      columns:  <DataColumn>[
                        DataColumn(label: Text("First Name",style: headerStyle,),
                          // tooltip: "To Display name"
                        ),
                        DataColumn(label: Text("Last Name",style: headerStyle,)),
                        DataColumn(label: Text("Middle Name",style: headerStyle,)),
                        DataColumn(label: Text("Email  Address",style: headerStyle,)),
                        DataColumn(label: Text("Phone Number",style: headerStyle,)),
                        DataColumn(label: Text("Date of Birth",style: headerStyle,)),
                        DataColumn(label: Text("BVN",style: headerStyle,)),
                        DataColumn(label: Text("Residence",style: headerStyle,),
                          // tooltip: "To Display name"
                        ),
                        DataColumn(label: Text("Nationality",style: headerStyle,)),
                        DataColumn(label: Text("Status",style: headerStyle,)),
                        DataColumn(label: Text("Action",style: headerStyle,)),
                      ],
                        source:dataSource()
          //               user!.map((user) => DataRow(
          //                 onSelectChanged: (value){
          //                   if(value!){
          //                     userProvider.selectUser(user.id!);
          //                     userProvider.setCurrentUser("${user.firstName} " " ${user.lastName}");
          //                     pageProvider.gotoPage(PAGES.home);
          //                     userProvider.getConnectSerivices(context);
          //                     userProvider.getCards(context);
          //                     userProvider.getTransactions(context);
          //                     Provider.of<TransactionSummaryProvider>(context, listen: false)
          //                         .getAllTransactionSummary(context, user.id!);
          //                   }
          //                 },
          //           cells: [
          //           DataCell(
          //           Text(user.firstName ?? ""),
          //       ),
          //   DataCell(
          //       Text(user.lastName ?? ""),
          //   ),
          //   DataCell(
          //       Text(user.middleName ?? ""),
          //   ),
          //   DataCell(
          //       Text(user.email ?? ""),
          //   ),
          //   DataCell(
          //       Text(user.phoneNumber ?? ""),
          //   ),
          //   DataCell(
          //           Text(user.dob ?? "",style: TextStyle(
          //             color: primaryColor,
          //             fontFamily: 'PushPenny',
          //             fontWeight: FontWeight.w400,
          //             fontSize: 14
          //           ),)
          //   ),
          //   DataCell(
          //           Text(user.bvn ?? "",style: TextStyle(
          //               color: primaryColor,
          //               fontFamily: 'PushPenny',
          //               fontWeight: FontWeight.w400,
          //               fontSize: 14
          //           ))
          //   ),
          //   DataCell(
          //       Text(user.countryOfResidence ?? "",style: TextStyle(
          //             color: primaryColor,
          //             fontFamily: 'PushPenny',
          //             fontWeight: FontWeight.w400,
          //             fontSize: 14
          //       )),
          //   ),
          //   DataCell(
          //           Text(user.nationality1 ?? "",style: TextStyle(
          //               color: primaryColor,
          //               fontFamily: 'PushPenny',
          //               fontWeight: FontWeight.w400,
          //               fontSize: 14
          //           ))
          //   ),
          //    DataCell(
          //             Row(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 SvgPicture.asset(user.emailVerified! == true ?mailUn :mailV),
          //                 SvgPicture.asset(user.phoneVerified! == true?callUn :callV),
          //                 SvgPicture.asset(user.bvnVerified! == true ? shieldUn :shieldV),
          //                 SvgPicture.asset(giftUn)
          //               ],
          //             ),
          //   ),
          //    DataCell(
          //           InkWell(
          //               onTap: () {
          //                 userProvider.selectUser(user.id!);
          //                 userProvider.setCurrentUser("${user.firstName} " " ${user.lastName}");
          //                 pageProvider.gotoPage(PAGES.home);
          //                 userProvider.getConnectSerivices(context);
          //                 userProvider.getCards(context);
          //                 userProvider.getTransactions(context);
          //                 Provider.of<TransactionSummaryProvider>(context, listen: false)
          //              .getAllTransactionSummary(context, user.id!);
          //                 //getAllTransactionSummary
          //               },
          //               child: Container(
          //                 height: 20,
          //                 width: 60,
          //                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          //                 decoration: BoxDecoration(
          //                     color: primaryColor,
          //                     borderRadius:
          //                     BorderRadius.circular(24)),
          //                 child: const Text(
          //                   "View",
          //                   style: TextStyle(
          //                       fontFamily: "PushPenny",
          //                       fontWeight:
          //                       FontWeight.w400,
          //                       color: Colors.white,
          //                       fontSize: 10),
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ))
          //   ),
          // ],
          // ),).toList()
                    ),
                  ),
            )

             ),


              // isLoading ?  Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:  [
              //       CupertinoActivityIndicator(
              //         color: primaryColor,
              //         animating: true,
              //         radius: 20,
              //       )
              //     ],
              // )
            ],
           ),
              )
            ],
          ),
        ));
  }

  Row statusIcons(String title, String image) {
    return Row(
      children: [Text(title,style: const TextStyle(color: Color(0XFF6E80A3),
          fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'PushPenny'),),
        const SizedBox(width: 10,),
        SvgPicture.asset(image)],
    );
  }

}

InputDecorator filterField({required String dropDownValue,required List<String> data, required String label,required Function (String?)? onChangedData}) {
  return InputDecorator(
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color(0XFFF8F9FE),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      hintStyle: TextStyle(
          color: Color(0xff6c757d).withOpacity(0.3),
          fontFamily: 'Gilroy',
          fontSize: 16.0,
          fontWeight: FontWeight.w300),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xffE6E7E9)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xff9AA1B3)),
      ),
      labelText: label,
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff9AA1B3))),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        dropdownColor: Colors.white,
        elevation: 1,
        // Initial Value
        value: dropDownValue,
        selectedItemBuilder: (BuildContext context) {
          return data.map((String items) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: RichText(
                text: TextSpan(
                  text: dropDownValue,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: primaryColor,
                      fontFamily: "PushPenny"),
                ),
              ),
            );
          }).toList();
        },
        // Down Arrow Icon
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          size: 18,
          color: Color(0xff23CE6B),
        ),

        // Array list of items
        items: data.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Container(
              // width:double.infinity,
              //alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                      BorderSide(color: Color(0xffDDDDDD), width: 0.5))),
              child: Text(
                items,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: onChangedData,
      ),
    ),
  );
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


class TableRow extends DataTableSource {
  // Function(bool?)? selectChanged;
  // Function ()? onTap;
  BuildContext contexts;
  List<User>? user ;
   TableRow({Key? key, required this.user,required this.contexts}) : super();
  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(contexts, listen: false);
  // late UsersProvider usersProvider;
  TextStyle subHeaderStyle = TextStyle(
      color: primaryColor,
      fontFamily: 'PushPenny',
      fontWeight: FontWeight.w400,
      fontSize: 14);
  @override
  DataRow? getRow(int index) {
    final pageProvider = Provider.of<PageViewProvider>(contexts);
    return DataRow.byIndex(
        index: index,
        onSelectChanged: (value){
         if(value!){
           print("${user![index].id } ID FROM USERINDEX");
           userProvider.selectUser(user![index].id ??"");
           userProvider.setCurrentUser("${user![index].firstName} " " ${user![index].firstName}");
           userProvider.getConnectAirtimeService(contexts,"airtime");
           userProvider.geAllConnectService(contexts,"");
           userProvider.getConnectDataService(contexts,"data");
           userProvider.getConnectHealthService(contexts,"health");
           userProvider.getCardAllTransactions(contexts);
           userProvider.getCardCreditTransactions(contexts);
           userProvider.getCardDebitTransactions(contexts);
           userProvider.getTransactions(contexts);
           Provider.of<TransactionSummaryProvider>(contexts, listen: false)
               .getAllTransactionSummary(contexts, user![index].id ??"");
           pageProvider.gotoPage(PAGES.home);
         }
        },
        cells: [
          DataCell(
            Text(user![index].firstName ?? "",style: subHeaderStyle,),
          ),
          DataCell(
            Text(user![index].lastName ?? "",style: subHeaderStyle,),
          ),
          DataCell(
            Text(user![index].middleName ?? "",style: subHeaderStyle,),
          ),
          DataCell(
            Text(user![index].email ?? ""),
          ),
          DataCell(
            Text(user![index].phoneNumber ?? ""),
          ),
          DataCell(
              Text(user![index].dob?? "",style: subHeaderStyle,)
          ),
          DataCell(
              Text(user![index].bvn ?? "",style: subHeaderStyle,)
          ),
          DataCell(
            Text(user![index].countryOfResidence ?? "",style: subHeaderStyle,),
          ),
          DataCell(
              Text(user![index].nationality1 ?? "",style: subHeaderStyle,)
          ),
          DataCell(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(user![index].emailVerified! == true ?mailUn :mailV),
                const SizedBox(width: 8,),
                SvgPicture.asset(user![index].phoneVerified == true?callUn :callV),
                const SizedBox(width: 8,),
                SvgPicture.asset(user![index].bvnVerified == true ? shieldUn :shieldV),
                const SizedBox(width: 8,),
                SvgPicture.asset(giftUn)
              ],
            ),
          ),
          DataCell(
              InkWell(
                  onTap: () {
                    // print("${user![index].id } bbbbbbbbbbb");
                    userProvider.selectUser(user![index].id ??"");
                    userProvider.setCurrentUser("${user![index].firstName} " " ${user![index].firstName}");
                    userProvider.geAllConnectService(contexts,"");
                    userProvider.getConnectAirtimeService(contexts,"airtime");
                    userProvider.getCardAllTransactions(contexts);
                    userProvider.getConnectDataService(contexts,"data");
                    userProvider.getConnectHealthService(contexts,"health");
                    userProvider.getCardCreditTransactions(contexts);
                    userProvider.getCardDebitTransactions(contexts);
                    userProvider.getTransactions(contexts);
                    Provider.of<TransactionSummaryProvider>(contexts, listen: false)
                        .getAllTransactionSummary(contexts, user![index].id ??"");
                    pageProvider.gotoPage(PAGES.home);
                    //getAllTransactionSummary
                  },
                  child: Container(
                    height: 20,
                    width: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                        BorderRadius.circular(24)),
                    child: const Text(
                      "View",
                      style: TextStyle(
                          fontFamily: "PushPenny",
                          fontWeight:
                          FontWeight.w400,
                          color: Colors.white,
                          fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ))
          ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => user!.length;

  @override
  int get selectedRowCount => user!.length;
}
