import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool createOffer;
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
    this.errorText,  this.enabled, this.isDense, this.hintText, this.initialValue, this.createOffer = false}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageViewProvider>(context);
    return Container(
      height: 70,
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
          contentPadding: const EdgeInsets.symmetric(vertical:40,horizontal:60),
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
                  InkWell(
                    onTap: () => pageProvider.gotoPage(PAGES.createAnOfferScreen),
                    child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 35),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(48)),
                    child: const Text("Create offer",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'PushPenny'),),
                                  ),
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


class CreateOfferTitleTable extends StatelessWidget {
  final String title;
   final Widget name;
   const CreateOfferTitleTable({
    Key? key, required this.title, required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: primaryColor,
        fontFamily: 'PushPenny',fontWeight: FontWeight.w500,fontSize: 12),),
       const SizedBox(height: 40,),
       name
      ],
    );
  }
}



class AllOfferTitleTable extends StatelessWidget {
  final String title;
   final Widget name;
   const AllOfferTitleTable({
    Key? key, required this.title, required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: primaryColor,
            fontFamily: 'PushPenny',fontWeight: FontWeight.w500,fontSize: 12),),
           const SizedBox(height: 40,),
           name
          ],
        ),
      ),
    );
  }
}


