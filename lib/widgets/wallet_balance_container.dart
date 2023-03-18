import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../helper/screen_export.dart';
import '../providers/wallet_balance.dart';

class WalletBalanceContainer extends StatefulWidget {
  const WalletBalanceContainer(
      {super.key,
      required this.image,
      required this.availableBalance,
      required this.symbol});
  final String image, availableBalance, symbol;
  @override
  State<WalletBalanceContainer> createState() => _WalletBalanceContainerState();
}

class _WalletBalanceContainerState extends State<WalletBalanceContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.47,
        height: 61,
        decoration: BoxDecoration(
          color: Color(0xffF9F9F9),
          border: Border.all(
            color: Color(0xffF3F3F3),
          ),
          borderRadius: BorderRadius.circular(48),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset(
                widget.image,
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: widget.symbol,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      children: [TextSpan(text: widget.availableBalance)]))
            ],
          ),
        )

        // )
        // .toList(),

        );
  }
}
