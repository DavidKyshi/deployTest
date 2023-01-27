
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';



class AccountKYC extends StatelessWidget {
  const AccountKYC({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    UserProfileButtonContainer(text: 'User Profile Picture',),
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
                        NatureAndPurposeOfAccount(),
                         SizedBox(height: 10,),
                      ],
                    )
                  ],
                ),
                
              ],
            ),
            SizedBox(height: 20,),
            Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    UserProfileButtonContainer(text: 'Risk Status',),
                    SizedBox(height: 20,),
                    RiskStatusCard(),
                    //  UserProfileButtonContainer(text: 'Risk Status',),
                  ],
                ),
                 SizedBox(width: 20,),
                 Column(
                  children: [
                     UserProfileButtonContainer(text: 'Identification Status',),
                     SizedBox(height: 20,),
                     IdentificationStatusBoard()
                  ],
                 ),
                  SizedBox(width: 20,),
                 Column(
                  children: [
                    ReferralProgramContainer(text: 'Referral Program',),
                    SizedBox(height: 20,),
                    ReferralProgramBoard()
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