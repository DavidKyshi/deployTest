import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

class SearchField extends StatelessWidget {
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
                keyboardType: keyboardType?? TextInputType.text,
                controller:controller,
                focusNode: focusNode,
                initialValue: initialValue,
                validator: validator,
                onTap: onTap,
                enabled: enabled,
                // readOnly: readOnly,
                inputFormatters: inputFormatters,
                maxLength: maxLength,
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
                          child: const Text("Create offer"),
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
                  isDense: isDense,
                  errorText: errorText,
                  hintStyle:  TextStyle(
                      color: kyshiGreyishBlue,
                      fontFamily: 'Gilroy',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300),
                  helperStyle: TextStyle(color: kyshiGreyishBlue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(48),
                    borderSide: const BorderSide(color: Color(0xffE6E7E9)),
                  ),
                  disabledBorder:  OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(8),
                    borderSide: const BorderSide(color:Color(0xffE6E7E9)),
                  ),
                  labelText: '',
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius:  borderRadius ??BorderRadius.circular(48),
                      borderSide: const BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: borderRadius ?? BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: errorBorderColor ?? Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: borderRadius ?? BorderRadius.circular(48),
                      borderSide:
                      BorderSide(color: focusBorderColor ?? const Color(0xff9AA1B3))),
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
                  hintText: hintText,
                ),
                onChanged:onChanged,
                onSaved: onSaved,
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
              // height: MediaQuery.of(context).size.height / ,
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                color:const Color(0XFFEAEBF1),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Firstname"),
                      SizedBox(height: 40,),
                      Text("Mohammed"),
                      SizedBox(height: 20,),
                      Text("Bright"),
                      SizedBox(height: 20,),
                      Text("Motosho"),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lastname"),
                      SizedBox(height: 40,),
                      Text("Rabbebe"),
                      SizedBox(height: 20,),
                      Text("George"),
                      SizedBox(height: 20,),
                      Text("Tobiloba"),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
        // Container(
        //   height:50,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(48),
        //     color: searchBarColor
        //   ),
        //   child: Row(
        //     children: <Widget>[
        //       Row(
        //         children:  [
        //           const Icon(Icons.filter),
        //           const Text("Filters"),
        //           const VerticalDivider(),
        //           SizedBox(
        //             height: 30,
        //               width: 150,
        //               child:
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      )
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