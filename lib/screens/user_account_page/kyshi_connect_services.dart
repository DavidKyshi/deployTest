import 'dart:developer';

import 'package:kyshi_operations_dashboard/screens/user_account_page/transactions.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/user_account_index.dart';
import 'package:provider/provider.dart';

import '../../helper/screen_export.dart';
import '../../models/connectServices.dart';
import '../../providers/users.dart';
import '../../styleguide/colors.dart';

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

class KyshiConnectServices extends StatefulWidget {
  const KyshiConnectServices({Key? key}) : super(key: key);

  @override
  State<KyshiConnectServices> createState() => _KyshiConnectServicesState();
}

class _KyshiConnectServicesState extends State<KyshiConnectServices> {
  List<String> dates = [
    "Nov 28, 20223:58 PM",
    "Nov 28, 20223:58 PM",
    "Nov 28, 20223:58 PM"
  ];
  List<String> wallets = ["NGN", "GBP", "USD"];
  List<String> items = [
    "Dates",
    "Wallet",
    "Provider",
    "Phone Number",
    "Exchange rate",
    "Status"
  ];
  List<Services>? connectServices;
  List<String> connectData = ['Airtime', 'Data', 'Health Plan'];
 String connect = "Airtime";
  ScrollController? controller;
  final _debouncer = Debouncer();
  @override
  void initState() {
    connectServices =
        Provider.of<UsersProvider>(context, listen: false).connectAirtimeService;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
             SearchFieldDropdown(
               hintText: "Search with amount...",
              // dropDownTitle: "Airtime",
              onChanged: (value){
                _debouncer.run(() {
                  setState(() {
                    final provider = Provider.of<UsersProvider>(context, listen: false);
                    // Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, entrySize: value);
                    List<Services>? connectService =connect == "Airtime"? provider.connectAirtimeService : connect == "Data" ? provider.connectDataService :provider.connectHealthService;
                    connectServices = connectService!.where((element) => element.amount!.toLowerCase().contains(value.toLowerCase())).toList();
                    // isLoading = false;
                    // print("$user SEARCHED USERS");
                  });
                });
              }, connect: connect,
               connectOnChanged: (String? res){
                setState(() {
                  connect = res!;
                });
                final provider = Provider.of<UsersProvider>(context, listen: false);
                // Provider.of<UsersProvider>(context, listen: false).getConnectAirtimeSerivice(context,connect);
                setState(() {
                  connectServices =connect == "Airtime"? provider.connectAirtimeService : connect == "Data" ? provider.connectDataService :provider.connectHealthService;
                });
               }, connectData: connectData,
            ),
            // SearchField(
            //   hintText: "Search card transactions....",
            //   onChanged: (value){
            //     _debouncer.run(() {
            //       setState(() {
            //         // Provider.of<UsersProvider>(context, listen: false).getUsers(context: context, entrySize: value);
            //         List<Services>? connectService =Provider.of<UsersProvider>(context, listen: false).connectService;
            //         connectServices = connectService!.where((element) => element.amount!.toLowerCase().contains(value.toLowerCase())).toList();
            //         // isLoading = false;
            //         // print("$user SEARCHED USERS");
            //       });
            //     });
            //   },
            // ),
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
                child: connectServices!.isEmpty
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
                              Text("Phone Number",
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
                              Text("Exchange rate",
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
                            "The user is yet to make transaction"
                            " \nwith Kyshi connect services,"
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
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                      child: DataTable(
                          dataRowHeight: 60,
                          columnSpacing: 70,
                          columns:  <DataColumn>[
                              DataColumn(
                                label: Text("Dates",style: headerStyle,),
                                // tooltip: "To Display name"
                              ),
                              DataColumn(label: Text("Wallet",style: headerStyle,)),
                              DataColumn(label: Text(connect == "Health Plan" ? "Healthplan" : "Provider",style: headerStyle,)),
                              DataColumn(label: Text(connect == "Health Plan" ? "Duration" :"Phone Number",style: headerStyle,)),
                            if(connect == "Data") DataColumn(label: Text("Data Plan",style: headerStyle,)),
                            if(connect == "Health Plan")DataColumn(label: Text("Beneficiary",style: headerStyle,)),
                              DataColumn(label: Text("Amount (₦)",style: headerStyle,)),
                              DataColumn(label: Text("Exchange rate",style: headerStyle,)),
                              DataColumn(label: Text("Status",style: headerStyle,)),
                            ],
                          rows: connectServices!
                              .map(
                                (service) => DataRow(
                                  cells: [
                                    DataCell(
                                      Text("${service.createdAt}",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    DataCell(
                                      Text(service.currency ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                     DataCell(
                                      Text("Seerbit",style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                    ),
                                     DataCell(
                                      Text(service.phoneNumber ?? "",style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                    ),
                                    if(connect == "Data") DataCell(
                                      Text( "DATA PLAN",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    if(connect == "Health Plan")DataCell(
                                      Text( "NIL",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    DataCell(
                                      Text(service.amount ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                     DataCell(Text("NIL",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14))),
                                    DataCell(Text(service.status ?? "",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14))),
                                  ],
                                ),
                              )
                              .toList()),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
