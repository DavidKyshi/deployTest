

import 'dart:async';

import 'package:kyshi_operations_dashboard/helper/dialogs.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/first_time_login.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/forgot_password.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshiTextField.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:pinput/pinput.dart';

import '../../helper/screen_export.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  StreamController<ErrorAnimationType>? errorController;
  final TextEditingController controller = TextEditingController(text: "");
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SideBar(),
          Container(
            width: 510,
            padding: const EdgeInsets.only(top: 200,left: 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter your OTP",style: TextStyle(color: primaryColor,
                    fontSize: 32,
                    fontFamily: 'PushPenny',fontWeight: FontWeight.w700),),
                RichText(text: TextSpan(
                    text: "Please, check your browser’s address bar to be sure you’re on",
                    style: TextStyle(color: kyshiGreyishBlue,fontSize: 12,fontFamily: 'PushPenny',fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: "  https://kyshiadmin.co",style: TextStyle(color: kyshiGreen)
                      )
                    ]
                ),),
                const SizedBox(height: 20,),
                Text("Enter the 6-digit confirmation code from your authenticator",style: TextStyle(color: kyshiGreyishBlue,
                    fontSize: 12,
                    fontFamily: 'PushPenny',fontWeight: FontWeight.w400),),
                const SizedBox(height: 20,),
                PinField(errorController: errorController, controller: controller),
                const SizedBox(height: 60,),
                const KyshiDynamicButtons(),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}