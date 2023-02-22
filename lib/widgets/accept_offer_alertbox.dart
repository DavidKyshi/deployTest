// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshiTextField.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshiTextFieldWithLabel.dart';
import 'package:kyshi_operations_dashboard/widgets/kyshi_responsive_button.dart';

import '../helper/screen_export.dart';
import '../styleguide/text_styles.dart';

acceptOfferAlertBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Container(
              height: 444.56,
              width: 529,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'assets/images/cancel.png',
                            width: 40,
                            height: 40,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/accept_warning.png',
                    width: 187.06,
                    height: 187.06,
                  ),
                  Text(
                    'Heads Up!',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: "PushPenny"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 399,
                    child: Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                                  'You are about to accept the selected offer ',
                              style: TextStyle(
                                  color: Color(0xff6E80A3),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "PushPenny"),
                              children: [
                                TextSpan(
                                    text: '6086346c-c5ac-98..',
                                    style: TextStyle(color: primaryColor))
                              ])),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 378,
                    height: 46,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: DeclineButton()),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: AcceptButton())
                      ],
                    ),
                  )
                ],
              )),
        );
      });
}

viewCommentAlertBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(48))),
          content: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              height: 250,
              width: 529,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "View comment",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            fontFamily: 'PushPenny'),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'assets/images/cancel.png',
                            width: 40,
                            height: 40,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    width: 450,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Color(0XFFF9F9F9),
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(color: Color(0XFFE8E8E8))),
                    child: Text(
                        "Could not validate all credentials, possibly fraud"),
                  ),
                ],
              )),
        );
      });
}

manageWalletStatusAlertBox(BuildContext context) {
  bool manageWallet = false;
  final TextEditingController controller =
      TextEditingController(text: "Pending");
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, state) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(48))),
            content: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                height: 600,
                width: 529,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Manage wallet status",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              fontFamily: 'PushPenny'),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              'assets/images/cancel.png',
                              width: 40,
                              height: 40,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Overrides the status of the user's KYC for the wallet.\nWill"
                      "all be set to PASSED, trigger the creation of the \nledger on"
                      "RB/VFD/Evolve and Send out a notification \ninforming the user"
                      "that their wallet is now ready for use",
                      style: TextStyle(
                          color: kyshiGreyishBlue,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'PushPenny'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          "Manage wallet state",
                          style: TextStyle(
                              color: kyshiGreyishBlue,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: 'PushPenny'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              activeColor: kyshiGreen,
                              trackColor: Colors.grey,
                              thumbColor:
                                  manageWallet ? primaryColor : Colors.white,
                              value: manageWallet,
                              onChanged: (value) {
                                state(() {
                                  manageWallet = value;
                                });
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    KyshiTextfieldWithLabel(
                      controller: controller,
                      labelText2: "Wallet Status",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    KyshiTextfieldWithLabel(
                      addedPadding: 50,
                      labelText2: "Add comment",
                      // controller: controller,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        KyshiButtonResponsive(
                          color: Colors.white,
                          onPressed: () {},
                          text: "Cancel",
                          childTextStyle: TextStyle(color: primaryColor),
                          size: 180,
                          radius: 23,
                        ),
                        KyshiButtonResponsive(
                          color: primaryColor,
                          onPressed: () {},
                          text: "Save",
                          size: 180,
                          radius: 23,
                        )
                      ],
                    )
                    // "Overrides the status of the user's KYC for the wallet.Will" all be set to PASSED, trigger the creation of the ledger on RB/VFD/Evolve and Send out a notification informing the user that their wallet is now ready for use."
                  ],
                )),
          );
        });
      });
}

// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
// child: TextFormField(
// decoration: const InputDecoration(
// border: UnderlineInputBorder(),
// labelText: 'Enter your username',
// ),
// ),
// ),
class DeclineButton extends StatelessWidget {
  DeclineButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 46,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffFBFBFB),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          'Cancel',
          style: TextStyle(
              color: Color(0xff6E80A3),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class AcceptButton extends StatelessWidget {
  AcceptButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 46,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          'Accept',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
