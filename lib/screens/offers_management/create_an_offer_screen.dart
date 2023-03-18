// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

import '../../providers/wallet_balance.dart';
import '../../styleguide/colors.dart';
import '../../widgets/create_an_offer_screen_widget.dart';
import '../../widgets/wallet_balance_container.dart';

class CreateAnOfferScreen extends StatefulWidget {
  const CreateAnOfferScreen({super.key});

  @override
  State<CreateAnOfferScreen> createState() => _CreateAnOfferScreenState();
}

class _CreateAnOfferScreenState extends State<CreateAnOfferScreen> {
  WalletBalanceProvider get walletBalanceProvider =>
      Provider.of<WalletBalanceProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    final walletBalance = walletBalanceProvider.walletBalance;
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...walletBalanceProvider.walletBalance
                            .map((walletBalance) => Row(
                                  children: [
                                    WalletBalanceContainer(
                                      availableBalance: walletBalance
                                          .availableBalance
                                          .toString(),
                                      image: walletBalance.currency == "NGN"
                                          ? ngnWalletBalanceFlag
                                          : walletBalance.currency == "USD"
                                              ? usdWalletBalanceFlag
                                              : walletBalance.currency == "GBP"
                                                  ? gbpWalletBalanceFlag
                                                  : cadWalletBalanceFlag,
                                      symbol: walletBalance.currency == "NGN"
                                          ? '₦'
                                          : walletBalance.currency == "USD"
                                              ? '\$'
                                              : walletBalance.currency == "GBP"
                                                  ? '£'
                                                  : 'C\$',
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CreateAnOfferCard(),
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

class SwitchTextFields extends StatefulWidget {
  @override
  _SwitchTextFieldsState createState() => _SwitchTextFieldsState();
}

class _SwitchTextFieldsState extends State<SwitchTextFields> {
  bool _isTopTextFieldSelected = true;
  TextEditingController _topTextFieldController = TextEditingController();
  TextEditingController _bottomTextFieldController = TextEditingController();

  void _switchTextFields() {
    setState(() {
      _isTopTextFieldSelected = !_isTopTextFieldSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _switchTextFields,
          child: Text(
            'Switch',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          controller: _isTopTextFieldSelected
              ? _topTextFieldController
              : _bottomTextFieldController,
          decoration: InputDecoration(
            hintText: _isTopTextFieldSelected
                ? 'Enter text for top field'
                : 'Enter text for bottom field',
          ),
        ),
        TextField(
          controller: _isTopTextFieldSelected
              ? _bottomTextFieldController
              : _topTextFieldController,
          decoration: InputDecoration(
            hintText: _isTopTextFieldSelected
                ? 'Enter text for bottom field'
                : 'Enter text for top field',
          ),
        ),
      ],
    );
  }
}
