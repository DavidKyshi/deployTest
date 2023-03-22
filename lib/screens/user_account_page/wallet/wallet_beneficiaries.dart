import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart';
import 'package:kyshi_operations_dashboard/customWidget/searchField.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/wallet/wallet_details.dart';
import 'package:provider/provider.dart';

import '../../../helper/screen_export.dart';
import '../../../models/users.dart';
import '../../../providers/users.dart';
import '../../../styleguide/colors.dart';
import '../../../userService/userService.dart';
import '../../../widgets/kyshiTextFieldWithLabel.dart';
import '../../../widgets/kyshi_responsive_button.dart';

class WalletAndBeneficiaries extends StatefulWidget {
  const WalletAndBeneficiaries({Key? key}) : super(key: key);

  @override
  State<WalletAndBeneficiaries> createState() => _WalletAndBeneficiariesState();
}

class _WalletAndBeneficiariesState extends State<WalletAndBeneficiaries> {
  final List<String> emptyWalletType = ["NGN", "GBP", "USD", "CAD"];
  final List<String> accountNum = ["22121386920", "01233348485"];
  final List<String> names = ["Bright George", "Bright George"];
  final List<String> route = ["NIL", "NIL"];
  final List<String> sortCode = ["10019921", "10019921"];
  final List<String> currency = ["NGN", "NGN"];
  User? user;
  String? id;
  final controller = TextEditingController();

  // List of items in our dropdown menu

  @override
  void initState() {
    user = Provider.of<UsersProvider>(context, listen: false).getUserById();
    id = Provider.of<UsersProvider>(context, listen: false)
        .currentSelectedUserId;
    // TODO: implement initState
    super.initState();
  }

  Color walletState({required Wallet? wallet}) {
    if (wallet?.status == "PENDING" ||
        wallet?.status == "IN_PROGRESS" ||
        wallet?.status == "INACTIVE") {
      return Colors.grey;
    } else if (wallet?.status == "REJECTED") {
      return kyshiRed;
    }
    return const Color(0XFF23CE6B).withOpacity(0.5);
  }

