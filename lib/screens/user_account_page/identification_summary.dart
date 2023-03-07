// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

class IdentificationSummary extends StatefulWidget {
  const IdentificationSummary({super.key});

  @override
  State<IdentificationSummary> createState() => _IdentificationSummaryState();
}

class _IdentificationSummaryState extends State<IdentificationSummary> {
  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    final user = userProvider.getUserById();
    String formattedDateTime = convertDateTime(user!.dateJoined ?? "");
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                  firstName: user.firstName ?? "",
                  lastName: user.lastName ?? "",
                  profileImage:
                      user.profileImage == "" || user.profileImage == null
                          ? profilePicture
                          : user.profileImage,
                )
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              children: [
                UserProfileButtonContainer(
                  text: "User Bio Data",
                ),
                SizedBox(
                  height: 10,
                ),
                BioDataParameters(
                  dateOfBirth: user.dob ?? "",
                  dateOfRegistration: formattedDateTime,
                  email: user.email ?? "",
                  emailStatus: user.emailVerified ?? false,
                  firstName: user.firstName ?? "",
                  gender: user.gender ?? "",
                  lastName: user.lastName ?? "",
                  middleName: user.middleName ?? "",
                  nationality: user.nationality1 ?? "",
                  occupation: user.occupation ?? "",
                  phoneNumberStatus: user.phoneVerified ?? false,
                  phoneNumber: user.phoneNumber ?? "",
                  residence: user.countryOfResidence ?? "",
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserProfileButtonContainer(
                  text: "Identification Status",
                ),
                SizedBox(
                  height: 10,
                ),
                IdentificationData(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
