import 'package:dio/dio.dart';
import 'package:kyshi_operations_dashboard/helper/dialogs.dart';
import 'package:kyshi_operations_dashboard/helper/sharedPreferences.dart';
import 'package:kyshi_operations_dashboard/models/login.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshiTextField.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';
// import 'package:pinput/pinput.dart';

import '../../helper/screen_export.dart';
import '../../userService/userService.dart';
import 'otp_screen.dart';

class WelcomeBack extends StatefulWidget {
  final bool goOtpScreen;
  const WelcomeBack({Key? key, this.goOtpScreen = false}) : super(key: key);

  @override
  State<WelcomeBack> createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode? focusNode;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool showPassword = false;
  bool validUser = false;

  // late Future<bool goOtpScreen;
  @override
  void initState() {
    // print("${widget.goOtpScreen} OTPN VALUE GOTTEN from initstate");
    // TODO: implement initState
    super.initState();
  }

  login() async {
    final data = {
      "email": emailController.text,
      "password": passwordController.text
    };
    Response? responseData = await UserService().login(context, data);
    // LoginModel loginModel = LoginModel.fromJson(responseData?.data);
    if (mounted)
      Provider.of<UsersProvider>(context, listen: false)
          .setAccessToken(responseData?.data["access"] ?? "");
    if (responseData?.statusCode == 200) {
      if (mounted)
        Provider.of<UsersProvider>(context, listen: false)
            .getUsers(context: context, entrySize: '100');
      if (mounted) {
        if (responseData?.data["is_admin_changed_password"] == false) {
          showMessageDialog(
            context,
            success,
            "Create new password",
            btnFunction: () async {
              Map<String, dynamic> response =
                  await UserService().changePassword(data: {
                "old_password": oldPasswordControllers.text,
                "new_password": newPasswordControllers.text
              }, context: context);
              if (response["message"] == "Password changed successfully") {
                if (mounted) {
                  if (responseData?.data["is_2fa_enabled"] == false) {
                    Navigator.pop(context);
                    successMessageDialog(
                      context,
                      "SETUP 2FA",
                      btnFunction: () {},
                      additionalBtnFunction: () {},
                      additionalButtonColor: Colors.red,
                      headline: "Awesome!",
                      message:
                          "${responseData?.data["first_name"]}, You are good to go",
                      subMessage: "You can log in to your account now",
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpScreen()));
                  }
                }
              } else {
                print("WRONG PASSWORD");
              }
              // getQrCode();
              // addBoolToSF("goOtpScreen", true);
            },
            additionalBtnFunction: () {},
            additionalButtonColor: Colors.red,
            headline: 'Create new password,',
            message: "It’s compulsory to change your password boss.",
            subMessage: "Passwords must be be 8-32 Numbers"
                "Capital Letter and should be alphanumeric e.g, Alsdty123",
            name: ' ${responseData?.data["first_name"]}',
          );
        } else if (responseData?.data["is_2fa_enabled"] == false) {
          if (mounted) {
            Navigator.pop(context);
            successMessageDialog(
              context,
              "SETUP 2FA",
              btnFunction: () {},
              additionalBtnFunction: () {},
              additionalButtonColor: Colors.red,
              headline: "Awesome!",
              message:
                  "${responseData?.data["first_name"]}, You are good to go",
              subMessage: "You can log in to your account now",
            );
          }
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OtpScreen()));
        }
      }
    } else {
      if (mounted) {
        showMessageDialog(
          context,
          error,
          "Error",
          btnFunction: () {
            Navigator.pop(context);
          },
          additionalBtnFunction: () {},
          additionalButtonColor: Colors.red,
          headline: 'Incorrect Code',
          message: "Please check your auth app",
          subMessage: "Passwords must be be 8-32 Numbers"
              "Capital Letter and should be alphanumeric e.g, Alsdty123",
          name: ' Olamide',
        );
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
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 510,
            padding: const EdgeInsets.only(top: 200, left: 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back",
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
                  height: 40,
                ),
                KyshiTextfield(
                  controller: emailController,
                  isDense: true,
                  onChanged: (val) {},
                  validator: (value) {
                    return null;
                  },
                  focusNode: focusNode,
                  hintText: "Email Address",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                StatefulBuilder(builder: (context, setStateB) {
                  return KyshiTextfield(
                    controller: passwordController,
                    isDense: true,
                    onChanged: (val) {},
                    validator: (value) {
                      return null;
                    },
                    focusNode: focusNode,
                    hintText: "Password",
                    obscureText: showPassword,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: InkWell(
                        onTap: () {
                          setStateB(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Text(
                          showPassword ? "Show" : "Hide",
                          style: TextStyle(
                              color: const Color(0xff6c757d).withOpacity(0.3),
                              fontFamily: 'Gilroy',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PushPenny',
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                KyshiButtonResponsive(
                  color: primaryColor,
                  onPressed: () {
                    login();

                    // print("${widget.goOtpScreen} OTPN VALUE GOTTEN");
                    // validUser ?
                    // widget.goOtpScreen
                    //     ? Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const OtpScreen()))
                  },
                  text: "SIGN IN",
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
