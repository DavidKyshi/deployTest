import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/helper/sharedPreferences.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/otp_screen.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/welcome_back.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshiTextField.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';
import 'package:lottie/lottie.dart';

import '../userService/userService.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController emailController = TextEditingController(text: "");
final TextEditingController oldPasswordControllers = TextEditingController();
final TextEditingController newPasswordControllers = TextEditingController();
final TextEditingController confirmPasswordControllers =
    TextEditingController();
FocusNode? focusNode;
String? qrCodes;
void showMessageDialog(BuildContext context, lottieType, buttonText,
    {additionalButton,
    required Function()? btnFunction,
    required Function additionalBtnFunction,
    required Color additionalButtonColor,
    required String headline,
    required String message,
    required String subMessage,
    final bool popScreen = true,
    required String name,
    bool clearAdditionalButton = true,
    bool isWalletpop = false}) {
  bool hideOldPassword = false;
  bool hideNewPassword = false;
  bool hideConfirmPassword = false;
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
            Size size = MediaQuery.of(context).size;
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
              content: SizedBox(
                width: 600,
                child: Container(
                  width: 550,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(close))
                        ],
                      ),
                      RichText(
                          text: TextSpan(
                              text: headline,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PushPenny'),
                              children: [
                            TextSpan(
                                text: name,
                                style: const TextStyle(
                                    color: Color(0xff7880AA),
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PushPenny'))
                          ])),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      // RichText(
                      //   text: TextSpan(
                      //       text: message,
                      //       style: const TextStyle(
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 16,
                      //         color: Color(0xff7880AA),
                      //         // fontFamily: 'Gilroy'
                      //       ),
                      //       children: <TextSpan>[]),
                      //   textAlign: TextAlign.center,
                      // ),
                      Text(
                        message,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PushPenny'),
                      ),
                      Text(
                        subMessage,
                        // textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff7880AA),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PushPenny'),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      KyshiTextfield(
                        controller: oldPasswordControllers,
                        isDense: true,
                        onChanged: (val) {},
                        validator: (value) {
                          return null;
                        },
                        focusNode: focusNode,
                        hintText: "Old Password",
                        obscureText: hideOldPassword,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                hideOldPassword = !hideOldPassword;
                              });
                            },
                            child: Text(
                              hideOldPassword ? "Show" : "Hide",
                              style: TextStyle(
                                  color: kyshiGreen,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      KyshiTextfield(
                        controller: newPasswordControllers,
                        isDense: true,
                        onChanged: (val) {},
                        validator: (value) {
                          return null;
                        },
                        focusNode: focusNode,
                        hintText: "NewPassword",
                        obscureText: hideNewPassword,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                hideNewPassword = !hideNewPassword;
                              });
                            },
                            child: Text(
                              hideNewPassword ? "Show" : "Hide",
                              style: TextStyle(
                                  color: kyshiGreen,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      KyshiTextfield(
                        controller: confirmPasswordControllers,
                        isDense: true,
                        onChanged: (val) {},
                        validator: (value) {
                          return null;
                        },
                        focusNode: focusNode,
                        hintText: "Confirm Password",
                        obscureText: hideConfirmPassword,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                hideConfirmPassword = !hideConfirmPassword;
                              });
                            },
                            child: Text(
                              hideConfirmPassword ? "Show" : "Hide",
                              style: TextStyle(
                                  color: kyshiGreen,
                                  fontFamily: 'Gilroy',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      KyshiButtonResponsive(
                        color: primaryColor,
                        onPressed: btnFunction,
                        text: "CREATE NEW PASSWORD",
                        size: 550,
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
              ),
            );
          }));
}

void successMessageDialog(
  BuildContext context,
  buttonText, {
  additionalButton,
  required Function()? btnFunction,
  required Function additionalBtnFunction,
  required Color additionalButtonColor,
  required String headline,
  required String message,
  required String subMessage,
  bool clearAdditionalButton = true,
}) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
            Size size = MediaQuery.of(context).size;
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
              content: SizedBox(
                width: 600,
                child: Container(
                  width: 550,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(close))
                        ],
                      ),
                      SvgPicture.asset(successImg),
                      Text(
                        headline,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PushPenny'),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                        message,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PushPenny'),
                      ),
                      Text(
                        subMessage,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: kyshiGreyishBlue,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PushPenny'),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      KyshiButtonResponsive(
                        color: primaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FirstTimer()),
                              (route) => false);
                        },
                        text: buttonText,
                        size: 550,
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
              ),
            );
          }));
}

displayAlert(
    {String? title,
    String? image,
    String? content,
    bool? success,
    BuildContext? context}) {
  // set up the AlertDialog
//  AlertDialog alert = ;

  void _modalBottomSheetMenu(
      {String title = '',
      String? content,
      bool? success,
      BuildContext? context}) {
    showModalBottomSheet(
        context: context!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        builder: (builder) {
          return Container(
              color: Colors.transparent,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: SingleChildScrollView(
                    child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          height: 5,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Text('Swipe down to close',
                          style: TextStyle(
                              color: Color.fromRGBO(38, 50, 56, 0.5),
                              fontSize: 16)),
                      const SizedBox(height: 20),
                      image != null
                          ? SvgPicture.asset(
                              error,
                              width: 65,
                              height: 65,
                            )
                          : SvgPicture.asset(
                              success != null && success ? successImg : error,
                              width: 65,
                              height: 65,
                            ),
                      const SizedBox(height: 15),
                      Text(
                        title,
                      ),
                      const SizedBox(height: 15),
                      Text(content ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: success != null && success == false
                                  ? Colors.red
                                  : const Color.fromRGBO(38, 50, 56, 0.5),
                              fontSize: 16)),
                    ])),
              ));
        });
  }

  return _modalBottomSheetMenu(
      context: context, title: title!, content: content, success: success);
}
