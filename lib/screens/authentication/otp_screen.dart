import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kyshi_operations_dashboard/helper/dialogs.dart';
import 'package:kyshi_operations_dashboard/models/express_chart.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/first_time_login.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/forgot_password.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshiTextField.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:pinput/pinput.dart';

import '../../helper/screen_export.dart';
import '../../providers/over_view_provider.dart';
import '../../providers/payout_transactions.dart';
import '../../userService/userService.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  StreamController<ErrorAnimationType>? errorController;
  final TextEditingController controller = TextEditingController(text: "");
  String pin = "";
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  verifyOtp() async {
    print("$pin VERIFY OTP");
    Response responseData =
        await UserService().verifyOtp(data: pin, context: context);
    if (responseData.statusCode == 200) {
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          CupertinoActivityIndicator(
            color: primaryColor,
            animating: true,
            radius: 20,
          )
        ],
      );
      print("correct OPTP");
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideBar(
            isWelcomeBack: true,
            firstTimer: false,
          ),
          Container(
            width: 510,
            padding: const EdgeInsets.only(top: 200, left: 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your OTP",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 32,
                      fontFamily: 'PushPenny',
                      fontWeight: FontWeight.w700),
                ),
                RichText(
                  text: TextSpan(
                      text:
                          "Please, check your browser’s address bar to be sure you’re on",
                      style: TextStyle(color: kyshiGreyishBlue, fontSize: 12, fontFamily: 'PushPenny', fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: "  https://kyshiadmin.co",
                            style: TextStyle(color: kyshiGreen))
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter the 6-digit confirmation code from your authenticator",
                  style: TextStyle(
                      color: kyshiGreyishBlue,
                      fontSize: 12,
                      fontFamily: 'PushPenny',
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                PinField(
                  errorController: errorController,
                  controller: controller,
                  onChanged: (String value) {
                    pin = value;
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                 KyshiDynamicButtons(
                  goDashBoard: true, onTap: () {
                   verifyOtp();
                   Provider.of<OfferManagementProvider>(context, listen: false)
                       .getAllOfferManagement(context);
                   Provider.of<OverViewProvider>(context,listen: false).getMarketPlaceOfferOverView(context: context);
                   Provider.of<OverViewProvider>(context,listen: false).getOverViewOffers(context: context);
                   Provider.of<OverViewProvider>(context,listen: false).getKyshiConnectGraph(context: context);
                   Provider.of<OverViewProvider>(context,listen: false).getKyshiConnectOverView(context: context);
                   Provider.of<OverViewProvider>(context,listen: false).getMarketPlaceRevenue(context: context);
                   Provider.of<OverViewProvider>(context,listen: false).getAllExpressChart(context: context);
                    Provider.of<OfferManagementProvider>(context, listen: false)
                        .getAcceptedOfferManagement(context);
                    // Provider.of<OfferManagementProvider>(context, listen: false)
                    // .getAcceptedUserOffer(context);
                    // Provider.of<OfferManagementProvider>(context, listen: false)
                    //     .getCreatedOffer(context);
                      //  .getCreatedUserAccount(context);
                   Provider.of<UsersProvider>(context, listen: false).getAllWallets(context, "50");
                    Provider.of<OfferManagementProvider>(context, listen: false)
                        .getOpenOfferManagement(context);
                    Provider.of<OfferManagementProvider>(context, listen: false)
                        .getCloseOfferManagement(context);
                    Provider.of<OfferManagementProvider>(context, listen: false)
                        .getOpenOfferManagement(context);
                    Provider.of<OfferManagementProvider>(context, listen: false)
                        .getWithdrawnOfferManagement(context);
                    Provider.of<UsersProvider>(context, listen: false)
                        .getUsers(context: context, entrySize: '100');
                    Provider.of<PayOutTransactionProvider>(context,
                            listen: false)
                        .getAllPayOutTransactions(context);
                    Provider.of<PayOutTransactionProvider>(context,
                            listen: false)
                        .getCompletedPayOutTransactions(context);
                    Provider.of<PayOutTransactionProvider>(context,
                            listen: false)
                        .getFailedPayOutTransactions(context);
                    Provider.of<PayOutTransactionProvider>(context,
                            listen: false)
                        .getPendingPayOutTransactions(context);
                    Provider.of<PayOutTransactionProvider>(context,
                            listen: false)
                        .getReversedPayOutTransactions(context);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
