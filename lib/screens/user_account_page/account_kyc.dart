// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:provider/provider.dart';

import '../../models/users.dart';
import '../../providers/users.dart';

class AccountKYC extends StatefulWidget {
  AccountKYC({super.key});

  @override
  State<AccountKYC> createState() => _AccountKYCState();
}

class _AccountKYCState extends State<AccountKYC> {



  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final  user = userProvider.getUserById();
    return SingleChildScrollView(
      // scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        UserProfileButtonContainer(
                          text: 'User Profile Picture',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ProfilePictureCard(
                          firstName:
                              user!.firstName ?? " No firstname",
                          lastName:
                              user.lastName ?? "No lasttname",
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        UserBioDataBar(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            BioDataParameters(),
                            SizedBox(
                              width: 20,
                            ),
                            NatureAndPurposeOfAccount(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        UserProfileButtonContainer(
                          text: 'Risk Status',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RiskStatusCard(),
                        //  UserProfileButtonContainer(text: 'Risk Status',),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        UserProfileButtonContainer(
                          text: 'Identification Status',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        IdentificationStatusBoard()
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        ReferralProgramContainer(
                          text: 'Referral Program',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ReferralProgramBoard()
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        KYCRecordsAndDocunmentContainer(
                          text: 'KYC Records',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        KycRecordsBoard()
                      ],
                    ),
                    SizedBox(
                      width: 43,
                    ),
                    Column(
                      children: [
                        KYCRecordsAndDocunmentContainer(
                          text: 'Documents',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DocumentBoard()
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
