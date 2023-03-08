// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/create_an_offer_screen_widget.dart';

import '../../widgets/over_view_widgets.dart';

class OverViewOffers extends StatelessWidget {
  const OverViewOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            width: 681.64,
            height: 375.15,
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffE8E8E8))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TypeOfOfferDropDown(),
                         CurrencyOfOfferDropDown(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  RichText(text: TextSpan(
                    text: '0',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                      fontSize: 40,

                    ),
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: Color(0xff6E80A3)
                        ),
                        text: ' Offers!',
                      )
                    ]
                  )),
                  SizedBox(height: 20,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/yesterday.png', width: 20, height: 20,),
                          SizedBox(width: 10,),
                          Text('0 Yesterday, March 7',
                          style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: primaryColor,
                      fontSize: 12,

                    ),
                          )
                        ],
                      ),
                      SizedBox(width: 40,),
                      Row(
                        children: [
                          Image.asset('assets/images/today.png', width: 20, height: 20,),
                           SizedBox(width: 10,),
                          Text('0 Today, March 8',
                          style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: primaryColor,
                      fontSize: 12,

                    ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
          );
  }
}