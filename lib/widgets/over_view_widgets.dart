// ignore_for_file: prefer_const_constructors

import '../helper/screen_export.dart';
import '../styleguide/colors.dart';

class TypeOfOfferDropDown extends StatefulWidget {
  TypeOfOfferDropDown({super.key});

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

class CurrencyOfOfferDropDown extends StatefulWidget {
  CurrencyOfOfferDropDown({super.key});

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

class CurrencyOfMarketPlaceDropDown extends StatefulWidget {
  CurrencyOfMarketPlaceDropDown({super.key});

  @override
  State<CurrencyOfMarketPlaceDropDown> createState() =>
      _CurrencyOfMarketPlaceDropDownState();
}

class _CurrencyOfMarketPlaceDropDownState
    extends State<CurrencyOfMarketPlaceDropDown> {
  String dropdownvalue = 'GBP/NGN';

  // List of items in our dropdown menu
  var currency = ['GBP/NGN', 'USD/NGN', 'CAD/NGN'];

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

class ConnectDropDown extends StatefulWidget {
  ConnectDropDown({super.key});

  @override
  State<ConnectDropDown> createState() => _ConnectDropDownState();
}

class _ConnectDropDownState extends State<ConnectDropDown> {
  String dropdownvalue = 'Airtime';

  // List of items in our dropdown menu
  List<String> currency = ['Airtime', 'Data Plan', 'Health Plan'];

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
