
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';



class IdentificationSummary extends StatefulWidget {
  const IdentificationSummary({super.key});

  @override
  State<IdentificationSummary> createState() => _IdentificationSummaryState();
}

class _IdentificationSummaryState extends State<IdentificationSummary> {
  @override
  Widget build(BuildContext context) {
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
                UserProfileButtonContainer(),
                SizedBox(height: 10,),
                ProfilePictureCard()
              ],
            ),
            SizedBox(width: 30,),
            Column(
              children: [
                UserProfileButtonContainer(title: "User Bio Data",),
                SizedBox(height: 10,),
                BioDataParameters(),
              ],
            ),
            SizedBox(width: 30,),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserProfileButtonContainer(title: "Identification Status",),
                SizedBox(height: 10,),
                IdentificationData(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}