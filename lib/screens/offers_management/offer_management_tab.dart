// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/closed_offers.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/expired_offers.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/test.dart';
import 'package:kyshi_operations_dashboard/screens/offers_management/withdraw_offers.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/accept_offer.dart';

import 'accepted_offers.dart';
import 'all_offer.dart';
import 'open_offers.dart';

class OfferManagementTab extends StatefulWidget {
  const OfferManagementTab({super.key});

  @override
  State<OfferManagementTab> createState() => _OfferManagementTabState();
}

class _OfferManagementTabState extends State<OfferManagementTab> {
  OfferManagementProvider get offerManagementProvider =>
      Provider.of<OfferManagementProvider>(context, listen: false);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: DefaultTabController(
          length: 6,
          initialIndex: 0,
          child: Column(children: [
            // Container(
            //     width: 1190.83,
            //     height: 97.55,
            //     color: Color(0xffF9F9F9),
            //     child: Padding(
            //       padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            //       child: Row(
            //         // crossAxisAlignment: CrossAxisAlignment.end,
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           LastDaysFilter(),
            //           SizedBox(
            //             width: 20,
            //           ),
            //           CalenderPickDate()
            //         ],
            //       ),
            //     )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const TabBar(
                      isScrollable: true,
                      labelColor: Color(0xff233375),
                      labelStyle: TextStyle(
                        fontFamily: "PushPenny",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontFamily: "PushPenny",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      unselectedLabelColor: Color(0xff233375),
                      indicatorColor: Colors.black,
                      indicatorWeight: 1.5,
                      tabs: [
                        Tab(
                          text: 'All Offers',
                        ),
                        Tab(
                          text: 'Open offers',
                        ),
                        Tab(
                          text: 'Closed offers',
                        ),
                        Tab(
                          text: 'Accepted offers',
                        ),
                        Tab(
                          text: 'Expired offers',
                        ),
                        Tab(
                          text: 'Withdrawn offers',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height/1.1, //height of TabBarView
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchField(),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.1,
                    child: TabBarView(
                      children: [
                        TextTab(),
                        // AllOfferTable(),
                        OpenOfferTable(),
                        ClosedOfferTable(),
                        OfferManageAcceptedOfferTable(),
                        ExpiredOfferTable(),
                        WithDrawnOfferTable(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
