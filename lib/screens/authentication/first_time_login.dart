import 'dart:async';

import 'package:dio/dio.dart';
import 'package:kyshi_operations_dashboard/providers/users.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/welcome_back.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:pinput/pinput.dart';

import '../../helper/dialogs.dart';
import '../../helper/screen_export.dart';
import '../../models/users.dart';
import '../../providers/payout_transactions.dart';
import '../../userService/userService.dart';
import 'otp_screen.dart';

class FirstTimer extends StatefulWidget {

  const FirstTimer({Key? key,}) : super(key: key);

  @override
  State<FirstTimer> createState() => _FirstTimerState();
}

class _FirstTimerState extends State<FirstTimer> {
  final TextEditingController controller = TextEditingController(text: "");
  // late PinTheme defaultPinTheme;
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  bool hasError = false;
  String pin = "";
  String qrLink = "";
  @override
  void initState() {
    getQrCode();
    // TODO: implement initState
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }
   getQrCode()async{
    Map<String, dynamic> responseData = await UserService().enable2FA(context);
    print("${responseData["otp_url"]} screen111111 qr");
    setState(() {
      qrLink = responseData["otp_url"];
    });
    print("$qrCode screen222222");

  }
  @override
  void dispose() {
    errorController?.close();
    super.dispose();
  }

