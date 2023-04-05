import 'package:flutter/services.dart';

import '../helper/screen_export.dart';
import '../styleguide/colors.dart';

class SearchFieldDropdown extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function(String?)? connectOnChanged;
  final Function(String?)? onSaved;
  final BorderRadius? borderRadius;
  final String connect;
  final List<String> connectData;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  // final String? dropDownTitle;
  final int? maxLength;
  final bool? connectBorder;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText, errorText;

  // final bool readOnly,obscureText;
  final bool? enabled, isDense;
  final String? hintText, initialValue;
  const SearchFieldDropdown(
      {Key? key,
      this.controller,
      this.focusNode,
      this.keyboardType,
      this.onChanged,
      this.validator,
      this.onTap,
      this.onSaved,
      this.borderRadius,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.maxLength,
      this.connectBorder,
      this.errorBorderColor,
      this.focusBorderColor,
      this.inputFormatters,
      this.helperText,
      this.errorText,
      this.enabled,
      this.isDense,
      this.hintText,
      this.initialValue, required this.connect, this.connectOnChanged,required this.connectData})
      : super(key: key);

  @override
  State<SearchFieldDropdown> createState() => _SearchFieldDropdownState();
}

class _SearchFieldDropdownState extends State<SearchFieldDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: const Color(0XFFEAEBF1),
          borderRadius: BorderRadius.circular(48)),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller,
        focusNode: widget.focusNode,
        initialValue: widget.initialValue,
        validator: widget.validator,
        onTap: widget.onTap,
        enabled: widget.enabled,
        // readOnly: readOnly,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        // obscureText: obscureText,
        style: TextStyle(
            color: kyshiGreyishBlue,
            fontSize: 16.0,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
          suffixIcon: InkWell(
            onTap: () {
              print("fjknjkfnjfn");
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 13, horizontal: 35),
                  //   decoration: BoxDecoration(
                  //       color: primaryColor,
                  //       borderRadius: BorderRadius.circular(48)),
                  //   child: const Text("Create offer",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'PushPenny'),),
                  // ),
                  // const SizedBox(width: 15,),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                        color: const Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.circular(48)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Export CSV",
                          style: TextStyle(color: primaryLimeGreen),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
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
          hintStyle: TextStyle(
              color: kyshiGreyishBlue,
              fontFamily: 'Gilroy',
              fontSize: 16.0,
              fontWeight: FontWeight.w300),
          helperStyle: TextStyle(color: kyshiGreyishBlue),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(48),
            borderSide: const BorderSide(color: Color(0xffE6E7E9)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xffE6E7E9)),
          ),
          labelText: '',
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(48),
              borderSide: const BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: widget.errorBorderColor ?? Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(48),
              borderSide: BorderSide(
                  color: widget.focusBorderColor ?? const Color(0xff9AA1B3))),
          prefixIcon: Container(
            width: 150,
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
                color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(20),
              // border: Border.all(color: primaryColor,width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: Colors.white,
                          elevation: 1,
                          // Initial Value
                          value: widget.connect,
                          selectedItemBuilder: (BuildContext context) {
                            return widget.connectData.map((String items) {
                              return Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: widget.connect,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: primaryColor,
                                          fontFamily: "PushPenny"),
                                    ),
                                  )
                                //             Text(
                                //   dropdownvalue,
                                //   style: const TextStyle( fontWeight: FontWeight.w500,
                                //                 fontSize: 16,
                                //                 color: Color(0xff0D2C65) ),
                                // ),
                              );
                            }).toList();
                          },
                          // Down Arrow Icon
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 22,
                            color: primaryColor.withOpacity(0.4),
                          ),

                          // Array list of items
                          items: widget.connectData.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Container(
                                // width:double.infinity,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xffDDDDDD), width: 0.5))),
                                child: Text(
                                  items,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                              ),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: widget.connectOnChanged
                        //     (String? newValue) {
                        //   setState(() {
                        //     dropdownvalue = newValue!;
                        //   });
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           padding:
          //               const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
          //           decoration: BoxDecoration(
          //               border: Border.all(color: primaryColor),
          //               borderRadius: BorderRadius.circular(20)),
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //               Text(
          //                 widget.dropDownTitle ?? "",
          //                 style: TextStyle(
          //                     color: primaryColor,
          //                     fontFamily: 'PushPenny',
          //                     fontSize: 14,
          //                     fontWeight: FontWeight.w500),
          //               ),
          //               SvgPicture.asset("assets/images/down-arrow.svg")
          //             ],
          //           ),
          //         ),
          //         Container(
          //           decoration: const BoxDecoration(
          //               border: Border(
          //                   right:
          //                       BorderSide(width: 2, color: Colors.black54))),
          //           padding: const EdgeInsets.symmetric(horizontal: 13),
          //           margin:
          //               const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Container(
          //                 decoration: const BoxDecoration(
          //                   shape: BoxShape.circle,
          //                 ),
          //                 width: 20,
          //                 height: 20,
          //                 child: SvgPicture.asset(filterSvg),
          //               ),
          //               const SizedBox(width: 4),
          //               const Text("Filters"),
          //               SizedBox(width: 4),
          //             ],
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         Icon(Icons.search_outlined, color: kyshiGreyishBlue),
          //       ],
          //     ),
          //   ),
          // ),
          hintText: widget.hintText,
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
      ),
    );
  }
}
