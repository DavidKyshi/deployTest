

import 'package:kyshi_operations_dashboard/helper/dialogs.dart';
import 'package:kyshi_operations_dashboard/helper/sharedPreferences.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshiTextField.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';
// import 'package:pinput/pinput.dart';

import '../../helper/screen_export.dart';
import 'otp_screen.dart';

class WelcomeBack extends StatefulWidget {
 final bool goOtpScreen;
  const WelcomeBack({Key? key,  this.goOtpScreen = false}) : super(key: key);

  @override
  State<WelcomeBack> createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode? focusNode;
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool showPassword = false;
  // late Future<bool goOtpScreen;
  @override
  void initState() {
    // print("${widget.goOtpScreen} OTPN VALUE GOTTEN from initstate");
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
    // goOtpScreen =  getBoolValuesSF("goOtpScreen");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const SideBar(isWelcomeBack: true,firstTimer: false,),
          const SizedBox(width: 20,),
          Container(
            width: 510,
            padding: const EdgeInsets.only(top: 200,left: 100),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome back",style: TextStyle(color: primaryColor,
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
                const SizedBox(height: 40,),
                KyshiTextfield(
                  controller: emailController,
                  isDense: true,
                  onChanged: (val){},
                  validator: (value){
                    return null;
                  },
                  focusNode: focusNode,

                  hintText: "Email Address",
                  obscureText: false,
                ),
                const SizedBox(height: 20,),
                StatefulBuilder(builder: (context, setStateB){
                  return KyshiTextfield(
                    controller: passwordController,
                    isDense: true,
                    onChanged: (val){},
                    validator: (value){
                      return null;
                    },
                    focusNode: focusNode,
                    hintText: "Password",
                    obscureText: showPassword,
                    suffixIcon:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                      child: InkWell(
                        onTap: (){
                          setStateB((){
                            showPassword = !showPassword;
                          });
                        },
                        child: Text(showPassword ?"Show" : "Hide",style: TextStyle(
                            color:const Color(0xff6c757d).withOpacity(0.3),
                            fontFamily: 'Gilroy',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300),),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text("Forgot password?",style: TextStyle(color: primaryColor,
                        fontWeight: FontWeight.w400,fontFamily: 'PushPenny',fontSize: 12),)
                  ],
                ),
                const SizedBox(height: 30,),
                KyshiButtonResponsive(color:primaryColor,
                 onPressed:(){
                  // print("${widget.goOtpScreen} OTPN VALUE GOTTEN");
                  widget.goOtpScreen  ? Navigator.push(context, MaterialPageRoute(builder: (context)=> const OtpScreen())):
                  showMessageDialog(
                    context, success, "Create new password",
                    btnFunction: (){},
                    additionalBtnFunction: (){},
                    additionalButtonColor: Colors.red, headline: 'Create new password,', message:"It’s compulsory to change your password boss.",
                    subMessage: "Passwords must be be 8-32 Numbers"
                        "Capital Letter and should be alphanumeric e.g, Alsdty123", name: ' Olamide',);
                },text: "SIGN IN",size: 500,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}