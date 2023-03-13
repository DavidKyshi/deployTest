import '../helper/screen_export.dart';
import '../providers/wallet_balance.dart';

class WalletBalanceContainer extends StatefulWidget {
  const WalletBalanceContainer({super.key});

  @override
  State<WalletBalanceContainer> createState() => _WalletBalanceContainerState();
}

class _WalletBalanceContainerState extends State<WalletBalanceContainer> {
    WalletBalanceProvider get walletBalanceProvider =>
      Provider.of<WalletBalanceProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final walletBalance = walletBalanceProvider.walletBalance;
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
      child: walletBalance.isEmpty?
      Text('no balance'):
      Column(
        children: [
          ...walletBalanceProvider.walletBalance
                            .map((walletBalance) =>
                              Row(
        children: [
          Image.asset(
            walletBalance.currency=="NGN"?
            ngnWalletBalanceFlag
            :walletBalance.currency=="USD"?
            usdWalletBalanceFlag
            :walletBalance.currency=="GBP"?
            gbpWalletBalanceFlag
            :cadWalletBalanceFlag
          ),
          RichText(
              text: TextSpan(
                  text: '₦', children: [TextSpan(text: walletBalance.totalBalance??"0")]))
        ],
      ),
                            )
                            .toList(),
        ],
      )
    );
  }
}

