// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../helper/screen_export.dart';

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

class CreateAnOfferCard extends StatelessWidget {
  const CreateAnOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 485.7,
      height: 622.68,
      decoration: BoxDecoration(
        border: Border.all(color:const Color(0xff8C8C8C)),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
             padding: const EdgeInsets.fromLTRB(15, 40, 10, 0),
              child: Column(
                children: [
                  const ExchangeTextField(),
              Row(
                children: [
                  Image.asset('assets/images/swapIcon.png', width: 26, height: 74,),
                  const SizedBox(width: 15,),
                  Container(
                    width: 60,
                    height: 21,
                    color: const Color(0xff233375),
                    child: const Center(
                      child: Text('Swap',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                      ),
                      ),
                    ),
                  ),
                   const SizedBox(width: 10,),
                  const Text('£10.00',
                  style: TextStyle(
                    color: Color(0xff6F6F6F),
                    fontSize: 10,
                    fontWeight: FontWeight.w400
                  ),
                  )
                ],
              ),
              const ExchangeTextField(),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            const SummaryBox()
          ],
        ),
      ),
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
           )
         ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Center(
              child: TextFormField(
                 decoration: const InputDecoration(
                   border: InputBorder.none,
                   hintText: '1,000',
                   hintStyle: TextStyle(
                    color: Color(0xff233375),
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                   )
                   
                 ),
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
  var currency = [
    '🇬🇧 GBP',
    '🇳🇬 NGN',
    '🇱🇷 USD'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138,
      height: 71,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10)
          )
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
                  value: dropdownvalue,
                  selectedItemBuilder: (BuildContext context){
                    return currency.map((String items){
                    return Center(
                      child: RichText(text: TextSpan(
                        text:dropdownvalue,
                        style: const TextStyle( fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white ),
                      ),)
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
                  icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xff23CE6B),),

                  // Array list of items
                  items: currency.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      
                      child: Container(
                        // width:double.infinity,
                  alignment:Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                        decoration:const BoxDecoration(
                  border:Border(bottom:BorderSide(color:Color(0xffDDDDDD),width:0.5))
                  ),
                        child: Text(items,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black
                        ),
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
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Summary',
            style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20,),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Amount we’ll covert',
                    style: TextStyle(color: Color(0xff6E80A3),
                    fontSize: 14, fontWeight: FontWeight.w400
                    ),
                    ),
                    Text('£1000.00',
                    style: TextStyle(color:primaryColor,
                    fontSize: 18, fontWeight: FontWeight.w400
                    ),
                    ),
const SizedBox(height: 20,),
                    const Text('Total to Pay',
                    style: TextStyle(color: Color(0xff6E80A3),
                    fontSize: 14, fontWeight: FontWeight.w400
                    ),
                    ),
                    Text('£1010.00',
                    style: TextStyle(color:primaryColor,
                    fontSize: 18, fontWeight: FontWeight.w400
                    ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/circle.png', width: 15, height: 15,),
                        const Text('Your suggested rate',
                         style: TextStyle(color: Color(0xff6E80A3),
                    fontSize: 14, fontWeight: FontWeight.w400
                    ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('£1/₦',
                          style: TextStyle(color:primaryColor,
                    fontSize: 18, fontWeight: FontWeight.w500
                    ),
                        ),
                        const SizedBox(width: 5,),
                        Container(
                          width: 72.4,
                          height: 33.94,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff6E80A3),),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text('970',
                             style: TextStyle(color:primaryColor,
                    fontSize: 18, fontWeight: FontWeight.w500
                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                     const Text('Average duration',
                    style: TextStyle(color: Color(0xff6E80A3),
                    fontSize: 14, fontWeight: FontWeight.w400
                    ),
                    ),
                    const SizedBox(height: 10,),
                    const Text('40 Mins',
                    style: TextStyle(color:Color(0xff04CE9D),
                    fontSize: 18, fontWeight: FontWeight.w400
                    ),
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



class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 485.7,
      height: 578.6,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff8C8C8C),
        ),
        borderRadius:BorderRadius.circular(10)
      ),
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
                  Text('BANK DETAILS',
              style: TextStyle(
                color: primaryColor,
                fontSize: 10, fontWeight: FontWeight.w400
              ),
              ),
           // SizedBox(height: 4,),
              Divider(color: Color(0xff6E80A3),),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 395.5,
              decoration: const BoxDecoration(
                color: Color(0xffF8F9FE),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Currency',
                    style: TextStyle(
                      color:Color(0xff6E80A3),
                      fontSize: 10,
                      fontWeight: FontWeight.w400
                    ),
                    ),
                    Row(
                      children: [
                        Text('Nigerian Naira'),
                        Container(
                          width: 38,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Color(0xff7880AA),
                            borderRadius: BorderRadius.circular(2)
                          ),
                          child: Center(
                            child: Text('N NGN',
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                            ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}