import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:provider/provider.dart';

import '../../customWidget/searchField.dart';
import '../../models/users.dart';
import '../../providers/users.dart';

class UserAccountIndex extends StatefulWidget {
  const UserAccountIndex({Key? key}) : super(key: key);

  @override
  State<UserAccountIndex> createState() => _UserAccountIndexState();
}

class _UserAccountIndexState extends State<UserAccountIndex> {
  Users? user;
  final List<String> names = ["Mohammed","Rab","Gbemi","david","Tobiloba","George","Bright",
    "Mohammed","Rab","Gbemi","david","Tobiloba","George","Bright","Mohammed","Rab","Gbemi","david","Tobiloba","George","Bright"];
  final List<Widget> action = [Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(24)
        ),
        child: const Text("View",style: TextStyle(fontFamily: "PushPenny",
            fontWeight: FontWeight.w400,color: Colors.white,fontSize: 10),),
      ),
      const SizedBox(height: 30,)
    ],
  )];
  final List<int> ages = [1,2,3,4,5];
  final List<IconData> icons = [Icons.mail,Icons.phone,Icons.wallet_giftcard_rounded,Icons.check_circle_rounded];

  ScrollController? controller;

  @override
  void initState() {
    // TODO: implement initState
    user = Provider.of<UsersProvider>(context, listen: false).users;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageViewProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
            child:Column(
              children: [
                const SearchField(),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                    height:600,
                    width: MediaQuery.of(context).size.width,
                    decoration:  BoxDecoration(
                        color:const Color(0XFFEAEBF1),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        UserAccountTable(title: "First Name",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].firstName ?? ""));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "Last Name",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].lastName ?? "No Name"));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "Middle Name",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].middleName ?? "No name"));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "Email Address",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].email ?? "No Email"));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "Phone Number",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].phoneNumber ?? "No Email"));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "Date of Birth",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].phoneNumber ?? "No Age"));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "BVN",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].bvn ?? "No Age"));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "Residence",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].countryOfResidence ?? "Homeless"));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "Nationality",name: SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(user?.data![index].nationality1 ?? "No country"));
                            },
                            itemCount: user?.data?.length,
                          ),
                        ),),
                        const SizedBox(width: 10,),
                        UserAccountTable(title: "Status",name:
                        SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index){
                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: [
                                    Icon(icons[0],size: 18,color: const Color(0XFF23CE6B).withOpacity(0.4),),
                                    Icon(icons[1],size: 18,color: const Color(0XFF23CE6B).withOpacity(0.4),),
                                    Icon(icons[2],size: 18,color: const Color(0XFFFF5C5C).withOpacity(0.4),),
                                    Icon(icons[3],size: 18,color: const Color(0XFF23CE6B).withOpacity(0.4),),
                                  ],
                                ),
                              );
                            },
                            itemCount: user?.data?.length,
                          ),
                        )),
                        const SizedBox(width: 25,),
                        UserAccountTable(title: "Action",name:
                        SizedBox(
                          height: 500,
                          width: 100,
                          child: ListView.builder(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            itemBuilder: (context,index)=>
                                InkWell(
                                  onTap: () => pageProvider.gotoPage(PAGES.home),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(24)
                                      ),
                                      child: const Text("View",style: TextStyle(fontFamily: "PushPenny",
                                          fontWeight: FontWeight.w400,color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
                                    ),
                                  ),
                                ),
                            itemCount: user?.data?.length,
                          ),
                        ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}