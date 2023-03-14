// ignore_for_file: prefer_const_constructors

import '../helper/screen_export.dart';
import '../providers/over_view_provider.dart';
import '../styleguide/colors.dart';

class TypeOfOfferDropDown extends StatefulWidget {
  final Function(String?)? onChanged;
  final String dropdownvalue;
  const TypeOfOfferDropDown({super.key, this.onChanged, required this.dropdownvalue});

  @override
  State<TypeOfOfferDropDown> createState() => _TypeOfOfferDropDownState();
}

class _TypeOfOfferDropDownState extends State<TypeOfOfferDropDown> {
  String dropdownvalue = 'Created';

  // List of items in our dropdown menu
  var currency = ['Created', 'Accepted', 'Expired', 'Withdrawn'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 48,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(4)),
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
                  value: widget.dropdownvalue,
                  selectedItemBuilder: (BuildContext context) {
                    return currency.map((String items) {
                      return Center(
                          child: RichText(
                        text: TextSpan(
                          text: widget.dropdownvalue,
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
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 18,
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
                  onChanged: widget.onChanged
                  //     (String? newValue) {
                  //   setState(() {
                  //     dropdownvalue = newValue!;
                  //   });
                  //   print(dropdownvalue);
                  //   Provider.of<OverViewProvider>(context,listen: false).setOfferStatus(dropdownvalue);
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyOfOfferDropDown extends StatefulWidget {
  final Function(String?)? onChangedCurr;
  final String dropdownvalueCurrency;
  CurrencyOfOfferDropDown({super.key,required this.onChangedCurr, required this.dropdownvalueCurrency});

  @override
  State<CurrencyOfOfferDropDown> createState() =>
      _CurrencyOfOfferDropDownState();
}

class _CurrencyOfOfferDropDownState extends State<CurrencyOfOfferDropDown> {
  String dropdownvalue = 'NGN';

  // List of items in our dropdown menu
  var currency = ['NGN', 'GBP', 'USD', 'CAD'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 48,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(4)),
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
                  value: widget.dropdownvalueCurrency,
                  selectedItemBuilder: (BuildContext context) {
                    return currency.map((String items) {
                      return Center(
                          child: RichText(
                        text: TextSpan(
                          text: widget.dropdownvalueCurrency,
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
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 18,
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
                  onChanged: widget.onChangedCurr
                    //   (String? newValue) {
                    // setState(() {
                    //   dropdownvalue = newValue!;
                    //   Provider.of<OverViewProvider>(context,listen: false).setOfferCurrency(newValue);
                    // });
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyOfMarketPlaceDropDown extends StatefulWidget {
  final String dropdownCurrencyPair;
  final Function(String?)? onChangePairs;
  const CurrencyOfMarketPlaceDropDown({super.key, required this.dropdownCurrencyPair,required this.onChangePairs});

  @override
  State<CurrencyOfMarketPlaceDropDown> createState() =>
      _CurrencyOfMarketPlaceDropDownState();
}

class _CurrencyOfMarketPlaceDropDownState
    extends State<CurrencyOfMarketPlaceDropDown> {

  // List of items in our dropdown menu
  var currency = ['NGN/GBP', 'NGN/USD', 'NGN/CAD'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 48,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(4)),
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
                  value: widget.dropdownCurrencyPair,
                  selectedItemBuilder: (BuildContext context) {
                    return currency.map((String items) {
                      return Center(
                          child: RichText(
                        text: TextSpan(
                          text: widget.dropdownCurrencyPair,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
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
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 18,
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
                  onChanged: widget.onChangePairs
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
    );
  }
}

class ConnectDropDown extends StatefulWidget {
  final Function(String?)? onChangedAirtimeGraph;
  final String dropDownAirtimeGraph;
  const ConnectDropDown({super.key,required this.onChangedAirtimeGraph, required this.dropDownAirtimeGraph});

  @override
  State<ConnectDropDown> createState() => _ConnectDropDownState();
}

class _ConnectDropDownState extends State<ConnectDropDown> {
  // List of items in our dropdown menu
  List<String> currency = ['Airtime', 'Data', 'Health'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 48,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(4)),
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
                  value: widget.dropDownAirtimeGraph,
                  selectedItemBuilder: (BuildContext context) {
                    return currency.map((String items) {
                      return Center(
                          child: RichText(
                        text: TextSpan(
                          text: widget.dropDownAirtimeGraph,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
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
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 18,
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
                  onChanged: widget.onChangedAirtimeGraph
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
    );
  }
}