  Color walletColor({required Wallet? wallet}) {
    if (wallet?.status == "PENDING" ||
        wallet?.status == "IN_PROGRESS" ||
        wallet?.status == "INACTIVE") {
      return Colors.grey;
    } else if (wallet?.status == "REJECTED") {
      return kyshiRed;
    }
    return const Color(0XFF23CE6B);
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
                height: 800,
                child: user!.wallets!.isEmpty
                    ? GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              walletStatus(
                                  title:
                                      "${emptyWalletType[index]} wallet details",
                                  subTitle: "SET",
                                  color: Colors.grey,
                                  backgroundColor:
                                      primaryColor.withOpacity(0.3),
                                  containerColor: const Color(0x0ff9f9f9),
                                  padding2: 60,
                                  padding1: 10,
                                  ontap: () {
                                    // editWalletStatusDialog(
                                    //   walletType: 'NGN',
                                    //   context,
                                    //   title: "Add comment",
                                    // );
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.height / 3,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  fit: StackFit.loose,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.only(
                                          top: 15,
                                          left: 15,
                                          right: 60,
                                          bottom: 40),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0XFF8C8C8C)
                                                  .withOpacity(0.2)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                height: 25,
                                                // padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0XFF8C8C8C),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0XFFC5C5C5)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            19)),
                                                child: const Text(
                                                  "Inactive",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: 'PushPenny',
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                  text: "₦0.00",
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w500))),
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
                                                border: Border.all(
                                                    color: primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Bonus balance",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 8,
                                                      fontFamily: 'PushPenny',
                                                      color: kyshiGreyishBlue),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: "₦0.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20,
                                                        color:
                                                            kyshiGreyishBlue),
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
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 15),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          // height: 500,
                                          decoration: BoxDecoration(
                                              color: const Color(0XFFF8F9FE),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                  value: ''),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              bankAccountDetails(
                                                  detail: "Account Name",
                                                  value: ''),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              bankAccountDetails(
                                                  detail: "Bank Name",
                                                  value: ''),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 8,
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: primaryColor
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children:  [
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    const Text(
                                                      "View full wallet details",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'PushPenny'),
                                                    ),
                                                   SvgPicture.asset(wallet),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: 4,
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              walletStatus(
                                title: "${user?.wallets![index].currency} wallet details",
                                subTitle: user?.wallets![index].status ?? "",
                                color: primaryColor,
                                backgroundColor: walletColor(wallet: user?.wallets![index]),
                                containerColor: const Color(0x0ff9f9f9),
                                padding2: 60,
                                padding1: 10,
                                ontap: () {
                                  editWalletStatusDialog(
                                    walletType: 'NGN',
                                    context,
                                    title: "Add comment", ontap: () {
                                    final id = Provider.of<UsersProvider>(context, listen: false).currentSelectedWalletId;
                                    print("$id ${controller.text} changing wallet");
                                    updateStatus(
                                        context: context,
                                        id: id,
                                        text: controller.text,
                                        dropDown: dropDownValue);
                                  }, controller: controller,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.height / 3,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  fit: StackFit.loose,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.only(
                                          top: 15,
                                          left: 15,
                                          right: 60,
                                          bottom: 40),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0XFF8C8C8C).withOpacity(0.2)),
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
                                                    color: walletState(wallet: user?.wallets![index]),
                                                    border: Border.all(
                                                        color: primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            19)),
                                                child: Text("${user?.wallets![index].status}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: 'PushPenny',
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                  text: "${user?.wallets![index].currency =="NGN" ? "₦"  :user?.wallets![index].currency == "USD" ? "\$" :"£" } ${user?.wallets![index].availableBalance}",
                                                  style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w500))),
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
                                                border: Border.all(
                                                    color: primaryColor),
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
                                                    text: "${user?.wallets![index].currency =="NGN" ? "₦"  :user?.wallets![index].currency == "USD" ? "\$" :"£"} ${user?.wallets![index].totalBalance}",
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
                                          onTap: () {
                                            print("bkhbdhkbdhbdhbd ");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WalletDetails(wallet: user?.wallets![index],
                                                        )));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                            width: MediaQuery.of(context).size.width / 3,
                                            // height: 500,
                                            decoration: BoxDecoration(
                                                color: const Color(0XFFF8F9FE),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
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
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                                    value: user?.wallets![index]
                                                            .accountNumber ??
                                                        ""),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                bankAccountDetails(
                                                    detail: "Account Name",
                                                    value: user?.wallets![index]
                                                            .accountName ?? "no name"),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                bankAccountDetails(
                                                    detail: "Bank Name",
                                                    value: user?.wallets![index].bankName ?? "no bank"),
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    print("conatiner tapped");
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: primaryColor,
                                                        borderRadius: BorderRadius.circular(24)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceAround,
                                                      children:  [
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          "View full wallet details",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontFamily:
                                                                  'PushPenny'),
                                                        ),
                                                       SvgPicture.asset(wallet),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
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
                    user!.wallets!.isEmpty || user!.beneficiaries!.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("BANK NAME",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("ACC NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("NAME",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("ROUTING NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("SORT CODE NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("FIN.INST. NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("BRANCH TRANSIT NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("CURRENCY",
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
                                "This account is yet to be funded,  it will appear\n"
                                " here when the user does",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'PushPenny',
                                ),
                              )
                            ],
                          )
                        : DataTable(
                            columns: <DataColumn>[
                                DataColumn(
                                  label: Text("BANK NAME",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10)),
                                  // tooltip: "To Display name"
                                ),
                                DataColumn(
                                    label: Text("ACC NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("NAME",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("ROUTING NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("SORT CODE NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("FIN.INST. NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("BRANCH TRANSIT NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("CURRENCY",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10)))
                              ],
                            rows: user!.wallets!
                                .map(
                                  (service) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(service.bankName ?? "",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ),
                                      DataCell(
                                        Text(service.accountNumber ?? "",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ),
                                      DataCell(
                                        Text(service.accountName ?? ""),
                                      ),
                                      DataCell(
                                        Text("No routing no",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ),
                                      const DataCell(Text("No sort code")),
                                      DataCell(
                                        Text("No FIN.INST. NO",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ),
                                      const DataCell(
                                          Text("No BRANCH TRANSIT NO")),
                                      DataCell(Text(service.currency ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14))),
                                    ],
                                  ),
                                )
                                .toList())
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
                    user!.wallets!.isEmpty || user!.beneficiaries!.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("BANK NAME",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("ACC NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("NAME",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("ROUTING NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("SORT CODE NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("FIN.INST. NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("BRANCH TRANSIT NO",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12)),
                                  Text("CURRENCY",
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
                                "This account is yet to make a transfer to a beneficiary, \n"
                                "it will appear here when the user does",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'PushPenny',
                                ),
                              )
                            ],
                          )
                        : DataTable(
                            columns: <DataColumn>[
                                DataColumn(
                                  label: Text("BANK NAME",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'PushPenny',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10)),
                                  // tooltip: "To Display name"
                                ),
                                DataColumn(
                                    label: Text("ACC NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("NAME",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("ROUTING NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("SORT CODE NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("FIN.INST. NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("BRANCH TRANSIT NO",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10))),
                                DataColumn(
                                    label: Text("CURRENCY",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'PushPenny',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10)))
                              ],
                            rows: user!.wallets!
                                .map(
                                  (service) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(service.bankName ?? "",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ),
                                      DataCell(
                                        Text(service.accountNumber ?? "",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ),
                                      DataCell(
                                        Text(service.accountName ?? ""),
                                      ),
                                      DataCell(
                                        Text("No routing no",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ),
                                      const DataCell(Text("No sort code")),
                                      DataCell(
                                        Text("No FIN.INST. NO",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontFamily: 'PushPenny',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ),
                                      const DataCell(
                                          Text("No BRANCH TRANSIT NO")),
                                      DataCell(Text(service.currency ?? "",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14))),
                                    ],
                                  ),
                                )
                                .toList()),
                    const SizedBox(
                      height: 50,
                    )
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
      required Function()? ontap,
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
          InkWell(
            onTap: ontap,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: padding1, horizontal: padding2),
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
            ),
          )
        ],
      ),
    );
  }
}

