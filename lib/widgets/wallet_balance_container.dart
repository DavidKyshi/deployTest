import '../helper/screen_export.dart';

class WalletBalanceContainer extends StatelessWidget {
  const WalletBalanceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.47,
      height: 61,
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        border: Border.all(color: Color(0xffF3F3F3),),
        borderRadius: BorderRadius.circular(48),),
        child: Row(
          children: [
            Image.asset('assets/images/ngn.png'),
            RichText(text: TextSpan(
              text: '₦',
              children: [
                TextSpan(
                  text: '3,000,000,000.00'
                )
              ]
            ))
          ],
        ),
    );
  }
}