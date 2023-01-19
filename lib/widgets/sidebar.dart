// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
        children:  [
          SizedBox(height: 40),
          Image.asset(kyshiLogo, width: 106, height: 40,),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 50, 0, 0),
            child: Column(
              children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Operations', 
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              ),
              SizedBox(width: 10,), 
              Container(
                width: 96.59,
                height: 1.23,
                color: Colors.black,
              )
            ],),
               SizedBox(height: 40,),
               Column(
                children: [
                   Row(
                    children: [
                      Image.asset(userAccountIcon, width: 24, height: 24,),
                      SizedBox(width: 10,),
                      Text('User accounts',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8C8C8C),
                        fontWeight: FontWeight.w400
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Image.asset(offerManagementIcon, width: 20, height: 20,),
                      SizedBox(width: 10,),
                      Text('Offer Management',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8C8C8C),
                        fontWeight: FontWeight.w400
                      ),
                      )
                    ],
                  ),
                ],
               )
              ],
            ),
          )
         
        ],
      ),
    );

  }
}