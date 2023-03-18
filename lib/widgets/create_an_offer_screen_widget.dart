// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/providers/kyshi_account_beneficiary_list.dart';
import 'package:kyshi_operations_dashboard/providers/wallet_balance.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/transaction_details_popup.dart';

import '../helper/screen_export.dart';
import '../providers/kyshi_wallet_beneficiary_list.dart';

class CreateAnOfferButtonContainer extends StatelessWidget {
  CreateAnOfferButtonContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 485.7,
      height: 61,
      decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          border: Border.all(color: const Color(0xffF3F3F3)),
          borderRadius: BorderRadius.circular(48)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xff233375),
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class CreateAnOfferCard extends StatefulWidget {
  const CreateAnOfferCard({super.key});

  @override
  State<CreateAnOfferCard> createState() => _CreateAnOfferCardState();
}

class _CreateAnOfferCardState extends State<CreateAnOfferCard> {
  bool _isTopTextFieldSelected = true;
  TextEditingController _topTextFieldController = TextEditingController();
  TextEditingController _bottomTextFieldController = TextEditingController();
  String senderDropdownvalue = '🇳🇬 NGN';

  // List of items in our dropdown menu
  var senderCurrency = ['🇬🇧 GBP', '🇳🇬 NGN', '🇱🇷 USD'];

  String recieverDropdownvalue = '🇬🇧 GBP';

  // List of items in our dropdown menu
  var recieverCurrency = ['🇬🇧 GBP', '🇳🇬 NGN', '🇱🇷 USD'];

