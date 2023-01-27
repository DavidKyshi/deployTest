// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

class UserProfileButtonContainer extends StatelessWidget {
  const UserProfileButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288.48,
      height: 61,
      decoration: BoxDecoration(
          color: Color(0xffF9F9F9),
          border: Border.all(color: Color(0xffF3F3F3)),
          borderRadius: BorderRadius.circular(48)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'User Profile Picture',
            style: TextStyle(
              color: Color(0xff233375),
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePictureCard extends StatelessWidget {
  const ProfilePictureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293,
      height: 278.43,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff8C8C8C)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            width: 293,
            height: 204.1,
            decoration: BoxDecoration(
                color: Color(0xffF8F9FE),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.3, color: Colors.black),
                  image: DecorationImage(
                      image: AssetImage(profilePicture), fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Bright George',
            style: TextStyle(
              color: Color(0xff222B4A),
              fontWeight: FontWeight.w500,
              fontSize: 28,
            ),
          )
        ],
      ),
    );
  }
}

class UserBioDataBar extends StatelessWidget {
  const UserBioDataBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 793.57,
      height: 61,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF3F3F3)),
          borderRadius: BorderRadius.circular(48),
          color: Color(0xffF9F9F9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              'User Bio Data',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff233375)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            child: Row(
              children: [
                ExportButton(
                  image: csvIcon,
                  text: 'Export CSV',
                ),
                SizedBox(
                  width: 20,
                ),
                ExportButton(
                  image: pdfIcon,
                  text: 'Export PDF',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExportButton extends StatelessWidget {
  const ExportButton({super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 151.84,
      height: 40.04,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff233375),
          ),
          borderRadius: BorderRadius.circular(30),
          color: Color(0xffF8F9FE)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff233375)),
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              image,
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}

class BioDataParameters extends StatelessWidget {
  const BioDataParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293.22,
      height: 533.82,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BioDataTitleTextStyle(
                    text: 'First Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Middle Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Last Name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Gender',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Date of Birth',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Email',
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  BioDataSubTitleTextStyle(
                    text: 'Status',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Phone',
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  BioDataSubTitleTextStyle(
                    text: 'Status',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Occupation',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Nationality',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Residence',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Date Registered',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BioDataSubTitleTextStyle(
                      text: 'Bright',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: 'Nwapocha',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: 'George',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: 'Male',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: '07/06/1990',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: 'brightgerg@yahoo.com',
                    ),
                     SizedBox(
                      height: 6,
                    ),
                    BioDataStatusTextStyle(
                      isActive: true,
                      text: 'Verified',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: '+2347039429722',
                    ),
                     SizedBox(
                      height: 6,
                    ),
                    BioDataStatusTextStyle(
                      isActive: false,
                      text: 'Unverified',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: 'Product Designer',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: 'Nigerian',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: 'Nigeria',
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: '27-12-2021 • 06:48 PM',
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}



class BioDataTitleTextStyle extends StatelessWidget {
  const BioDataTitleTextStyle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xff233375), fontSize: 14, fontWeight: FontWeight.w400),
    );
  }
}

class BioDataSubTitleTextStyle extends StatelessWidget {
  const BioDataSubTitleTextStyle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xff6E80A3), fontSize: 14, fontWeight: FontWeight.w400),
    );
  }
}

class BioDataStatusTextStyle extends StatelessWidget {
  const BioDataStatusTextStyle(
      {super.key, required this.text, required this.isActive});
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: isActive == true ? Color(0xff63C57B) : Color(0xffFF5C5C),
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }
}


class NatureAndPurposeOfAccount extends StatelessWidget {
  const NatureAndPurposeOfAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 476.35,
      height: 534.82,
      decoration: BoxDecoration(
        color: Color(0xffF8F9FE),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Nature/Purpose of Account',
              style: TextStyle(color: Color(0xff0D2C65), fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text('Show more',
              style: TextStyle(color: Color(0xff23CE6B), fontSize: 14, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
              )
            ],),
            SizedBox(height: 20,),
            Row(
              children: [
                Column(
              children: [
               NatureAndPurposeTextStyle(text: 'School fee',),
               SizedBox(height: 20,),
                NatureAndPurposeTextStyle(text: 'Upkeep',),
              ],
            ),
            SizedBox(width: 20,),
             Column(
              children: [
               NatureAndPurposeTextStyle(text: 'Payment electronics',),
               SizedBox(height: 20,),
                   NatureAndPurposeTextStyle(text: 'Shipping payment',),
              ],
            ),
                        SizedBox(width: 20,),
            Column(
              children: [
       NatureAndPurposeTextStyle(text: 'For  Yetunde',),
               SizedBox(height: 20,),
                NatureAndPurposeTextStyle(text: 'Return Money',),
              ],
            ),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}

class NatureAndPurposeHeadingTextStyle extends StatelessWidget {
  const NatureAndPurposeHeadingTextStyle({super.key, required this.headingTitle});
  final String headingTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(headingTitle,
              style: TextStyle(color: Color(0xff0D2C65), fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text('Show more',
              style: TextStyle(color: Color(0xff23CE6B), fontSize: 14, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
              )
            ],);
  }
}

class NatureAndPurposeTextStyle extends StatelessWidget {
  const NatureAndPurposeTextStyle({super.key, required this.text});
   final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
         Icon(Icons.check, color: Color(0xff233375),size: 11,),
        SizedBox(width: 10,),
        Text(text,
        style: TextStyle(color: Color(0xff6E80A3), fontWeight: FontWeight.w400, fontSize: 14
        ),
        ),
        
      ],
    );
  }
}

class NatureAndPurposeIsActiveTextStyle extends StatelessWidget {
  const NatureAndPurposeIsActiveTextStyle({super.key, required this.text, required this.isActiveText, required this.status});
   final String text;
   final String isActiveText;
   final bool status;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(Icons.check, color: Color(0xff233375),size: 11,),
        SizedBox(width: 10,),
        Text(text,
        style: TextStyle(color: Color(0xff233375), fontWeight: FontWeight.w400, fontSize: 14
        ),
        ),
        Text('-',

        ),
        Text(isActiveText,
        style: TextStyle(color: status != true? Color(0xff23CE6B):Color(0xffFF5C5C), fontWeight: FontWeight.w400, fontSize: 14
        ) ,
        )
      ],
    );
  }
}