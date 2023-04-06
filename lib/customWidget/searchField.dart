import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/providers/kyshi_account_beneficiary_list.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:provider/provider.dart';

import '../providers/kyshi_wallet_beneficiary_list.dart';
import '../providers/wallet_balance.dart';
import '../widgets/kyshiTextFieldWithLabel.dart';
import '../widgets/kyshi_responsive_button.dart';

class SearchField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? exportCvsTap;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Function()? onTapPrefixIcon;
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
  final bool? enabled, isDense;
  final String? hintText, initialValue;
  const SearchField(
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
      this.initialValue,
      this.createOffer = false,
      this.exportCvsTap, this.onTapPrefixIcon})
      : super(key: key);

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
              const EdgeInsets.symmetric(vertical: 35, horizontal: 60),
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
                  widget.createOffer?
                  InkWell(
                    onTap: () {
                      Provider.of<WalletBalanceProvider>(context, listen: false)
                          .getAllWalletBalanceResponse(context);
                      Provider.of<KyshiBeneficiaryWalletProvider>(context,
                              listen: false)
                          .getAllKyshiUserWalletData();
                          Provider.of<KyshiBeneficiaryAccountProvider>(context,
                              listen: false)
                          .getAllUserBeneficiaryList(context);
                         
                      pageProvider.gotoPage(PAGES.createAnOfferScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 35),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(48)),
                      child: const Text(
                        "Create offer",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PushPenny'),
                      ),
                    ),
                  )
                    : const SizedBox(),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: widget.exportCvsTap,
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ),
          prefixIcon: InkWell(
            onTap:widget.onTapPrefixIcon,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //   padding:
                  //   const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: primaryColor),
                  //       borderRadius: BorderRadius.circular(20)),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Text(
                  //         "big name",
                  //         style: TextStyle(
                  //             color: primaryColor,
                  //             fontFamily: 'PushPenny',
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //       SvgPicture.asset("assets/images/down-arrow.svg")
                  //     ],
                  //   ),
                  // ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            right:
                            BorderSide(width: 2, color: Colors.black54))),
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    margin:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
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
                         Text("Filters",style: TextStyle(color: kyshiGreyishBlue,
                             fontFamily: 'PushPenny',fontWeight: FontWeight.w400,fontSize: 14),),
                        SizedBox(width: 4),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.search_outlined, color: kyshiGreyishBlue),
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
         
          hintText: widget.hintText,
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
      ),
    );
  }


}

class SearchField2 extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? exportCvsTap;
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
  final bool? enabled, isDense;
  final String? hintText, initialValue;
  const SearchField2(
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
      this.initialValue,
      this.createOffer = false,
      this.exportCvsTap})
      : super(key: key);

  @override
  State<SearchField2> createState() => _SearchField2State();
}

class _SearchField2State extends State<SearchField2> {
    String _searchQuery = '';

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });

    widget.onChanged!(_searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageViewProvider>(context);
    return Container(
      height: 70,
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
              const EdgeInsets.symmetric(vertical: 35, horizontal: 60),
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
                  widget.createOffer?
                  InkWell(
                    onTap: () {
                      Provider.of<WalletBalanceProvider>(context, listen: false)
                          .getAllWalletBalanceResponse(context);
                      Provider.of<KyshiBeneficiaryWalletProvider>(context,
                              listen: false)
                          .getAllKyshiUserWalletData();
                          Provider.of<KyshiBeneficiaryAccountProvider>(context,
                              listen: false)
                          .getAllUserBeneficiaryList(context);
                         
                      pageProvider.gotoPage(PAGES.createAnOfferScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 35),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(48)),
                      child: const Text(
                        "Create offer",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PushPenny'),
                      ),
                    ),
                  )
                    : const SizedBox(),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: widget.exportCvsTap,
                    child: Container(
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
         
          hintText: widget.hintText,
        ),
        onChanged: _updateSearchQuery,
        onSaved: widget.onSaved,
      ),
    );
  }
}


class UserAccountTableRow extends StatelessWidget {
  const UserAccountTableRow({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: TextStyle(
          color: primaryColor,
          fontFamily: 'PushPenny',
          fontWeight: FontWeight.w500,
          fontSize: 12),
    );
  }
}

class UserAccountTableCell extends StatelessWidget {
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
  const UserAccountTableCell({
    Key? key,
    this.title,
    this.lastName,
    this.middleName,
    this.emailAddress,
    this.phoneNumber,
    this.dateOfBirth,
    this.BVN,
    this.residence,
    this.status,
    this.nationality,
    this.action,
    this.name,
    this.icons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   title ?? "",
            //   style: TextStyle(
            //       color: primaryColor,
            //       fontFamily: 'PushPenny',
            //       fontWeight: FontWeight.w500,
            //       fontSize: 12),
            // ),
            // const SizedBox(
            //   height: 40,
            // ),
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
  const CreateOfferTitleTable(
      {Key? key, required this.title, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: primaryColor,
              fontFamily: 'PushPenny',
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
        const SizedBox(
          height: 40,
        ),
        name
      ],
    );
  }
}

class AllOfferTitleTable extends StatelessWidget {
  final String title;
  final Widget name;
  const AllOfferTitleTable({Key? key, required this.title, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: primaryColor,
                  fontFamily: 'PushPenny',
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 40,
            ),
            name
          ],
        ),
      ),
    );
  }
}

class FilterField extends StatefulWidget {
  final String dropDownValue;
  final List<String> data;
  final String label;
  final Function (String?)? onChangedData;
  const FilterField({Key? key, required this.dropDownValue,
    required this.data, required this.label,required this.onChangedData}) : super(key: key);

  @override
  State<FilterField> createState() => _FilterFieldState();
}

class _FilterFieldState extends State<FilterField> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0XFFF8F9FE),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        hintStyle: TextStyle(
            color: Color(0xff6c757d).withOpacity(0.3),
            fontFamily: 'Gilroy',
            fontSize: 16.0,
            fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffE6E7E9)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff9AA1B3)),
        ),
        labelText: widget.label,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff9AA1B3))),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Colors.white,
          elevation: 1,
          // Initial Value
          value: widget.dropDownValue,
          selectedItemBuilder: (BuildContext context) {
            return widget.data.map((String items) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: RichText(
                  text: TextSpan(
                    text: widget.dropDownValue,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: primaryColor,
                        fontFamily: "PushPenny"),
                  ),
                ),
              );
            }).toList();
          },
          // Down Arrow Icon
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 18,
            color: Color(0xff23CE6B),
          ),

          // Array list of items
          items: widget.data.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Container(
                // width:double.infinity,
                //alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xffDDDDDD), width: 0.5))),
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
          onChanged: widget.onChangedData,
        ),
      ),
    );;
  }
}