  void _switchTextFields() {
    setState(() {
      _isTopTextFieldSelected = !_isTopTextFieldSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final result =
        _isTopTextFieldSelected ? senderDropdownvalue : recieverDropdownvalue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 485.7,
          height: 622.68,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff8C8C8C)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create an offer',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                            color: primaryColor),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 306,
                            height: 71,
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                  color: Color(0xff233375),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                              controller: _isTopTextFieldSelected
                                  ? _topTextFieldController
                                  : _bottomTextFieldController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      bottom: 35.5, left: 20, top: 35.5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  labelText: "You send",
                                  labelStyle: TextStyle(
                                      color: Color(0xff6E80A3),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  hintText: '0.00',
                                  hintStyle: TextStyle(
                                      color: Color(0xff233375),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Container(
                            width: 138,
                            height: 71,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
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
                                        value: senderDropdownvalue,
                                        selectedItemBuilder:
                                            (BuildContext context) {
                                          return senderCurrency
                                              .map((String items) {
                                            return Center(
                                                child: RichText(
                                              text: TextSpan(
                                                text: _isTopTextFieldSelected
                                                    ? senderDropdownvalue
                                                    : recieverDropdownvalue,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ));
                                          }).toList();
                                        },
                                        // Down Arrow Icon
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Color(0xff23CE6B),
                                        ),

                                        // Array list of items
                                        items:
                                            senderCurrency.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Container(
                                              // width:double.infinity,
                                              alignment: Alignment.centerLeft,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 8.0, 0, 6.0),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              Color(0xffDDDDDD),
                                                          width: 0.5))),
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
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            senderDropdownvalue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      ////Send textfield
                      ///
                      InkWell(
                        onTap: _switchTextFields,
                        child: Container(
                          height: 70,
                          width: 145,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/swapIcon.png',
                                width: 26,
                                height: 74,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 60,
                                height: 21,
                                color: const Color(0xff233375),
                                child: const Center(
                                  child: Text(
                                    'Swap',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                // result !=null ?
                                senderDropdownvalue == '🇳🇬 NGN'
                                    ? '₦0.00'
                                    : senderDropdownvalue == '🇬🇧 GBP'
                                        ? '£0.00'
                                        : '\$0.00'
                                // :
                                // recieverDropdownvalue =='🇳🇬 NGN'? '₦0.00': recieverDropdownvalue == '🇬🇧 GBP'?'£0.00':'\$0.00'

                                ,
                                style: TextStyle(
                                    color: Color(0xff6F6F6F),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ),

                      ////Receive textfield
                      ///
                      Row(
                        children: [
                          SizedBox(
                            width: 306,
                            height: 71,
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(
                                  color: Color(0xff233375),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                              controller: _isTopTextFieldSelected
                                  ? _bottomTextFieldController
                                  : _topTextFieldController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      bottom: 35.5, left: 20, top: 35.5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  //border: InputBorder.none,
                                  labelText: "Recipient gets",
                                  labelStyle: TextStyle(
                                      color: Color(0xff6E80A3),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  hintText: '0.00',
                                  hintStyle: TextStyle(
                                      color: Color(0xff233375),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Container(
                            width: 138,
                            height: 71,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
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
                                        value: recieverDropdownvalue,
                                        selectedItemBuilder:
                                            (BuildContext context) {
                                          return recieverCurrency
                                              .map((String items) {
                                            return Center(
                                                child: RichText(
                                              text: TextSpan(
                                                text: _isTopTextFieldSelected
                                                    ? recieverDropdownvalue
                                                    : senderDropdownvalue,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ));
                                          }).toList();
                                        },
                                        // Down Arrow Icon
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Color(0xff23CE6B),
                                        ),

                                        // Array list of items
                                        items: recieverCurrency
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 8.0, 0, 6.0),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color:
                                                              Color(0xffDDDDDD),
                                                          width: 0.5))),
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
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            recieverDropdownvalue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 485.7,
                  height: 243.66,
                  decoration: BoxDecoration(
                      color: const Color(0xffF8F9FE),
                      border: Border.all(color: const Color(0xffE8E8E8)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Summary',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Amount we’ll covert',
                                  style: TextStyle(
                                      color: Color(0xff6E80A3),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                _topTextFieldController.text.isNotEmpty
                                    ? Text(
                                        '£ $_topTextFieldController.text',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      )
                                    : SizedBox(),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Total to Pay',
                                  style: TextStyle(
                                      color: Color(0xff6E80A3),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '£0.00',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/circle.png',
                                      width: 15,
                                      height: 15,
                                    ),
                                    const Text(
                                      'Your suggested rate',
                                      style: TextStyle(
                                          color: Color(0xff6E80A3),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '£1/₦',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 72.4,
                                      height: 33.94,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xff6E80A3),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Average duration',
                                  style: TextStyle(
                                      color: Color(0xff6E80A3),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  '40 Mins',
                                  style: TextStyle(
                                      color: Color(0xff04CE9D),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        SearchBeneficiary(
          beneficiaryCurrency: recieverDropdownvalue,
        )
      ],
    );
  }
}

class ExchangeTextField extends StatelessWidget {
  const ExchangeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 306,
          height: 71,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffD1D1D1)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Center(
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '0.00',
                    hintStyle: TextStyle(
                        color: Color(0xff233375),
                        fontSize: 24,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ),
        CurrencyDropDown()
      ],
    );
  }
}

class CurrencyDropDown extends StatefulWidget {
  CurrencyDropDown({super.key});

  @override
  State<CurrencyDropDown> createState() => _CurrencyDropDownState();
}

class _CurrencyDropDownState extends State<CurrencyDropDown> {
  String dropdownvalue = '🇬🇧 GBP';

  // List of items in our dropdown menu
  var currency = ['🇬🇧 GBP', '🇳🇬 NGN', '🇱🇷 USD'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138,
      height: 71,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
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
                  value: dropdownvalue,
                  selectedItemBuilder: (BuildContext context) {
                    return currency.map((String items) {
                      return Center(
                          child: RichText(
                        text: TextSpan(
                          text: dropdownvalue,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white),
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
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff23CE6B),
                  ),

                  // Array list of items
                  items: currency.map((String items) {
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
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginatedDataDropDown extends StatefulWidget {
  const PaginatedDataDropDown({super.key});

  @override
  State<PaginatedDataDropDown> createState() => _PaginatedDataDropDownState();
}

class _PaginatedDataDropDownState extends State<PaginatedDataDropDown> {
  String dropdownvalue = '100';

  // List of items in our dropdown menu
  // var currency = ['🇬🇧 GBP', '🇳🇬 NGN', '🇱🇷 USD'];
  var currency = ['100', '150', '300', '400', "500"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
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
                  value: dropdownvalue,
                  selectedItemBuilder: (BuildContext context) {
                    return currency.map((String items) {
                      return Center(
                          child: RichText(
                        text: TextSpan(
                          text: dropdownvalue,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: primaryColor),
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
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                  ),

                  // Array list of items
                  items: currency.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Container(
                        // width:double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xffDDDDDD), width: 0.3))),
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
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      Provider.of<UsersProvider>(context, listen: false)
                          .getUsers(context: context, entrySize: dropdownvalue);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryBox extends StatelessWidget {
  const SummaryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 485.7,
      height: 243.66,
      decoration: BoxDecoration(
          color: const Color(0xffF8F9FE),
          border: Border.all(color: const Color(0xffE8E8E8)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Amount we’ll covert',
                      style: TextStyle(
                          color: Color(0xff6E80A3),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '£1000.00',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Total to Pay',
                      style: TextStyle(
                          color: Color(0xff6E80A3),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '£0.00',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/circle.png',
                          width: 15,
                          height: 15,
                        ),
                        const Text(
                          'Your suggested rate',
                          style: TextStyle(
                              color: Color(0xff6E80A3),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '£1/₦',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 72.4,
                          height: 33.94,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff6E80A3),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '0',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Average duration',
                      style: TextStyle(
                          color: Color(0xff6E80A3),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '40 Mins',
                      style: TextStyle(
                          color: Color(0xff04CE9D),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchBeneficiary extends StatefulWidget {
  const SearchBeneficiary({super.key, required this.beneficiaryCurrency});
  final String beneficiaryCurrency;
  @override
  State<SearchBeneficiary> createState() => _SearchBeneficiaryState();
}

class _SearchBeneficiaryState extends State<SearchBeneficiary> {
  TextEditingController _searchController = TextEditingController();
  KyshiBeneficiaryWalletProvider get kyshiBeneficiaryWalletProvider =>
      Provider.of<KyshiBeneficiaryWalletProvider>(context, listen: false);
  WalletBalanceProvider get walletBalanceProvider =>
      Provider.of<WalletBalanceProvider>(context, listen: false);
        KyshiBeneficiaryAccountProvider get kyshiBeneficiaryAccountProvider =>
      Provider.of<KyshiBeneficiaryAccountProvider>(context, listen: false);
      
  List<String> _filteredFruits = [];
  List<String> _fruits = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
  ];
  @override
  void initState() {
    super.initState();
    _filteredFruits = _fruits;
  }

  bool _isUserWalletVisible = false;
  bool forIos = false;
  void showToast() {
    setState(() {
      _isUserWalletVisible = !_isUserWalletVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final walletBalance = walletBalanceProvider.walletBalance;
    bool isSearching = false;
    return Container(
      width: 485.7,
      height: 578.6,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff8C8C8C),
          ),
          borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 444,
              height: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: primaryColor)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            searchIcon,
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 300,
                            //color: Colors.blue,
                            child: TextField(
                              autofocus: true,
                              controller: _searchController,
                              onChanged: (searchTerm) {
                                setState(() {
                                  isSearching == true;
                                  _filteredFruits = _fruits
                                      .where((fruit) => fruit
                                          .toLowerCase()
                                          .contains(searchTerm.toLowerCase()))
                                      .toList();
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Search existing beneficiary or wallet',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: primaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 38,
                        height: 14,
                        decoration: BoxDecoration(
                            color: Color(0xff7880AA),
                            borderRadius: BorderRadius.circular(2)),
                        child: Center(
                          child: Text(
                            widget.beneficiaryCurrency == '🇳🇬 NGN'
                                ? 'N NGN'
                                : widget.beneficiaryCurrency == '🇱🇷 USD'
                                    ? '\$ USD'
                                    : '£ GBP',
                            style: TextStyle(
                                fontSize: 9,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (_searchController.text.isNotEmpty)
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 444,
                    decoration: BoxDecoration(
                        color: Color(0xffF8F9FE),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(16.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kyshi Wallet',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: primaryColor),
                          ),
                          Divider(
                            color: Color(0xff6E80A3),
                          ),
                          ...walletBalanceProvider.walletBalance
                              .map((walletBalance) => widget
                                          .beneficiaryCurrency ==
                                      '🇳🇬 NGN'
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        walletBalance.currency == "NGN"
                                            ? Image.asset(
                                                ngnWalletBalanceFlag,
                                                width: 30,
                                                height: 30,
                                              )
                                            : SizedBox(),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        walletBalance.currency == "NGN"
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'NGN wallet balance',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color: primaryColor),
                                                  ),
                                                  Text(
                                                    '₦${walletBalance.availableBalance.toString()} ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff6E80A3)),
                                                  )
                                                ],
                                              )
                                            : SizedBox()
                                      ],
                                    )
                                  : widget.beneficiaryCurrency == '🇱🇷 USD'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            walletBalance.currency == "USD"
                                                ? Image.asset(
                                                    usdWalletBalanceFlag,
                                                    width: 30,
                                                    height: 30,
                                                  )
                                                : SizedBox(),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            walletBalance.currency == "USD"
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'USD wallet balance',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            color:
                                                                primaryColor),
                                                      ),
                                                      Text(
                                                        '\$${walletBalance.availableBalance.toString()} ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff6E80A3)),
                                                      )
                                                    ],
                                                  )
                                                : SizedBox()
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            walletBalance.currency == "GBP"
                                                ? Image.asset(
                                                    gbpWalletBalanceFlag,
                                                    width: 30,
                                                    height: 30,
                                                  )
                                                : SizedBox(),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            walletBalance.currency == "GBP"
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'GBP wallet balance',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            color:
                                                                primaryColor),
                                                      ),
                                                      Text(
                                                        '£${walletBalance.availableBalance.toString()} ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff6E80A3)),
                                                      )
                                                    ],
                                                  )
                                                : SizedBox()
                                          ],
                                        ))
                              .toList(),

                          SizedBox(
                            height: 30,
                          ),
                          // ////Exsiting user wallet
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Existing users wallet ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: primaryColor),
                              ),
                              GestureDetector(
                                onTap: showToast,
                                child: Text(
                                  _isUserWalletVisible
                                      ? 'Tap to hide'
                                      : 'View all',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: kyshiGreen),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 15,
                          ),

                          Visibility(
                            visible: _isUserWalletVisible,
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ...kyshiBeneficiaryWalletProvider
                                          .allKyshiUserWalletData
                                          .map((allKyshiUserWalletData) =>
                                              widget.beneficiaryCurrency ==
                                                      '🇳🇬 NGN'
                                                  ? InkWell(
                                                    onTap: (){
                                                      showDialog(
                      context: context,
                      builder: (ctx) =>  AlertDialog(
                      insetPadding: const EdgeInsets.all(20),
                      shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                        content: SizedBox(
                          height: 791.03,
                          width: 687,
                          child: SingleChildScrollView(
                            child: Padding(
                            padding:  const EdgeInsets.fromLTRB(
                                        30, 30, 30, 0),
                              child: Column(
                                children: [
                                  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Transaction details',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 28,
                                                      color: primaryColor,
                                                      fontFamily: "PushPenny"),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image.asset(
                                                  'assets/images/cancel.png',
                                                  width: 40,
                                                  height: 40,
                                                ))
                                          ],
                                        ),

                                        Container(
                                          width: 421,
                                          height: 451.76,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF8F9FE),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Color(0xff8C8C8C))
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                                            child: Column(
                                              children: [
                                                // ///Offer reference
                                                Row(
                                                  mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('OFFER REFERENCE',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                    Text('#1234567890',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    )
                                                  ],
                                                ),
                                                Divider(),
                                            //  end of Offer reference
                                            Row(
                                              children: [
                                                Text('You are sending',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('£1000.00',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),

                                            // end of you're sending

                                             Row(
                                              children: [
                                                Text('Exchange type',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('Swap',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of exchange type
                                            
                                             Row(
                                              children: [
                                                Text('Service charge',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('10.00 GBP',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of service charge

                                             Row(
                                              children: [
                                                Text('Amount we’ll convert',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('1000.00 GBP',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of Amount we’ll convert
                                             
                                              Row(
                                              children: [
                                                Text('Exchange rate',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('£1/₦970',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of Exchange rate
                                            Divider(),
                                            // Recipient will recieve
                                            Row(
                                              children: const [
                                                Text('Recipient will recieve',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('₦970,000.00',
                                                style: TextStyle(
                                                      color: Color(0xff233375),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                                // end of Recipient will recieve
                                            //     Row(
                                            //   children: [
                                            //     Text('Delivery time'),
                                            //     Text('40 Mins')
                                            //   ],
                                            // ),
                                             // end of Delivery time
                                             Divider(),
                                             Text('Money for up keeping for the month of July',
                                              style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                             ),
                                              // if beneficiary dosen't exsist
                                              Container(
                                                width: 421,
                                                height: 48.8,
                                                color: Colors.white,
                                                child: Row(
                                                  children: [
                                                    Text('Save beneficiary',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                    CupertinoSwitch(
  // overrides the default green color of the track
  activeColor: Colors.pink.shade200,
  // color of the round icon, which moves from right to left
  thumbColor: Colors.green.shade900,
  // when the switch is off
  trackColor: Colors.black12,
  // boolean variable value
  value: forIos,
  // changes the state of the switch
  onChanged: (value) => setState(() => forIos = value),
),

                                                  ],
                                                ),
                                              )
                                              ],
                                            ),
                                          ),
                                        ),
                                       Container(
                                          width: 421,
                                          height: 451.76,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF8F9FE),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Color(0xff8C8C8C))
                                          ),
                                          child:Column(
                                            children: [
                                              Text('RECIPIENT DETAILS',
                                              style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                              ),
                                              Divider(),
                                              Row(
                                                children: [
                                                  Image.asset(ngnWalletBalanceFlag, width: 30, height: 30,),
                                                  Column(
                                                    children: [
                                                      Text('Jumoke Adeyinka',
                                                      style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                      ),
                                                      Text('0123498926',
                                                       style: TextStyle(
                                                    color: Color(0xff6E80A3),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ), 
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap:(){
                                                Navigator.of(context).pop;
                                                  confirmPopUp(context);

                                                
                                              },
                                              child: Container(
                                                width: 203,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Center(child: Text('Confirm & Pay',
                                                                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                                ),
                                                )),
                                              ),
                                            ),

                                             Container(
                                              width: 203,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF8F9FE),
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Color(0xffDDDDDD))
                                              ),
                                              child: Center(child: Text('Cancel',
                                                                                             style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: primaryColor
                                              ),
                                              )),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                              ),
                          ),
                        ),
                        
                      ),
                    );
                                                    },
                                                    child: Row(
                                                        children: [
                                                          allKyshiUserWalletData
                                                                      .currency ==
                                                                  "NGN"
                                                              //&& allKyshiUserWalletData.status=="ACTIVE"
                                                              ? Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      ngnWalletBalanceFlag,
                                                                      width: 30,
                                                                      height: 30,
                                                                    ),
                                                                    SizedBox(width: 20,),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        RichText(
                                                                            text: TextSpan(
                                                                                text: allKyshiUserWalletData.userFirstName.toString(),
                                                                                style: TextStyle(color: primaryColor, fontFamily: "PushPenny", fontWeight: FontWeight.w400, fontSize: 14),
                                                                                children: [
                                                                              TextSpan(
                                                                                  text: ' . ',
                                                                                  style: TextStyle(
                                                                                    color: kyshiGreen,
                                                                                    fontWeight: FontWeight.w600, fontSize: 28
                                                                                  ),
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'NGN',
                                                                                      style: TextStyle(
                                                                                        color: Color(0xff6E80A3),
                                                                                        fontFamily: "PushPenny", fontWeight: FontWeight.w400, fontSize: 14
                                                                                      ),
                                                                                    )
                                                                                  ])
                                                                            ])),
                                                                        Text(
                                                                            '₦${allKyshiUserWalletData.availableBalance.toString()}'),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )
                                                              : SizedBox(),
                                                        ],
                                                      ),
                                                  )
                                                  : widget.beneficiaryCurrency ==
                                                          '🇱🇷 USD'
                                                      ? InkWell(
                                                        onTap: (){
                                                          showDialog(
                      context: context,
                      builder: (ctx) =>  AlertDialog(
                      insetPadding: const EdgeInsets.all(20),
                      shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                        content: SizedBox(
                          height: 791.03,
                          width: 687,
                          child: SingleChildScrollView(
                            child: Padding(
                            padding:  const EdgeInsets.fromLTRB(
                                        30, 30, 30, 0),
                              child: Column(
                                children: [
                                  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Transaction details',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 28,
                                                      color: primaryColor,
                                                      fontFamily: "PushPenny"),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image.asset(
                                                  'assets/images/cancel.png',
                                                  width: 40,
                                                  height: 40,
                                                ))
                                          ],
                                        ),

                                        Container(
                                          width: 421,
                                          height: 451.76,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF8F9FE),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Color(0xff8C8C8C))
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                                            child: Column(
                                              children: [
                                                // ///Offer reference
                                                Row(
                                                  mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('OFFER REFERENCE',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                    Text('#1234567890',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    )
                                                  ],
                                                ),
                                                Divider(),
                                            //  end of Offer reference
                                            Row(
                                              children: [
                                                Text('You are sending',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('£1000.00',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),

                                            // end of you're sending

                                             Row(
                                              children: [
                                                Text('Exchange type',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('Swap',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of exchange type
                                            
                                             Row(
                                              children: [
                                                Text('Service charge',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('10.00 GBP',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of service charge

                                             Row(
                                              children: [
                                                Text('Amount we’ll convert',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('1000.00 GBP',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of Amount we’ll convert
                                             
                                              Row(
                                              children: [
                                                Text('Exchange rate',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('£1/₦970',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of Exchange rate
                                            Divider(),
                                            // Recipient will recieve
                                            Row(
                                              children: const [
                                                Text('Recipient will recieve',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('₦970,000.00',
                                                style: TextStyle(
                                                      color: Color(0xff233375),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                                // end of Recipient will recieve
                                            //     Row(
                                            //   children: [
                                            //     Text('Delivery time'),
                                            //     Text('40 Mins')
                                            //   ],
                                            // ),
                                             // end of Delivery time
                                             Divider(),
                                             Text('Money for up keeping for the month of July',
                                              style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                             ),
                                              // if beneficiary dosen't exsist
                                              Container(
                                                width: 421,
                                                height: 48.8,
                                                color: Colors.white,
                                                child: Row(
                                                  children: [
                                                    Text('Save beneficiary',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                    CupertinoSwitch(
  // overrides the default green color of the track
  activeColor: Colors.pink.shade200,
  // color of the round icon, which moves from right to left
  thumbColor: Colors.green.shade900,
  // when the switch is off
  trackColor: Colors.black12,
  // boolean variable value
  value: forIos,
  // changes the state of the switch
  onChanged: (value) => setState(() => forIos = value),
),

                                                  ],
                                                ),
                                              )
                                              ],
                                            ),
                                          ),
                                        ),
                                       Container(
                                          width: 421,
                                          height: 451.76,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF8F9FE),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Color(0xff8C8C8C))
                                          ),
                                          child:Column(
                                            children: [
                                              Text('RECIPIENT DETAILS',
                                              style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                              ),
                                              Divider(),
                                              Row(
                                                children: [
                                                  Image.asset(ngnWalletBalanceFlag, width: 30, height: 30,),
                                                  Column(
                                                    children: [
                                                      Text('Jumoke Adeyinka',
                                                      style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                      ),
                                                      Text('0123498926',
                                                       style: TextStyle(
                                                    color: Color(0xff6E80A3),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ), 
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap:(){
                                                 confirmPopUp(context);

                                                
                                              },
                                              child: Container(
                                                width: 203,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Center(child: Text('Confirm & Pay',
                                                                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                                ),
                                                )),
                                              ),
                                            ),

                                             Container(
                                              width: 203,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF8F9FE),
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Color(0xffDDDDDD))
                                              ),
                                              child: Center(child: Text('Cancel',
                                                                                             style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: primaryColor
                                              ),
                                              )),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                              ),
                          ),
                        ),
                        
                      ),
                    );
                                                        },
                                                        child: Row(
                                                            children: [
                                                              allKyshiUserWalletData
                                                                          .currency ==
                                                                      "USD"
                                                                  // && allKyshiUserWalletData.status=="ACTIVE"
                                                                  ? Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          usdWalletBalanceFlag,
                                                                          width:
                                                                              30,
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        SizedBox(width: 20,),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            RichText(
                                                                                text: TextSpan(text: allKyshiUserWalletData.userFirstName.toString(), style: TextStyle(color: primaryColor, fontFamily: "PushPenny", fontWeight: FontWeight.w400, fontSize: 14), children: [
                                                                              TextSpan(
                                                                                  text: ' . ',
                                                                                  style: TextStyle(
                                                                                    color: kyshiGreen,
                                                                                    fontWeight: FontWeight.w600, fontSize: 28
                                                                                  ),
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'USD',
                                                                                      style: TextStyle(
                                                                                        color: Color(0xff6E80A3),
                                                                                        fontFamily: "PushPenny", fontWeight: FontWeight.w400, fontSize: 14
                                                                                      ),
                                                                                    )
                                                                                  ])
                                                                            ])),
                                                                            Text(
                                                                                '\$${allKyshiUserWalletData.availableBalance.toString()}'),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    )
                                                                  : SizedBox(),
                                                            ],
                                                          ),
                                                      )
                                                      : InkWell(
                                                        onTap: (){
                                                          showDialog(
                      context: context,
                      builder: (ctx) =>  AlertDialog(
                      insetPadding: const EdgeInsets.all(20),
                      shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                        content: SizedBox(
                          height: 791.03,
                          width: 687,
                          child: SingleChildScrollView(
                            child: Padding(
                            padding:  const EdgeInsets.fromLTRB(
                                        30, 30, 30, 0),
                              child: Column(
                                children: [
                                  Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Transaction details',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 28,
                                                      color: primaryColor,
                                                      fontFamily: "PushPenny"),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image.asset(
                                                  'assets/images/cancel.png',
                                                  width: 40,
                                                  height: 40,
                                                ))
                                          ],
                                        ),

                                        Container(
                                          width: 421,
                                          height: 451.76,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF8F9FE),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Color(0xff8C8C8C))
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                                            child: Column(
                                              children: [
                                                // ///Offer reference
                                                Row(
                                                  mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('OFFER REFERENCE',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                    Text('#1234567890',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    )
                                                  ],
                                                ),
                                                Divider(),
                                            //  end of Offer reference
                                            Row(
                                              children: [
                                                Text('You are sending',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('£1000.00',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),

                                            // end of you're sending

                                             Row(
                                              children: [
                                                Text('Exchange type',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('Swap',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of exchange type
                                            
                                             Row(
                                              children: [
                                                Text('Service charge',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('10.00 GBP',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of service charge

                                             Row(
                                              children: [
                                                Text('Amount we’ll convert',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('1000.00 GBP',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of Amount we’ll convert
                                             
                                              Row(
                                              children: [
                                                Text('Exchange rate',
                                                style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('£1/₦970',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                            // end of Exchange rate
                                            Divider(),
                                            // Recipient will recieve
                                            Row(
                                              children: const [
                                                Text('Recipient will recieve',
                                                style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                ),
                                                Text('₦970,000.00',
                                                style: TextStyle(
                                                      color: Color(0xff233375),
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                )
                                              ],
                                            ),
                                                // end of Recipient will recieve
                                            //     Row(
                                            //   children: [
                                            //     Text('Delivery time'),
                                            //     Text('40 Mins')
                                            //   ],
                                            // ),
                                             // end of Delivery time
                                             Divider(),
                                             Text('Money for up keeping for the month of July',
                                              style: TextStyle(
                                                      color: Color(0xff6E80A3),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                             ),
                                              // if beneficiary dosen't exsist
                                              Container(
                                                width: 421,
                                                height: 48.8,
                                                color: Colors.white,
                                                child: Row(
                                                  children: [
                                                    Text('Save beneficiary',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                    ),
                                                    CupertinoSwitch(
  // overrides the default green color of the track
  activeColor: Colors.pink.shade200,
  // color of the round icon, which moves from right to left
  thumbColor: Colors.green.shade900,
  // when the switch is off
  trackColor: Colors.black12,
  // boolean variable value
  value: forIos,
  // changes the state of the switch
  onChanged: (value) => setState(() => forIos = value),
),

                                                  ],
                                                ),
                                              )
                                              ],
                                            ),
                                          ),
                                        ),
                                       Container(
                                          width: 421,
                                          height: 451.76,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF8F9FE),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Color(0xff8C8C8C))
                                          ),
                                          child:Column(
                                            children: [
                                              Text('RECIPIENT DETAILS',
                                              style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                              ),
                                              Divider(),
                                              Row(
                                                children: [
                                                  Image.asset(ngnWalletBalanceFlag, width: 30, height: 30,),
                                                  Column(
                                                    children: [
                                                      Text('Jumoke Adeyinka',
                                                      style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                      ),
                                                      Text('0123498926',
                                                       style: TextStyle(
                                                    color: Color(0xff6E80A3),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400
                                                  ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ), 
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap:(){
 confirmPopUp(context);

                                                
                                              },
                                              child: Container(
                                                width: 203,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Center(child: Text('Confirm & Pay',
                                                                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                                ),
                                                )),
                                              ),
                                            ),

                                             Container(
                                              width: 203,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                color: Color(0xffF8F9FE),
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Color(0xffDDDDDD))
                                              ),
                                              child: Center(child: Text('Cancel',
                                                                                             style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: primaryColor
                                              ),
                                              )),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                              ),
                          ),
                        ),
                        
                      ),
                    );
                                                        },
                                                        child: Row(
                                                            children: [
                                                              allKyshiUserWalletData
                                                                          .currency ==
                                                                      "GBP"
                                                                  // && allKyshiUserWalletData.status=="ACTIVE"
                                                                  ? Row(
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          gbpWalletBalanceFlag,
                                                                          width:
                                                                              30,
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        SizedBox(width: 20,),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            RichText(
                                                                                text: TextSpan(text: allKyshiUserWalletData.userFirstName.toString(), style: TextStyle(color: primaryColor, fontFamily: "PushPenny", fontWeight: FontWeight.w400, fontSize: 14), children: [
                                                                              TextSpan(
                                                                                  text: ' . ',
                                                                                  style: TextStyle(
                                                                                    color: kyshiGreen,
                                                                                    fontWeight: FontWeight.w600, fontSize: 28
                                                                                  ),
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: 'GBP',
                                                                                      style: TextStyle(
                                                                                        color: Color(0xff6E80A3),
                                                                                        fontFamily: "PushPenny", fontWeight: FontWeight.w400, fontSize: 14
                                                                                      ),
                                                                                    )
                                                                                  ])
                                                                            ])),
                                                                            Text(
                                                                                '£${allKyshiUserWalletData.availableBalance.toString()}'),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    )
                                                                  : SizedBox(),
                                                            ],
                                                          ),
                                                      ))
                                          .toList()
                                    ],
                                  ),
                                )
                                //
                                ),
                          ),

                          // Column(
                          //   children: [
                          //     ...kyshiBeneficiaryAccountProvider.allUserBeneficiaryList
                          //     .map((allUserBeneficiaryList) => 
                          //     Text(allUserBeneficiaryList.email)
                          //     ).toList()
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: 30,
            ),
            InkWell(onTap: () {}, child: AddBeneficiaryButton()),
          ],
        ),
      ),
    );
  }
}

class BeneficiaryResult extends StatelessWidget {
  const BeneficiaryResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 444,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF8F9FE),
      ),
      child: Column(
        children: [
          KyshiWalletResult(),
        ],
      ),
    );
  }
}

class KyshiWalletResult extends StatelessWidget {
  const KyshiWalletResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Kyshi Wallet',
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w400, color: primaryColor),
        ),
        Divider(),
        Row(
          children: [
            Image.asset(
              ngnWalletBalanceFlag,
              width: 40,
              height: 30,
            ),
            Column(
              children: [
                Text(
                  'NGN wallet balance',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: primaryColor),
                ),
                RichText(
                    text: TextSpan(
                  text: '₦3,000,000,000.00',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6E80A3)),
                )),
              ],
            )
          ],
        )
      ],
    );
  }
}

class AddBeneficiaryButton extends StatelessWidget {
  const AddBeneficiaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 444,
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: primaryColor),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              addBeneficiaryIcon,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'New beneficiary ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class BeneficiarySearchBar extends StatefulWidget {
  const BeneficiarySearchBar({super.key});

  @override
  State<BeneficiarySearchBar> createState() => _BeneficiarySearchBarState();
}

class _BeneficiarySearchBarState extends State<BeneficiarySearchBar> {
  TextEditingController _searchController = TextEditingController();
  List<String> _filteredFruits = [];
  List<String> _fruits = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
  ];
  @override
  void initState() {
    super.initState();
    _filteredFruits = _fruits;
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    return SizedBox(
      width: 444,
      height: 56,
      child: Column(
        children: [
          Container(
            width: 444,
            height: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: primaryColor)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          searchIcon,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 300,
                          //color: Colors.blue,
                          child: TextField(
                            autofocus: true,
                            controller: _searchController,
                            onChanged: (searchTerm) {
                              setState(() {
                                isSearching == true;
                                _filteredFruits = _fruits
                                    .where((fruit) => fruit
                                        .toLowerCase()
                                        .contains(searchTerm.toLowerCase()))
                                    .toList();
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search existing beneficiary or wallet',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: primaryColor),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 38,
                      height: 14,
                      decoration: BoxDecoration(
                          color: Color(0xff7880AA),
                          borderRadius: BorderRadius.circular(2)),
                      child: Center(
                        child: Text(
                          'N NGN',
                          style: TextStyle(
                              fontSize: 9,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // _searchController.text.isNotEmpty
          //   ?
          if (_searchController.text.isNotEmpty)
            Container(
              // width: 100,
              // height: 200,
              color: Colors.blue,
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredFruits.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_filteredFruits[index]),
                  );
                },
              ),
            )
          // : Container(),
        ],
      ),
    );
  }
}

class BankDetails extends StatefulWidget {
  const BankDetails({super.key});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

bool isusd = false;
bool isgbp = false;
bool isngn = false;

class _BankDetailsState extends State<BankDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 485.7,
        height: 578.6,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff8C8C8C),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BANK DETAILS',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                    // SizedBox(height: 4,),
                    Divider(
                      color: Color(0xff6E80A3),
                    ),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 552,
                  decoration: const BoxDecoration(
                    color: Color(0xffF8F9FE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Currency',
                          style: TextStyle(
                              color: Color(0xff6E80A3),
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('Nigerian Naira'),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 38,
                                  height: 14,
                                  decoration: BoxDecoration(
                                      color: Color(0xff7880AA),
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Center(
                                    child: Text(
                                      'N NGN',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Bank Name'),
                                // SizedBox(width: 50,),
                                // Icon(
                                //   Icons.arrow_drop_down,
                                //   size: 20,
                                //   color: Color(0xff23CE6B),
                                // )
                              ],
                            ),
                            TextField(
                              autofocus: true,
                              // controller: controller,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('Account number'),
                              ],
                            ),
                            TextField(
                              autofocus: true,
                              //controller: controller,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('Beneficiary (Autofill)'),
                              ],
                            ),
                            TextField(
                              autofocus: true,
                              // controller: controller,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('Purpose'),
                              ],
                            ),
                            TextField(
                              autofocus: true,
                              //controller: controller,
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 444,
                height: 56,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: "PushPenny"),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class FruitSearch extends StatefulWidget {
  const FruitSearch({Key? key}) : super(key: key);

  @override
  _FruitSearchState createState() => _FruitSearchState();
}

class _FruitSearchState extends State<FruitSearch> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  List<String> _fruits = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew melon',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Peach',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tangerine',
    'Ugli fruit',
    'Watermelon',
  ];

  List<String> _filteredFruits = [];

  @override
  void initState() {
    super.initState();
    _filteredFruits = _fruits;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : Text('Fruits'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.cancel : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _filteredFruits = _fruits;
                }
              });
            },
          ),
        ],
      ),
      body: _isSearching
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: _filteredFruits.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_filteredFruits[index]),
                  );
                },
              ),
            )
          : Container(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search fruits...',
        border: InputBorder.none,
      ),
      onChanged: (searchTerm) {
        setState(() {
          _filteredFruits = _fruits
              .where((fruit) =>
                  fruit.toLowerCase().contains(searchTerm.toLowerCase()))
              .toList();
        });
      },
    );
  }
}
