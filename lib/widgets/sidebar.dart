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
        children: [
              Expanded(child: Column(
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
                      width: 80,
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
                        navigationController.navigateTo(itemName);
                      }
                      })).toList(),
                ),
               
                ],
              ))
                
              ],
            ),
          ),
          Container(
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
                Column(
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
                )
              ],
            ),
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}
