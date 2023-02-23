import 'package:kyshi_operations_dashboard/customWidget/searchField.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/wallet/wallet_details.dart';
import 'package:provider/provider.dart';

import '../../../helper/screen_export.dart';
import '../../../models/users.dart';
import '../../../providers/users.dart';
import '../../../styleguide/colors.dart';

class WalletAndBeneficiaries extends StatefulWidget {
  const WalletAndBeneficiaries({Key? key}) : super(key: key);

  @override
  State<WalletAndBeneficiaries> createState() => _WalletAndBeneficiariesState();
}

class _WalletAndBeneficiariesState extends State<WalletAndBeneficiaries> {
  final List<String> bankNames = ["GT Bank", "Kuda Bank"];
  final List<String> accountNum = ["22121386920", "01233348485"];
  final List<String> names = ["Bright George", "Bright George"];
  final List<String> route = ["NIL", "NIL"];
  final List<String> sortCode = ["10019921", "10019921"];
  final List<String> currency = ["NGN", "NGN"];
  User? user;

  @override
  void initState() {
    user = Provider.of<UsersProvider>(context, listen: false).getUserById();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height:user!.wallets!.isEmpty? 400: 800,
                child:user!.wallets!.isEmpty?
                Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Dates",style: TextStyle(
                    //         color: primaryColor,
                    //         fontFamily: 'PushPenny',
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 12
                    //     )),
                    //     Text("Wallet",style: TextStyle(
                    //         color: primaryColor,
                    //         fontFamily: 'PushPenny',
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 12
                    //     )),
                    //     Text("Provider",style: TextStyle(
                    //         color: primaryColor,
                    //         fontFamily: 'PushPenny',
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 12
                    //     )),
                    //     Text("Phone Number",style: TextStyle(
                    //         color: primaryColor,
                    //         fontFamily: 'PushPenny',
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 12
                    //     )),
                    //     Text("Amount (₦)",style: TextStyle(
                    //         color: primaryColor,
                    //         fontFamily: 'PushPenny',
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 12
                    //     )),
                    //     Text("Exchange rate",style: TextStyle(
                    //         color: primaryColor,
                    //         fontFamily: 'PushPenny',
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 12
                    //     )),
                    //     Text("Exchange rate",style: TextStyle(
                    //         color: primaryColor,
                    //         fontFamily: 'PushPenny',
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 12
                    //     )),
                    //   ],
                    // ),
                    const SizedBox(height: 100,),
                    SvgPicture.asset(empty),
                    Text("The user has not created a wallet yet"
                        "  it will\n appear here when the user does",style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'PushPenny',
                    ),)
                  ],
                ) :
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        walletStatus(
                            title: "${user?.wallets![index].currency} wallet details",
                            subTitle:user?.wallets![index].status == "PENDING"? "Rejected": "SET",
                            color: primaryColor,
                            backgroundColor:user?.wallets![index].status == "PENDING" ? kyshiRed: primaryColor,
                            containerColor: const Color(0x0ff9f9f9),
                            padding2: 60,
                            padding1: 10),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                          height: MediaQuery.of(context).size.height/3,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.loose,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                padding: const EdgeInsets.only(
                                    top: 15, left: 15, right: 60, bottom: 40),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0XFF8C8C8C)
                                            .withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "WALLET BALANCE",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'PushPenny',
                                              color: primaryColor),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: 90,
                                          height: 20,
                                          // padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: const Color(0XFF8C8C8C),
                                              border:
                                                  Border.all(color: primaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(19)),
                                          child:  Text(
                                            "${user?.wallets![index].status}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: "₦${user?.wallets![index].availableBalance}",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w500))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 50,
                                          left: 15),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bonus balance",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 8,
                                                fontFamily: 'PushPenny',
                                                color: kyshiGreyishBlue),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: "₦${user?.wallets![index].totalBalance}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: kyshiGreyishBlue),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 200,
                                  child: InkWell(
                                    onTap: (){
                                      print("bkhbdhkbdhbdhbd ");
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> WalletDetails(wallet: user?.wallets![index],)));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      width: MediaQuery.of(context).size.width / 3,
                                      // height: 500,
                                      decoration: BoxDecoration(
                                          color: const Color(0XFFF8F9FE),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "BANK ACCOUNT DETAILS",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 12,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Divider(
                                            color: Colors.white,
                                            height: 2,
                                            thickness: 2,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          bankAccountDetails(
                                              detail: "Account Number",
                                              value: '${user?.wallets![index].accountNumber ?? ""}'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          bankAccountDetails(
                                              detail: "Account Name",
                                              value: '${user?.wallets![index].accountName ?? "no name"}'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          bankAccountDetails(
                                              detail: "Bank Name",
                                              value: '${user?.wallets![index].bankName ?? "no bank"}'),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(24)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children:  const [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "View full wallet details",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'PushPenny'),
                                                ),
                                                Icon(Icons.calendar_today_outlined),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: user?.wallets?.length,
                ),
              ),
              // const SizedBox(height: 11,),
              headerTitle(context, title: "Funding Source"),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0XFFF8F9FE),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "All records were created instantly when they were submitted",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0XFF6E7883),
                          fontFamily: 'PushPenny'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    user!.wallets!.isEmpty || user!.beneficiaries!.isEmpty?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BANK NAME",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("ACC NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("NAME",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("ROUTING NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("SORT CODE NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("FIN.INST. NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("BRANCH TRANSIT NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("CURRENCY",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                          ],
                        ),
                        const SizedBox(height: 100,),
                        SvgPicture.asset(empty),
                        Text("This account is yet to be funded,  it will appear\n"
                            " here when the user does",style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PushPenny',
                        ),)
                      ],
                    ):
                    DataTable(
                        columns:  <DataColumn>[
                          DataColumn(
                            label: Text("BANK NAME",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 10
                            )),
                            // tooltip: "To Display name"
                          ),
                          DataColumn(label:  Text("ACC NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label:Text("NAME",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label: Text("ROUTING NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label:  Text("SORT CODE NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label: Text("FIN.INST. NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label:  Text("BRANCH TRANSIT NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label:  Text("CURRENCY",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          )))
                        ],
                        rows:user!.wallets!.map(
                              (service) =>
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(service.bankName ?? "",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    )),
                                  ),
                                  DataCell(
                                    Text(service.accountNumber ?? "",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    )),
                                  ),
                                   DataCell(
                                    Text(service.accountName ?? ""),
                                  ),
                                  DataCell(
                                    Text( "No routing no",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    )),
                                  ),
                                   const DataCell(
                                      Text( "No sort code")
                                  ),
                                  DataCell(
                                    Text( "No FIN.INST. NO",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    )),
                                  ),
                                  const DataCell(
                                      Text( "No BRANCH TRANSIT NO")
                                  ),
                                  DataCell(
                                      Text(service.currency ?? "",style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ))
                                  ),
                                ],
                              ),
                        ).toList()
                    )
                    // Row(
                    //   children: [
                    //     UserAccountTableCell(
                    //       title: "BANK NAME",
                    //       name: SizedBox(
                    //         height: 350,
                    //         width: 100,
                    //         child: ListView.builder(
                    //           // controller: controller,
                    //           physics: const PageScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 15),
                    //                 child: Text(bankNames[index]));
                    //           },
                    //           itemCount: bankNames.length,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     UserAccountTableCell(
                    //       title: "ACCT NO",
                    //       name: SizedBox(
                    //         height: 350,
                    //         width: 100,
                    //         child: ListView.builder(
                    //           // controller: controller,
                    //           physics: const PageScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 15),
                    //                 child: Text(accountNum[index]));
                    //           },
                    //           itemCount: accountNum.length,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     UserAccountTableCell(
                    //       title: "NAME",
                    //       name: SizedBox(
                    //         height: 350,
                    //         width: 100,
                    //         child: ListView.builder(
                    //           // controller: controller,
                    //           physics: const PageScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 15),
                    //                 child: Text(names[index]));
                    //           },
                    //           itemCount: names.length,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     UserAccountTableCell(
                    //       title: "ROUTING NO",
                    //       name: SizedBox(
                    //         height: 350,
                    //         width: 100,
                    //         child: ListView.builder(
                    //           // controller: controller,
                    //           physics: const PageScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 15),
                    //                 child: Text(route[index]));
                    //           },
                    //           itemCount: route.length,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     UserAccountTableCell(
                    //       title: "SORT CODE NO",
                    //       name: SizedBox(
                    //         height: 350,
                    //         width: 100,
                    //         child: ListView.builder(
                    //           // controller: controller,
                    //           physics: const PageScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 15),
                    //                 child: Text(sortCode[index]));
                    //           },
                    //           itemCount: sortCode.length,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     UserAccountTableCell(
                    //       title: "FIN. INST NO",
                    //       name: SizedBox(
                    //         height: 350,
                    //         width: 100,
                    //         child: ListView.builder(
                    //           // controller: controller,
                    //           physics: const PageScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 15),
                    //                 child: Text(route[index]));
                    //           },
                    //           itemCount: route.length,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     UserAccountTableCell(
                    //       title: "BRANCH. TRANSIT NO",
                    //       name: SizedBox(
                    //         height: 350,
                    //         width: 100,
                    //         child: ListView.builder(
                    //           // controller: controller,
                    //           physics: const PageScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 15),
                    //                 child: Text(route[index]));
                    //           },
                    //           itemCount: route.length,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     UserAccountTableCell(
                    //       title: "CURRENCY",
                    //       name: SizedBox(
                    //         height: 350,
                    //         width: 100,
                    //         child: ListView.builder(
                    //           // controller: controller,
                    //           physics: const PageScrollPhysics(),
                    //           itemBuilder: (context, index) {
                    //             return Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 15),
                    //                 child: Text(currency[index]));
                    //           },
                    //           itemCount: currency.length,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              headerTitle(context, title: "Beneficiaries"),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0XFFF8F9FE),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "All records were created instantly when they were submitted",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0XFF6E7883),
                          fontFamily: 'PushPenny'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    user!.wallets!.isEmpty || user!.beneficiaries!.isEmpty?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BANK NAME",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("ACC NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("NAME",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("ROUTING NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("SORT CODE NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("FIN.INST. NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("BRANCH TRANSIT NO",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                            Text("CURRENCY",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            )),
                          ],
                        ),
                        const SizedBox(height: 100,),
                        SvgPicture.asset(empty),
                        Text("This account is yet to make a transfer to a beneficiary, \n"
                            "it will appear here when the user does",style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PushPenny',
                        ),)
                      ],
                    ):
                    DataTable(
                        columns:  <DataColumn>[
                          DataColumn(
                            label: Text("BANK NAME",style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontWeight: FontWeight.w500,
                                fontSize: 10
                            )),
                            // tooltip: "To Display name"
                          ),
                          DataColumn(label:  Text("ACC NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label:Text("NAME",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label: Text("ROUTING NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label:  Text("SORT CODE NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label: Text("FIN.INST. NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label:  Text("BRANCH TRANSIT NO",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ))),
                          DataColumn(label:  Text("CURRENCY",style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'PushPenny',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          )))
                        ],
                        rows:user!.wallets!.map(
                              (service) =>
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(service.bankName ?? "",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    )),
                                  ),
                                  DataCell(
                                    Text(service.accountNumber ?? "",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    )),
                                  ),
                                  DataCell(
                                    Text(service.accountName ?? ""),
                                  ),
                                  DataCell(
                                    Text( "No routing no",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    )),
                                  ),
                                  const DataCell(
                                      Text( "No sort code")
                                  ),
                                  DataCell(
                                    Text( "No FIN.INST. NO",style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: 'PushPenny',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                    )),
                                  ),
                                  const DataCell(
                                      Text( "No BRANCH TRANSIT NO")
                                  ),
                                  DataCell(
                                      Text(service.currency ?? "",style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ))
                                  ),
                                ],
                              ),
                        ).toList()
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container headerTitle(BuildContext context, {required String title}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0XFFF9F9F9),
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: const Color(0XFFF3F3F3))),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            color: primaryColor,
            fontFamily: 'PushPenny',
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Row bankAccountDetails({required String detail, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(detail), Text(value)],
    );
  }

  Container walletStatus(
      {required String title,
      required String subTitle,
      required Color color,
      required Color backgroundColor,
      required Color containerColor,
      required double padding1,
      required double padding2}) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: const Color(0XFFF3F3F3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'PushPenny',
                color: color),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding:
                EdgeInsets.symmetric(vertical: padding1, horizontal: padding2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: backgroundColor),
            child: Text(
              subTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PushPenny',
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
