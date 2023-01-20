// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/constants/controller.dart';
import 'package:kyshi_operations_dashboard/routing/route.dart';

import '../helper/screen_export.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Color(0xffF9F9F9),
      child: Column(
        children: [
          SizedBox(height: 40),
          Image.asset(
            kyshiLogo,
            width: 106,
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 50, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Operations',
                      style: TextStyle(
                        fontFamily: "PushPenny",
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 94,
                      height: 1.23,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: sideMenuItems.map((itemName) => SideMenuItem(
                    itemName: itemName,
                      // itemName: itemName == AuthenticationPageRoute
                      //     ? "Log Out"
                      //     : itemName,
                      onTap: (){
                      // if(itemName == AuthenticationPageRoute){
                      //   // Todo: Go to Authentication page

                      // }
                      if(!menuController.isActive(itemName)){
                        menuController.changeActiveItemTo(itemName);
                      }
                      })).toList(),
                ),
               
                // Column(
                //   children: [
                //     Row(
                //       children: [
                //         Image.asset(
                //           userAccountIcon,
                //           width: 24,
                //           height: 24,
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Text(
                //           'User accounts',
                //           style: TextStyle(
                //               fontFamily: "PushPenny",
                //               fontSize: 12,
                //               color: Color(0xff8C8C8C),
                //               fontWeight: FontWeight.w400),
                //         )
                //       ],
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     // SideMenuItem()
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
