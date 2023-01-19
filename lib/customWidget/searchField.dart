import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child:Container(
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
                  decoration: BoxDecoration(
                    color: const Color(0XFFFFFFFF),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text("Export CSV",style: TextStyle(color: primaryLimeGreen),),
                ),
              ),
              isDense: isDense,
              errorText: errorText,
              // color: Color(0xff6c757d),
              // fontSize: 14.0,
              // fontWeight: FontWeight.w300
              hintStyle:  TextStyle(
                  color: kyshiGreyishBlue,
                  fontFamily: 'Gilroy',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300),
              helperStyle: TextStyle(color: kyshiGreyishBlue),
              // labelStyle: labelTextstyle,
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
              prefixIcon: GestureDetector(
                onTap: () {},
                child: Container(
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
                        child: const Icon(Icons.filter),
                      ),
                      const SizedBox(width: 4),
                      Text("Filters"),
                      SizedBox(width: 4), // Icon(Icons.keyboard_arrow_down_outlined,
                      //     color: primaryDarkBlue),
                    ],
                  ),
                ),
              ),
              hintText: "Search user",
            ),
            onChanged: (value){
            },
            onSaved: onSaved,
          ),
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
