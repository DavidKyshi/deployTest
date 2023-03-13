// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../widgets/over_view_widgets.dart';
import 'over_view_marketplace.dart';

class OverViewConnect extends StatefulWidget {
  const OverViewConnect({super.key});

  @override
  State<OverViewConnect> createState() => _OverViewConnectState();
}

class _OverViewConnectState extends State<OverViewConnect> {
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
                  'Kyshi Connect Overview',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ),
                ConnectDropDown(),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
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
                          "Total Transaction",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WalletStatus(
                        color: Color(0xff2668EC),
                        text: 'NGN',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: primaryColor,
                        text: 'GBP',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: Color(0xff6E80A3),
                        text: 'USD',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      WalletStatus(
                        color: Color(0xff4DAEF8),
                        text: 'CAD',
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              bottomText("Airtime","0"),
              SizedBox(
                width: 10,
              ),
              bottomText("Data",""),
              SizedBox(
                width: 10,
              ),
              bottomText("Health Plans",""),
            ],
          )
        ],
      ),
    );
  }
}
