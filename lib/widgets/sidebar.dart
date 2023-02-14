// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../helper/screen_export.dart';
import '../screens/authentication/welcome_back.dart';

class SideBar extends StatelessWidget {
  final bool firstTimer;
  final bool isWelcomeBack;
  const SideBar({super.key, this.firstTimer = true, this.isWelcomeBack=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:firstTimer ? 400 : 256,
      // padding: EdgeInsets.symmetric(horizontal: 5),
      color: Color(0xffF9F9F9),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.only(right:firstTimer ? 110:0),
                  child: Image.asset(
                    kyshiLogo,
                    width: 106,
                    height: 40,
                  ),
                ),
                Padding(
            padding: const EdgeInsets.fromLTRB(35, 50, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               isWelcomeBack ? SizedBox(): firstTimer ? Text("You need to enable \ntwo-step authentication \nto continue",
                  style: TextStyle(
                    fontFamily: "PushPenny",
                    color: primaryColor ,
                    fontSize:20,
                    fontWeight: FontWeight.w500,
                  ),
                ):
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Operations',
                      style: TextStyle(
                        fontFamily: "PushPenny",
                        color: primaryColor ,
                        fontSize:17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 70,
                      height: 1.23,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height:firstTimer ?10 :40,
                ),
                isWelcomeBack ? SizedBox():firstTimer ? Text("Download either of these apps and add your Kyshi admin account",
                  style: TextStyle(
                    fontFamily: "PushPenny",
                    color: primaryColor ,
                    fontSize:17,
                    fontWeight: FontWeight.w400,
                  ),
                ) : SizedBox(),
                firstTimer? SizedBox(height: 40,) :SizedBox(),
                isWelcomeBack ? SizedBox():firstTimer ?  Row(
                  children: [
                    buildColumn(title:  "Google Authenticator", image: googleAuth, svg:false),
                    SizedBox(width: 20,),
                    buildColumn(title: "Authy App", image: authy, svg: true)
                  ],
                )
                : SizedBox(),
                isWelcomeBack ? SizedBox():firstTimer ?SizedBox():
                Text("data")
                ],
              ))
              ],
            ),
          ),
          firstTimer ? Text("© 2022 Kyshi Limited. All rights reserved.",style:
          TextStyle(
              color: Color(0XFF233375),
              fontWeight: FontWeight.w400,
              fontSize: 14,fontFamily: 'PushPenny'),) :Container(
            width: 160,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 51, 117, 0.1),
                    border: Border.all(color: Color(0xff233375), width: 2),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Text('EI',
                    style: TextStyle(
                      color: Color(0xff233375),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PushPenny'
                    ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (context) =>const WelcomeBack()), (route) => false);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text('Log out',
                          style: TextStyle(
                            color: Color(0xff233375),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                             fontFamily: 'PushPenny'
                          ),
                          ),
                          Icon(Icons.logout, color: Color(0xff233375),)
                        ],
                      ),
                      Text('Change password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF21D184),
                        fontSize: 12
                      ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }

  Column buildColumn({required String title,required String image ,required bool svg}) {
    return Column(
      children: [
        svg ? SvgPicture.asset(image) : Image.asset(image),
        SizedBox(
          height: 15,
        ),
        Text(title,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0XFF353D46)),
        ),
      ],
    );
  }
}
