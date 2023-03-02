// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

import '../../widgets/create_an_offer_screen_widget.dart';

class CreateAnOfferScreen extends StatelessWidget {
  const CreateAnOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 1190.83,
                height: 97.55,
                color: Color(0xffF9F9F9),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LastDaysFilter(),
                      SizedBox(
                        width: 20,
                      ),
                      CalenderPickDate()
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                children: [
                  Column(
                    children: [
                      CreateAnOfferButtonContainer(
                        text: 'Create an offer',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CreateAnOfferCard(),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            '1 Hour',
                            style: TextStyle(
                                color: Color(0xff2668EC),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '5 Hour',
                            style: TextStyle(
                                color: Color(0xffFF5C5C),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 40,),
                  BankDetails()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
