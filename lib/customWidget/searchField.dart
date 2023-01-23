import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

class SearchField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final BorderRadius? borderRadius;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final int? maxLength;
  final bool? connectBorder;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText, errorText;

  // final bool readOnly,obscureText;
  final bool?  enabled, isDense;
  final String? hintText, initialValue;
  const SearchField({Key? key, this.controller, this.focusNode, this.keyboardType,
    this.onChanged, this.validator, this.onTap, this.onSaved, this.borderRadius,
    this.prefixIcon, this.suffixIcon, this.labelText, this.maxLength, this.connectBorder,
    this.errorBorderColor, this.focusBorderColor, this.inputFormatters, this.helperText,
    this.errorText,  this.enabled, this.isDense, this.hintText, this.initialValue}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
  final List<IconData> icons = [Icons.mail,Icons.phone,Icons.wallet_giftcard_rounded,Icons.check_circle_rounded];

   ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
        child:Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0XFFEAEBF1),
                borderRadius: BorderRadius.circular(48)
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: widget.keyboardType?? TextInputType.text,
                controller:widget.controller,
                focusNode: widget.focusNode,
                initialValue: widget.initialValue,
                validator: widget.validator,
                onTap: widget.onTap,
                enabled: widget.enabled,
                // readOnly: readOnly,
                inputFormatters: widget.inputFormatters,
                maxLength: widget.maxLength,
                // obscureText: obscureText,
                style:  TextStyle(
                    color: kyshiGreyishBlue,
                    fontSize:16.0 ,
                    fontWeight:  FontWeight.w300),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.symmetric(vertical:20,horizontal:60),
                  suffixIcon: InkWell(
                    onTap: (){
                      print("fjknjkfnjfn");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/16,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 35),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(48)),
                          child: const Text("Create offer",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'PushPenny'),),
                        ),
                        const SizedBox(width: 15,),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                            decoration: BoxDecoration(
                              color: const Color(0XFFFFFFFF),
                              borderRadius: BorderRadius.circular(48)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Export CSV",style: TextStyle(color: primaryLimeGreen),),
                                const SizedBox(width: 10,),
                                SvgPicture.asset(documentSvg),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isDense: widget.isDense,
                  errorText: widget.errorText,
                  hintStyle:  TextStyle(
                      color: kyshiGreyishBlue,
                      fontFamily: 'Gilroy',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300),
                  helperStyle: TextStyle(color: kyshiGreyishBlue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(48),
                    borderSide: const BorderSide(color: Color(0xffE6E7E9)),
                  ),
                  disabledBorder:  OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide: const BorderSide(color:Color(0xffE6E7E9)),
                  ),
                  labelText: '',
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius:  widget.borderRadius ??BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: widget.errorBorderColor ?? Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: widget.borderRadius ?? BorderRadius.circular(48),
                      borderSide:
                      BorderSide(color: widget.focusBorderColor ?? const Color(0xff9AA1B3))),
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(width: 2, color: Colors.black54))),
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset(filterSvg),
                                ),
                                const SizedBox(width: 4),
                                const Text("Filters"),
                                SizedBox(width: 4),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Icon(Icons.search_outlined,
                              color: kyshiGreyishBlue),
                        ],
                      ),
                    ),
                  ),
                  hintText: widget.hintText,
                ),
                onChanged:widget.onChanged,
                onSaved: widget.onSaved,
              ),
            ),
            const SizedBox(height: 10,),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                // height: MediaQuery.of(context).size.height / ,
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                  color:const Color(0XFFEAEBF1),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children:  [
                    UserAccountTable(title: "First Name",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "Last Name",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "Middle Name",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "Email Address",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "Phone Number",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "Date of Birth",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "BVN",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "Residence",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "Nationality",name: SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(names[index]));
                        },
                        itemCount: names.length,
                      ),
                    ),),
                    const SizedBox(width: 20,),
                    UserAccountTable(title: "Status",name:
                    SizedBox(
                      height: 620,
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
                        itemCount: names.length,
                      ),
                    )),
                    const SizedBox(width: 25,),
                    UserAccountTable(title: "Action",name:
                    SizedBox(
                      height: 620,
                      width: 100,
                      child: ListView.builder(
                        controller: controller,
                        physics: const PageScrollPhysics(),
                        itemBuilder: (context,index)=>
                          Container(
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
                        itemCount: names.length,
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class UserAccountTable extends StatelessWidget {
  final String? title;
  final Widget? name;
  final bool icons;
  final String? lastName;
  final String? middleName;
  final String? emailAddress;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? BVN;
  final String? residence;
  final String? status;
  final String? nationality;
  final String? action;
   const UserAccountTable({
    Key? key,this.title, this.lastName,
    this.middleName, this.emailAddress, this.phoneNumber,
    this.dateOfBirth, this.BVN, this.residence,
    this.status, this.nationality, this.action, this.name, this.icons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ?? "", style: TextStyle(color: primaryColor,
            fontFamily: 'PushPenny',fontWeight: FontWeight.w500,fontSize: 12),),
            const SizedBox(height: 40,),
          name ?? Container()
          ],
        ),

      ],
    );
  }
}
// Column(
//   children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       // mainAxisSize: MainAxisSize.min,
//       children:const [
//         Text("Firstname"),
//         Text("Lastname"),
//         Text("Middlename"),
//         Text("Email address"),
//         Text("Phone number"),
//         Text("Date of birth"),
//         Text("BVN"),
//         Text("Residence"),
//         Text("Nationality"),
//         Text("Status"),
//         Text("Action")
//       ],
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       // mainAxisSize: MainAxisSize.min,
//       children: [
//         const Text("Mohammed"),
//         const Text("Rabbebe"),
//         // SizedBox(width: 1,),
//         Text("Gbemileke"),
//         const Text("davidsamuel6158@gmail.com"),
//         Text("+2348148620099"),
//         Text("1990-08-21"),
//         Text("12356819823"),
//         Text("NG"),
//         Text("NG"),
//         Row(
//           children: [
//             Icon(Icons.card_giftcard_rounded),
//             Icon(Icons.phone_outlined),
//             Icon(Icons.email),
//             Icon(Icons.check_circle_rounded),
//           ],
//         ),
//         TextButton(
//             style: TextButton.styleFrom(
//                 backgroundColor: primaryColor,
//                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10)
//             ),
//             onPressed: (){}, child: Text("View"))
//       ],
//     )
//   ],
// ),
