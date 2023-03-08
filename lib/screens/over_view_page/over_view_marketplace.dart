// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../widgets/over_view_widgets.dart';

class OverViewMarketPlace extends StatefulWidget {
  const OverViewMarketPlace({super.key});

  @override
  State<OverViewMarketPlace> createState() => _OverViewMarketPlaceState();
}

class _OverViewMarketPlaceState extends State<OverViewMarketPlace> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 396.54,
        height: 375.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffE8E8E8))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Marketplace offers Overview',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  ),
                  CurrencyOfMarketPlaceDropDown(),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: 396.54,
              height: 251.87,
              decoration: BoxDecoration(
                color: Color(0xffF8F9FE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Container(
                      width: 194.72,
                      height: 194.72,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          border:
                              Border.all(color: Color(0xffDDDDDD), width: 40)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6E80A3)),
                          ),
                          Text(
                            "Total Offers",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WalletStatus(color: primaryColor, text: 'Active',),
                        SizedBox(height: 10,),
                        WalletStatus(color: Color(0xff6E80A3), text: 'Expired',),
                        SizedBox(height: 10,),
                        WalletStatus(color: Color(0xff2668EC), text: 'Accepted',),
                        SizedBox(height: 10,),
                        WalletStatus(color: Color(0xff4DAEF8), text: 'Withdrawn',)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                 SizedBox(width: 20,),
               bottomText("GBP/NGN"),
               SizedBox(width: 10,),
               bottomText("USD/NGN"),
               SizedBox(width: 10,),
               bottomText("CAD/NGN"),
              ],
            )
          ],
        ),
      );
  }
}

Widget bottomText(String text){
  return Column(
    children: [
      Text(
        '0',
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 20,fontFamily: "PushPenny" ),
      ),
      Text(text,
       style: TextStyle(color: Color(0xff6E80A3), fontWeight: FontWeight.w500, fontSize: 12,fontFamily: "PushPenny" ),
      )
    ],
  );
}

Widget bottomText2(String text){
  return Column(
    children: [
      Text(
        '0',
        style: TextStyle(color: Color(0xff6E80A3), fontWeight: FontWeight.w500, fontSize: 20,fontFamily: "PushPenny" ),
      ),
      Text(text,
       style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 12,fontFamily: "PushPenny" ),
      )
    ],
  );
}

Widget bottomText3(String text){
  return Column(
    children: [
      Text(
        '0',
        style: TextStyle(color: Color(0xff6E80A3), fontWeight: FontWeight.w500, fontSize: 40,fontFamily: "PushPenny" ),
      ),
      Text(text,
       style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 12,fontFamily: "PushPenny" ),
      )
    ],
  );
}

class WalletStatus extends StatelessWidget {
  const WalletStatus({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('0',
        style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),
        ),
        Row(
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(50)),

            ),
            Text(text,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 18
            ),
            )
          ],
        )
      ],
    );
  }
}


class WalletStatus2 extends StatelessWidget {
  const WalletStatus2({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(50)),

            ),
            SizedBox(height: 10,),
        Text(text,
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 18
        ),
        )
      ],
    );
  }
}

