import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

import '../../styleguide/colors.dart';
import 'market_place_revenue.dart';
import 'over_view_marketplace.dart';

class OverViewExpressChart extends StatelessWidget {
  const OverViewExpressChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 651.67,
      height: 338.4,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE8E8E8)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(
              'Express Transfers',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: primaryColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
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
                          "Total Transfer",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bottomText2('Successful'),
                      bottomText2('Failed'),
                      bottomText2('Pending'),
                    ],
                  )
                ],
              ),
              Container(
                width: 160.7,
                height: 282.12,
                decoration: BoxDecoration(
                  color: Color(0xffF8F9FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    bottomText3('GBP Transactions'),
                    bottomText3('USD Transations'),
                    bottomText3('CAD Transactions'),
                    Row(
                      children: [
                        WalletStatus2(
                          color: Color(0xff23CE6B),
                          text: 'GBP',
                        ),
                        WalletStatus2(
                          color: primaryColor,
                          text: 'USD',
                        ),
                        WalletStatus2(
                          color: Color(0xff4DAEF8),
                          text: 'CAD',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              boxy2("Total GBP ", "£ 0.00", "Total USD", "\$0.00", "Total  CAD",
                  "C\$ 0.00")
            ],
          )
        ],
      ),
    );
  }
}
