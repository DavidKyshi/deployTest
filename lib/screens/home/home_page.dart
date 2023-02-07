

import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:provider/provider.dart';

import '../../helper/screen_export.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<PageViewProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
            children:  [
             Expanded(child: 
             Container(
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
                  height: 40,
                ),
                Column(
                  children: provider.pages
                  .map(
                    (e) => e.showInSideBar == false
                        ? const Offstage()
                        : SideMenuItems(
                            onNext: () => provider.gotoPage(e.index),
                            title: e.title, icon: e.icon, height: e.height, width: e.width,
                          ),
                  )
                  .toList(),
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
    )
             ),
              Expanded(
                  flex: 5,
                  child: 
                 PageView(
                controller: provider.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: provider.pages.map((e) => e.page).toList(),
              )
              )
              ]),
    );
  }
}

class SideMenuItems extends StatelessWidget {
  const SideMenuItems({super.key, required this.title, required this.onNext, required this.icon, required this.width, required this.height});
  final String title;
  final String? icon;
  final double? width;
  final double? height;
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onNext,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(icon!, width:width, height: height,),
              SizedBox(width: 10,),
              Text(title,
              style: TextStyle(
                color: primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w500
              ),
              
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
      
    );
  }
}