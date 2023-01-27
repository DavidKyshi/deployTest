
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';



class AccountKYC extends StatelessWidget {
  const AccountKYC({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                UserProfileButtonContainer(),
                SizedBox(height: 10,),
                ProfilePictureCard()
              ],
            ),
            SizedBox(width: 30,),
            Column(
              children: [
                UserBioDataBar(),
                SizedBox(height: 10,),
                Row(
                  children: [
                    BioDataParameters(),
                    SizedBox(width: 20,),
                    NatureAndPurposeOfAccount()
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}