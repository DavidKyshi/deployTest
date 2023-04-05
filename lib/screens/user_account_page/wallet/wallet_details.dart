// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/currencyConverter.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:provider/provider.dart';

import '../../../models/users.dart';
import '../../../providers/users.dart';

class WalletDetails extends StatefulWidget {
  Wallet? wallet;
  WalletDetails({Key? key, this.wallet}) : super(key: key);

  @override
  State<WalletDetails> createState() => _WalletDetailsState();
}

class _WalletDetailsState extends State<WalletDetails> {
  User? user;
  @override
  void initState() {
    user = Provider.of<UsersProvider>(context, listen: false).getUserById();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "User Accounts",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'PushPenny',
                          color: primaryColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: primaryColor,
                        size: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Account Profile",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PushPenny',
                            color: kyshiGreyishBlue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: primaryColor,
                        size: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "${widget.wallet?.currency} Wallet details",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PushPenny',
                            color: kyshiGreyishBlue),
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    walletDetailsHeader(
                        title: "${widget.wallet?.currency} Wallet details",
                        subTitle: "Export PDF",
                        image: pdfIcon, show: true),
                    SizedBox(
                      width: 220,
                    ),
                    walletDetailsHeader(
                        title: "${widget.wallet?.currency} Wallet Reports",
                        subTitle: "This Week",
                        image: downArrow, show: false),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WalletDataParameters(
                      wallet: widget.wallet,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 500,
                      height: MediaQuery.of(context).size.height / 2.4,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.loose,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            padding: const EdgeInsets.only(top: 15, bottom: 40),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0XFF8C8C8C)
                                        .withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: RichText(
                                      text: TextSpan(
                                          text:
                                              "${widget.wallet?.totalDebitForTheYear}",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w500),
                                          children: [
                                        TextSpan(
                                          text: "Total Debits",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ])),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: RichText(
                                      text: TextSpan(
                                          text:
                                              "${widget.wallet?.totalCreditForTheYear}",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w500),
                                          children: [
                                        TextSpan(
                                          text: "Total Credits",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontFamily: 'PushPenny',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ])),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 200,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                width: MediaQuery.of(context).size.width / 3,
                                // height: 500,
                                decoration: BoxDecoration(
                                    color: const Color(0XFFF8F9FE),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "WALLET LIMITS",
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
                                        detail: "Daily Limit",
                                        value:
                                            '${Util.formatAmount(widget.wallet?.tier?.maxDailySpendAmount)}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    bankAccountDetails(
                                        detail: "Monthly Limit",
                                        value:
                                            ' ${Util.formatAmount(widget.wallet?.tier?.maxMonthlySpendAmount)}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    bankAccountDetails(
                                        detail: "Annual Limit",
                                        value:
                                            '${Util.formatAmount(widget.wallet?.tier?.maxAnnualSpendAmount)}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    bankAccountDetails(
                                        detail: "Allowable Balance",
                                        value:
                                            '${widget.wallet?.tier?.maxBalanceAllowed}'),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row bankAccountDetails({required String detail, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(detail), Text(value)],
    );
  }

  Container walletDetailsHeader(
      {required title, required subTitle, required String image, required bool show}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFF8C8C8C).withOpacity(0.2)),
          borderRadius: BorderRadius.circular(48),
          color: Color(0XFFF9F9F9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontFamily: 'PushPenny',
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 8,
          ),
          show ?
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(48)),
            child: Row(
              children: [
                Text(
                  subTitle,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PushPenny'),
                ),
                SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(image)
              ],
            ),
          ) : SizedBox()
        ],
      ),
    );
  }
}

class WalletDataParameters extends StatelessWidget {
  WalletDataParameters({super.key, this.wallet});
  final Wallet? wallet;
  final time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 533.82,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BioDataTitleTextStyle(
                    text: 'Status',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Date',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Currency',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Available Bal.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Total Bal.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Tier',
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  BioDataSubTitleTextStyle(
                    text: 'Provider',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Account Name',
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  BioDataSubTitleTextStyle(
                    text: 'Account No.',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Bank Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Bank Code',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Account ID',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Client ID',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'ID',
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BioDataSubTitleTextStyle(
                      text: wallet?.status ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: "${wallet?.createdAt ?? ""}",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: wallet?.currency ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: "${wallet?.availableBalance}",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: wallet?.totalBalance ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: "${wallet?.tier?.name}",
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    BioDataStatusTextStyle(
                      isActive: true,
                      text: wallet?.provider ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: wallet?.accountName ?? "",
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    BioDataStatusTextStyle(
                      isActive: false,
                      text: wallet?.accountNumber ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: wallet?.bankName ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: wallet?.bankCode ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: wallet?.accountId ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: wallet?.clientId ?? "",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: wallet?.id ?? "",
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
