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
// import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController emailController = TextEditingController(text: "");
final TextEditingController oldPasswordController = TextEditingController(text: "");
final TextEditingController newPasswordController = TextEditingController(text: "");
final TextEditingController confirmPasswordController = TextEditingController(text: "");
FocusNode? focusNode;
void showMessageDialog(BuildContext context, lottieType, buttonText, {additionalButton,
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
      builder: (BuildContext context) => StatefulBuilder(builder: (context, setState){
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
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(close))
                      ],
                    ),
                    RichText(
                        text: TextSpan(text: headline,
                            style:  TextStyle(
                                color: primaryColor, fontSize: 28, fontWeight: FontWeight.bold,fontFamily: 'PushPenny'),
                            children: [
                              TextSpan(
                                  text: name,
                                  style:  const TextStyle(
                                      color: Color(0xff7880AA), fontSize: 28, fontWeight: FontWeight.bold,fontFamily: 'PushPenny')
                              )
                            ]
                        )
                    ),
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
                      controller: oldPasswordController,
                      isDense: true,
                      onChanged: (val){},
                      validator: (value){
                        return null;
                      },
                      focusNode: focusNode,
                      hintText: "Old Password",
                      obscureText:hideOldPassword,
                      suffixIcon:  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                        child: InkWell(
                          onTap: (){
                            setState((){
                              hideOldPassword = !hideOldPassword;
                            });
                          },
                          child: Text(hideOldPassword ? "Show" : "Hide",style: TextStyle(
                              color:kyshiGreen,
                              fontFamily: 'Gilroy',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    KyshiTextfield(
                      controller: newPasswordController,
                      isDense: true,
                      onChanged: (val){},
                      validator: (value){
                        return null;
                      },
                      focusNode: focusNode,
                      hintText: "NewPassword",
                      obscureText: hideNewPassword,
                      suffixIcon:  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                        child: InkWell(
                          onTap: (){
                            setState((){
                              hideNewPassword = !hideNewPassword;
                            });
                          },
                          child: Text(hideNewPassword ? "Show" : "Hide",style: TextStyle(
                              color:kyshiGreen,
                              fontFamily: 'Gilroy',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    KyshiTextfield(
                      controller: confirmPasswordController,
                      isDense: true,
                      onChanged: (val){},
                      validator: (value){
                        return null;
                      },
                      focusNode: focusNode,
                      hintText: "Confirm Password",
                      obscureText: hideConfirmPassword,
                      suffixIcon:  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                        child: InkWell(
                          onTap: (){
                            setState((){
                              hideConfirmPassword = !hideConfirmPassword;
                            });
                          },
                          child: Text(hideConfirmPassword ? "Show" : "Hide",style: TextStyle(
                              color:kyshiGreen,
                              fontFamily: 'Gilroy',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    KyshiButtonResponsive(color: primaryColor, onPressed:popScreen? (){
                      // addBoolToSF("goOtpScreen", true);
                      Navigator.pop(context);
                      successMessageDialog(context, "SIGN IN", btnFunction: (){}, additionalBtnFunction: (){}, additionalButtonColor: Colors.red, headline: "Awesome!",
                        message: "Olamide, You are good to go", subMessage: "You can log in to your account now",);
                    }: btnFunction,text: "CREATE NEW PASSWORD",size: 550,),
                    const SizedBox(height: 60,)
                  ],
                ),
              ),
            ),
          );

      }));
}

void successMessageDialog(BuildContext context, buttonText, {additionalButton,
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
      builder: (BuildContext context) => StatefulBuilder(builder: (context, setState){
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
                          onTap: (){
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
                  KyshiButtonResponsive(color: primaryColor, onPressed: (){
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const WelcomeBack(goOtpScreen: true)), (route) => false);
                  },text: buttonText,size: 550,),
                  const SizedBox(height: 60,)
                ],
              ),
            ),
          ),
        );

      }));
}