// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/screens/user_account_page/identification_summary.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/kyshi_card.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/kyshi_connect_services.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/transaction_summary.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/transactions.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/wallet/wallet_beneficiaries.dart';

import '../../helper/screen_export.dart';

import '../../styleguide/colors.dart';
import 'accept_offer.dart';
import 'create_offer.dart';

class UserAccountTab extends StatefulWidget {
  const UserAccountTab({super.key});

  @override
  State<UserAccountTab> createState() => _UserAccountTabState();
}


class _UserAccountTabState extends State<UserAccountTab> {
int? selectedIndex = 0;

  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);

  String headerTitle(){
    if (selectedIndex == 0){
      return "Account & KYC";
    }else if (selectedIndex ==1){
      return "Wallet & Beneficiaries";
    }else if (selectedIndex ==2){
      return "Created offers";
    }else if (selectedIndex ==3){
      return "Accepted offers";
    }else if (selectedIndex ==4){
      return "Kyshi Connect Services";
    }else if (selectedIndex ==5){
      return "Kyshi Card";
    }else if (selectedIndex ==6){
      return "Transactions";
    }else if (selectedIndex ==7){
      return "Transaction Summary";
    }
      return "Identification Summary";

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // width: 500,
        // height: 800,
        //  color: Colors.amber,
        child: DefaultTabController(
          length: 9,
          initialIndex: 0,
          child: Column(
            children: [
              Row(
                children: [
                  Text("${userProvider.currentUserName}",style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'PushPenny',
                      color: primaryColor
                  ),),
                  Icon(Icons.arrow_forward_ios,color: primaryColor,size: 14,),
                  Text(headerTitle(),style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'PushPenny',
                      color: kyshiGreyishBlue
                  ),),
                ],
              ),
              Container(
                child:  TabBar(
                  isScrollable: true,
                  labelColor: Color(0xff233375),
                  onTap:(index){
                    setState(() {
                      selectedIndex = index;
                    });
                  },
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
                      text: 'Account & KYC',
                    ),
                    Tab(
                      text: 'Wallet & Beneficiaries',
                    ),
                    Tab(
                      text: 'Created offers',
                    ),
                    Tab(
                      text: 'Accepted offers',
                    ),
                    Tab(
                      text: 'Kyshi Connect Services',
                    ),
                    Tab(
                      text: 'Kyshi Card',
                    ),
                    Tab(
                      text: 'Transactions',
                    ),
                    Tab(
                      text: 'Transaction Summary',
                    ),
                    Tab(
                      text: 'Identification Summary',
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height /
                    1.1, //height of TabBarView
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: TabBarView(
                  children: [
                    AccountKYC(),
                    WalletAndBeneficiaries(),
                    CreateOfferTable(),
                    AcceptOfferTable(),
                    KyshiConnectServices(),
                    KyshiCard(),
                    TransactionHistory(),
                    TransactionSummaryBoard(),
                    IdentificationSummary(),
                  ],
                ),
              ),

              //       Container(
              //          width: 1179.83,
              // height:  97.55,
              // color: Color(0xffF9F9F9),
              //         child: Row(
              //           children: [
              //             LastDaysFilter(),
              //           ],
              //         ))
            ],
          ),
        ),
      ),
    );
  }
}
