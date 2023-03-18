import 'package:flutter/material.dart';
import 'package:kyshi_operations_dashboard/helper/currencyConverter.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../helper/screen_export.dart';
import '../../providers/over_view_provider.dart';

class MarketPlaceRevenue extends StatefulWidget {
  const MarketPlaceRevenue({super.key});

  @override
  State<MarketPlaceRevenue> createState() => _MarketPlaceRevenueState();
}

class _MarketPlaceRevenueState extends State<MarketPlaceRevenue> {
  OverViewProvider get overViewProvider =>
      Provider.of<OverViewProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return Container(
      width:350,
      height: 375.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffE8E8E8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(
              'Market place revenue Overview',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              // Provider.of<OverViewProvider>(context,listen: false)
              boxy("NGN", "₦ ${Util.formatAmount(overViewProvider.ngnRevenue)}", "USD", "\$ ${Util.formatAmount(overViewProvider.usdRevenue)}"),
              SizedBox(
                width: 20,
              ),
              boxy("GBP ", "£ ${Util.formatAmount(overViewProvider.gbpRevenue)}", "CAD", "C\$ ${Util.formatAmount(overViewProvider.cadRevenue)}"),
            ],
          )
        ],
      ),
    );
  }
}

Container boxy(String baseCurrency, String baseAmount, String quoteCurrency,
    String quoteAmount) {
  return Container(
    width: 150.23,
    height: 282.12,
    decoration: BoxDecoration(
        color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            baseCurrency,
            style: TextStyle(
              color: Color(0xff6E80A3),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            baseAmount,
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 3,
          ),
          Text(
            quoteCurrency,
            style: TextStyle(
              color: Color(0xff6E80A3),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            quoteAmount,
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

Container boxy2(String baseCurrency, String baseAmount, String quoteCurrency,
    String quoteAmount, String currency, String amount) {
  return Container(
    width: 234.14,
    height: 282.12,
    decoration: BoxDecoration(
        color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          baseCurrency,
          style: TextStyle(
            color: Color(0xff6E80A3),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          baseAmount,
          style: TextStyle(
            color: primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 3,
        ),
        Text(
          quoteCurrency,
          style: TextStyle(
            color: Color(0xff6E80A3),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          quoteAmount,
          style: TextStyle(
            color: primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 3,
        ),
        Text(
          currency,
          style: TextStyle(
            color: Color(0xff6E80A3),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
