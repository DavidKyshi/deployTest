// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

import '../../styleguide/colors.dart';
import '../../widgets/create_an_offer_screen_widget.dart';
import '../../widgets/wallet_balance_container.dart';

class CreateAnOfferScreen extends StatelessWidget {
  const CreateAnOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 1190.83,
                height: 97.55,
                color: Color(0xffF9F9F9),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Marketplace',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            fontFamily: "PushPenny",
                            color: primaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: primaryColor,
                        size: 18,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Create offer',
                        style: TextStyle(
                            color: Color(0xff6E80A3),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [WalletBalanceContainer()],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CreateAnOfferCard(),
                       SizedBox(
                width: 40,
              ),
              SearchBeneficiary()
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