  verifyOtp()async{
    print("$pin VERIFY OTP");
    Response responseData = await UserService().verifyOtp(data: pin, context: context);
    if(responseData.statusCode ==200){
      print("correct OPTP");
      if (mounted){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
                (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageViewProvider>(context);
    print("$qrLink linksssssss");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideBar(),
          const SizedBox(
            width: 20,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello! I know it’s first login.",
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
                            text: "https://kyshiadmin.co",
                            style: TextStyle(color: kyshiGreen))
                      ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Whenever you sign in to your admin account, you will need to enter \nboth your password and a security code sent to your device.",
                  style: TextStyle(
                      color: kyshiGreyishBlue,
                      fontSize: 12,
                      fontFamily: 'PushPenny',
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Scan this QR code and enter the 6 digit OTP \ndisplayed on the app",
                  style: TextStyle(
                      color: kyshiGreyishBlue,
                      fontSize: 18,
                      fontFamily: 'PushPenny',
                      fontWeight: FontWeight.w400),
                ),
                QrImage(data: qrLink,
                  size: 200,
                ),
                Text(
                  "Enter the 6 digit security code",
                  style: TextStyle(
                      color: kyshiGreyishBlue,
                      fontSize: 18,
                      fontFamily: 'PushPenny',
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                PinField(
                  errorController: errorController,
                  controller: controller,
                  onChanged: (String value) {
                    setState(() {
                      pin = value;
                    });
                  },
                ),
                // Directionality(
                //   // Specify direction if desired
                //   textDirection: TextDirection.ltr,
                //   child: Pinput(
                //     controller: controller,
                //     autofocus: false,
                //     length: 6,
                //     // focusNode: focusNode,
                //     androidSmsAutofillMethod:
                //     AndroidSmsAutofillMethod.smsUserConsentApi,
                //     listenForMultipleSmsOnAndroid: true,
                //     defaultPinTheme: defaultPinTheme,
                //     hapticFeedbackType: HapticFeedbackType.lightImpact,
                //     onCompleted: (pin) {
                //       // if (widget.isSignUp) {
                //       //   BlocProvider.of<VerifyDeviceBloc>(context).add(
                //       //       VerifySignUpOtpEvent(
                //       //           otp: controller.text,
                //       //           phoneNumber: context
                //       //               .read<VerifyDeviceBloc>()
                //       //               .state
                //       //               ?.phoneNumber));
                //       // } else {
                //       //   BlocProvider.of<VerifyDeviceBloc>(context)
                //       //       .add(VerifyOTPEvent(otp: controller.text));
                //       // }
                //     },
                //     onChanged: (text) {
                //       // setState(() {
                //       //   hasError = false;
                //       // });
                //       // BlocProvider.of<VerifyDeviceBloc>(context)
                //       //     .add(SubmitOTPEvent(otp: text));
                //     },
                //     validator: (value) {
                //       // return hasError ? 'Pin is incorrect' : null;
                //     },
                //
                //     focusedPinTheme: defaultPinTheme.copyWith(
                //       decoration: defaultPinTheme.decoration?.copyWith(
                //         borderRadius: BorderRadius.circular(8),
                //         border: Border.all(color: focusedBorderColor),
                //       ),
                //     ),
                //     submittedPinTheme: defaultPinTheme.copyWith(
                //       decoration: defaultPinTheme.decoration?.copyWith(
                //         color: fillColor,
                //         borderRadius: BorderRadius.circular(8),
                //         border: Border.all(
                //             color: hasError
                //                 ? Colors.red
                //                 : focusedBorderColor),
                //       ),
                //     ),
                //     errorPinTheme: defaultPinTheme.copyBorderWith(
                //       border: Border.all(color: Colors.redAccent),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                KyshiButtonResponsive(
                  color: pin.length >= 6 ? primaryColor : kyshiGreyishBlue,
                  onPressed: () async {
                    Provider.of<OfferManagementProvider>(context, listen: false)
                        .getAllOfferManagement(context);
                    Provider.of<OfferManagementProvider>(context, listen: false)
                        .getAcceptedOfferManagement(context);
                        Provider.of<OfferManagementProvider>(context, listen: false)
                        .getCreatedUserAccount(context);
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
                        Provider.of<PayOutTransactionProvider>(context, listen: false)
                         .getAllPayOutTransactions();
                         Provider.of<PayOutTransactionProvider>(context, listen: false)
                         .getCompletedPayOutTransactions();
                          Provider.of<PayOutTransactionProvider>(context, listen: false)
                         .getFailedPayOutTransactions();
                          Provider.of<PayOutTransactionProvider>(context, listen: false)
                         .getPendingPayOutTransactions();
                          Provider.of<PayOutTransactionProvider>(context, listen: false)
                         .getReversedPayOutTransactions();
            //          Navigator.push(context,
            // MaterialPageRoute(builder: (context) => const OtpScreen()));
                 
                        
                    Provider.of<UsersProvider>(context, listen: false).getAllWallets(context);
                    verifyOtp();
                    // if (pin.length >= 6) {
                    //   // Provider.of<UsersProvider>(context, listen: false).getDifferentWallet();
                    //   // Navigator.push(
                    //   //     context,
                    //   //     MaterialPageRoute(
                    //   //         builder: (context) => const OtpScreen()));
                    // } else {
                    //   return;
                    // }
                  },
                  text: "Complete Setup",
                  size: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PinField extends StatelessWidget {
  const PinField({
    Key? key,
    required this.errorController,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  final StreamController<ErrorAnimationType>? errorController;
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 490,
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: const TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
        ),
        length: 6,
        obscureText: true,
        obscuringCharacter: '*',
        // obscuringWidget: const FlutterLogo(
        //   size: 5,
        // ),
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: (v) {
          // if (v!.length < 3) {
          //   return "I'm from validatordccv";
          // } else {
          //   return null;
          // }
        },
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 60,
            errorBorderColor: kyshiRed,
            activeFillColor: Colors.white,
            activeColor: primaryColor,
            selectedColor: const Color(0XFF92A0BA),
            selectedFillColor: Colors.white,
            inactiveColor: const Color(0XFF92A0BA).withOpacity(0.2),
            inactiveFillColor: Colors.white),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: controller,
        keyboardType: TextInputType.number,
        // boxShadows: const [
        // //   BoxShadow(
        // //     offset: Offset(0, 1),
        // //     color: Colors.black12,
        // //     blurRadius: 10,
        // //   )
        // // ],
        onCompleted: (v) {
          debugPrint("Completed$v");
        },
        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: onChanged,
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