snackBar(BuildContext context, ContentType contentType,
    {required String title, required String message}) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.symmetric(vertical: 10),
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

updateStatus(
    {required BuildContext context,
    String? id,
    required String dropDown,
    required String text}) async {
  ContentType contentTypeSuccess = ContentType.success;
  ContentType contentTypeFail = ContentType.failure;
  Map<String, dynamic> response = await UserService().updateWalletStatus(data: {
    "wallet_id": id,
    "details": text,
    // controller.text,
    "status": dropDown.toUpperCase()
  }, context: context);
  if (response["status"] == "True") {
    Provider.of<UsersProvider>(context, listen: false).getAllWallets(context, "50");
    snackBar(context, contentTypeSuccess,
        title: "Awesome!!", message: ' Request sent Successfully ');
  } else {
    snackBar(
      context,
      contentTypeFail,
      title: 'OoPs!!',
      message: 'Error updating wallet status',
    );
  }
  Navigator.pop(context);
}

String dropDownValue = 'Active';
var changeWalletStatus = [
  // 'Select a status'
  'Active',
  'Pending',
  'In-progress',
  // 'Reject and  close applicatio
];

 editWalletStatusDialog(BuildContext context,
    {additionalButton,
    required Function()? ontap,
    required String walletType,
      required TextEditingController controller,
    required String title}) async{
  // final TextEditingController controller = TextEditingController();
 return await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
            Size size = MediaQuery.of(context).size;
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              content: SizedBox(
                width: 500,
                child: Container(
                  width: 450,
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status of $walletType",
                            style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'PushPenny',
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(close))
                        ],
                      ),
                      Text(
                        "You are about to change status of this $walletType. Proceed?",
                        style: TextStyle(
                            color: kyshiGreyishBlue,
                            fontFamily: 'PushPenny',
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      const Divider(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        width: 450,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        decoration:
                            const BoxDecoration(color: Color(0XFFF8F9FE)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Status",
                              style: TextStyle(
                                  color: Color(0XFF9AA1B3),
                                  fontFamily: 'PushPenny',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 5),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  prefixIconConstraints:
                                      const BoxConstraints(maxHeight: 30),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0XFFE6E7E9), width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0XFFE6E7E9), width: 1.0),
                                  ),
                                  isDense: true,
                                  // contentPadding: EdgeInsets.only(left: 12, right: 12, top: 8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: dropDownValue,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items:
                                        changeWalletStatus.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) async {
                                      setState(() {
                                        dropDownValue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            KyshiTextfieldWithLabel(
                              controller: controller,
                              labelText2: title,
                              borderRadius: BorderRadius.circular(8),
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
                          KyshiButtonResponsive(
                            color: const Color(0XFFF8F9FE),
                            elevation: 0,
                            childTextStyle: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                            borderColor: const Color(0XFFE6E7E9),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: "Cancel",
                            size: 200,
                          ),
                          KyshiButtonResponsive(
                            color: primaryColor,
                            onPressed: ontap,
                            text: "Yes, change status",
                            size: 200,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }));
}
