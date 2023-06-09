import 'package:dio/dio.dart';
import 'package:kyshi_operations_dashboard/helper/dialogs.dart';
import 'package:kyshi_operations_dashboard/models/users.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/otp_screen.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/welcome_back.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/userService/userService.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshiTextField.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';
import 'package:provider/provider.dart';
// import 'package:pinput/pinput.dart';

import '../../helper/screen_export.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  FocusNode? focusNode;
  final TextEditingController oldPasswordController =
      TextEditingController(text: "");
  final TextEditingController newPasswordController =
      TextEditingController(text: "");
  final TextEditingController confirmPasswordController =
      TextEditingController(text: "");
  // late PinTheme defaultPinTheme;
  // late Color borderColor;
  // late Color focusedBorderColor;
  // late Color fillColor;
  // bool hasError = false;
  @override
  void initState() {
    // TODO: implement initState
    // focusedBorderColor = kyshiGreyishBlue;
    // fillColor = const Color.fromRGBO(243, 246, 249, 0);
    // borderColor = kyshiGreyishBlue;
    // defaultPinTheme = PinTheme(
    //   width: 70,
    //   height: 52,
    //   textStyle: const TextStyle(
    //     fontSize: 22,
    //     color: Color.fromRGBO(30, 60, 87, 1),
    //   ),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //     border: Border.all(color: borderColor),
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 510,
        padding: const EdgeInsets.only(top: 200, left: 100),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot password",
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
            Text(
              "Enter your email address and we'll send you a link to reset your password.",
              style: TextStyle(
                  color: kyshiGreyishBlue,
                  fontSize: 12,
                  fontFamily: 'PushPenny',
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
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
            KyshiDynamicButtons(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                    (route) => false);
                // if (goDashBoard) {
                //   // getUsers();
                //   Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(builder: (context) => const Homepage()),
                //           (route) => false);
                // } else {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => OtpScreen()));
                // }
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

getUsers() async {
  // Response response =await UserService().getAllUsers();
  // Users users =Users.fromJson(response.data);
  // print("STATUS CODE ${response.statusCode}");
  // print("${users.data} ALL USERS");
}

class KyshiDynamicButtons extends StatelessWidget {
  final bool goDashBoard;
  Function()? onTap;
  KyshiDynamicButtons({Key? key, this.goDashBoard = false, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageViewProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent),
          child: InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeBack()),
                  (route) => false);
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_outlined),
                Text(
                  "Return to log in",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontFamily: 'PushPenny',
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        KyshiButtonResponsive(
          color: primaryColor,
          onPressed: onTap,
          text: "Submit",
          size: 200,
        ),
        // Text("Forgot password?",style: TextStyle(color: primaryColor,
        //     fontWeight: FontWeight.w400,fontFamily: 'PushPenny',fontSize: 12),)
      ],
    );
  }
}
