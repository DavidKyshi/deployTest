// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});
  static const String route = "UserAccountScreen";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

          //color: Colors.amber,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              width: 1190.83,
              height: 97.55,
              color: Color(0xffF9F9F9),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LastDaysFilter(
                      dropdownDateValue: '', onChangeDate: (String? value ) {  },),
                    SizedBox(
                      width: 20,
                    ),
              //       InkWell(
              //         onTap: (){
              //           showDialog(
              //   context: context,
              //   builder: (ctx) => AlertDialog(
              //     title: const Text("Alert Dialog Box"),
              //     content: Container(
              //       child: Column(
              //         children: [
              //           CalenderPickDate(),
              //           InkWell(
              //             onTap: Navigator.of(context).pop,
              //             child: Text('Submit'))
              //         ],
              //       ),

              //     )
              //   ),
              // );
              //         },
              //         child: Container(
              //           width: 132,
              //           height: 50,
              //           decoration: BoxDecoration(
              //             color: Colors.white
              //           ),
              //           child: Text('Filter'),
              //         ),
              //       ),
              //       CalenderPickDate()
                  ],
                ),
              )),
          Container(
              //  width: 500,
              height: 800,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                child: UserAccountIndex(),
              ))
        ],
      )
          //   DefaultTabController(
          //     length: 9,
          //     initialIndex: 0,

          //     child: Column(
          //       children: [
          //         Container(
          //           child: TabBar(
          //             isScrollable: true,
          //             labelColor: Color(0xff233375),
          //             labelStyle: TextStyle(
          //                fontFamily: "PushPenny",
          //               fontSize: 18,
          //               fontWeight: FontWeight.w500,
          //             ),
          //             unselectedLabelStyle: TextStyle(
          //               fontFamily: "PushPenny",
          //               fontSize: 18,
          //               fontWeight: FontWeight.w400,
          //             ),
          //             unselectedLabelColor: Color(0xff233375),
          //             indicatorColor: Colors.black,
          //             indicatorWeight: 1.5,
          //             tabs: [
          //               Tab(
          //                 text: 'Account & KYC',
          //               ),
          //               Tab(
          //                 text: 'Wallet & Beneficiaries',
          //               ),
          //               Tab(
          //                 text: 'Created offers',
          //               ),
          //               Tab(
          //                 text: 'Accepted offers',
          //               ),
          //               Tab(
          //                 text: 'Kyshi Connect Services',
          //               ),
          //               Tab(
          //                 text: 'Kyshi Card',
          //               ),
          //               Tab(
          //                 text: 'Transactions',
          //               ),
          //               Tab(
          //                 text: 'Transaction Summary',
          //               ),
          //               Tab(
          //                 text: 'Identification Summary',
          //               ),
          //             ],
          //           ),
          //         ),
          //         Container(

          //           height: MediaQuery.of(context).size.height/1.1, //height of TabBarView
          //           decoration: BoxDecoration(
          //               border:
          //                   Border(top: BorderSide(color: Colors.grey, width: 0.5))),
          //           child: TabBarView(
          //             children: [
          //               UserAccountIndex(),
          //               WalletAndBeneficiaries(),
          //               Center(child: Text('Created offers')),
          //               Center(child: Text('Accepted offers')),
          //               KyshiConnectServices(),
          //               KyshiCard(),

          //               Center(child: Text('Transactions')),
          //               Center(child: Text('Transaction Summary')),
          //               Center(child: Text('Identification Summary')),
          //             ],
          //           ),
          //         ),

          ),
    );
  }
}
