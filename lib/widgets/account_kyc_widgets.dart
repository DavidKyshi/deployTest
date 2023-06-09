// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:intl/intl.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/screens/page_not_found/page_not_found.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

class UserProfileButtonContainer extends StatelessWidget {
  UserProfileButtonContainer({
    super.key,
    required this.text,
  });
  final String text;
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
            text,
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

class ReferralProgramContainer extends StatelessWidget {
  ReferralProgramContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 476.52,
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
            text,
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
  ProfilePictureCard(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.profileImage});
  final String firstName, lastName, profileImage;

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
                      image: AssetImage(profileImage), fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${firstName} ${lastName}',
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
      width: 850.57,
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

String convertDateTime(String dateTimeStr) {
  // Parse the date-time string
  DateTime dateTime = DateTime.parse(dateTimeStr);

  // Create a DateFormat object with the desired format
  DateFormat dateFormat = DateFormat("dd-MM-yyyy • hh:mm a");

  // Convert the DateTime object to a formatted string
  String formattedDateTime = dateFormat.format(dateTime);

  return formattedDateTime;
}

String convertDay(String dateTimeStr) {
  // Parse the date-time string
  DateTime dateTime = DateTime.parse(dateTimeStr);

  // Create a DateFormat object with the desired format
  DateFormat dateFormat = DateFormat('EEEE');

  // Convert the DateTime object to a formatted string
  String formattedDateTime = dateFormat.format(dateTime);

  return formattedDateTime;
}

String convertAmount(String amount) {
  final amountFormatter = (NumberFormat.currency().format(amount));
  return amountFormatter;
}

class BioDataParameters extends StatefulWidget {
  const BioDataParameters(
      {super.key,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.gender,
      required this.dateOfBirth,
      required this.email,
      required this.emailStatus,
      required this.phoneNumber,
      required this.phoneNumberStatus,
      required this.occupation,
      required this.nationality,
      required this.residence,
      required this.dateOfRegistration,
      required this.isAccountKYC});
  final String firstName,
      middleName,
      lastName,
      gender,
      dateOfBirth,
      email,
      phoneNumber,
      occupation,
      nationality,
      residence,
      dateOfRegistration;
  final bool emailStatus, phoneNumberStatus, isAccountKYC;

  @override
  State<BioDataParameters> createState() => _BioDataParametersState();
}

class _BioDataParametersState extends State<BioDataParameters> {
  UsersProvider get userProvider =>
      Provider.of<UsersProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    final user = userProvider.getUserById();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController middleNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController occupationController = TextEditingController();
    TextEditingController nationalityController = TextEditingController();
    TextEditingController residencyController = TextEditingController();
    TextEditingController dobController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    String dropdownvalue = 'M';
    List<String> gender = ['M', 'F'];
    String residenceValue = 'AF';
    String nationalityValue = 'AF';
    List<String> countries = [
      'AF',
      'AL',
      'DZ',
      'AS',
      'AD',
      'AO',
      'AI',
      'AQ',
      'AG',
      'AR',
      'AM',
      'AW',
      'AU',
      'AT',
      'AZ',
      'BS',
      'BH',
      'BD',
      'BB',
      'BY',
      'BE',
      'BZ',
      'BJ',
      'BM',
      'BT',
      'BO',
      'BQ',
      'BA',
      'BW',
      'BV',
      'BR',
      'IO',
      'BN',
      'BG',
      'BF',
      'BI',
      'CV',
      'KH',
      'CM',
      'CA',
      'KY',
      'CF',
      'TD',
      'CL',
      'CN',
      'CX',
      'CC',
      'CO',
      'KM',
      'CD',
      'CG',
      'CK',
      'CR',
      'HR',
      'CU',
      'CW',
      'CY',
      'CZ',
      'CI',
      'DK',
      'DJ',
      'DM',
      'DO',
      'EC',
      'EG',
      'SV',
      'GQ',
      'ER',
      'EE',
      'SZ',
      'ET',
      'FK',
      'FO',
      'FJ',
      'FI',
      'FR',
      'PF',
      'TF',
      'GA',
      'GM',
      'GE',
      'DE',
      'GH',
      'GI',
      'GR',
      'GL',
      'GD',
      'GP',
      'GU',
      'GT',
      'GG',
      'GN',
      'GW',
      'GY',
      'HT',
      'HM',
      'VA',
      'HN',
      'HK',
      'HU',
      'IS',
      'IN',
      'ID',
      'IR',
      'IQ',
      'IE',
      'IM',
      'IL',
      'IT',
      'JM',
      'JP',
      'JE',
      'JO',
      'KZ',
      'KE',
      'KI',
      'KP',
      'KR',
      'KW',
      'KG',
      'LA',
      'LV',
      'LB',
      'LS',
      'LR',
      'LY',
      'LI',
      'LT',
      'LU',
      'MO',
      'MG',
      'MW',
      'MY',
      'MV',
      'ML',
      'MT',
      'MH',
      'MQ',
      'MR',
      'MU',
      'YT',
      'MX',
      'FM',
      'MD',
      'MC',
      'MN',
      'ME',
      'MS',
      'MA',
      'MZ',
      'MM',
      'NA',
      'NR',
      'NP',
      'NL',
      'NC',
      'NZ',
      'NI',
      'NE',
      'NG',
      'NU',
      'NF',
      'MP',
      'NO',
      'OM',
      'PK',
      'PW',
      'PS',
      'PA',
      'PG',
      'PY',
      'PE',
      'PH',
      'PN',
      'PL',
      'PT',
      'PR',
      'QA',
      'MK',
      'RO',
      'RU',
      'RW',
      'RE',
      'BL',
      'SH',
      'KN',
      'LC',
      'MF',
      'PM',
      'VC',
      'WS',
      'SM',
      'ST',
      'SA',
      'SN',
      'RS',
      'SC',
      'SL',
      'SG',
      'SX',
      'SK',
      'SI',
      'SB',
      'SO',
      'ZA',
      'GS',
      'SS',
      'ES',
      'LK',
      'SD',
      'SR',
      'SJ',
      'SE',
      'CH',
      'SY',
      'TW',
      'TJ',
      'TZ',
      'TH',
      'TL',
      'TG',
      'TK',
      'TO',
      'TT',
      'TN',
      'TR',
      'TM',
      'TC',
      'TV',
      'UG',
      'UA',
      'AE',
      'GB',
      'UM',
      'US',
      'UY',
      'UZ',
      'VU',
      'VE',
      'VN',
      'VG',
      'VI',
      'WF',
      'EH',
      'YE',
      'ZM',
      'ZW',
      'AX'
    ];
    String email;
    return Container(
      width: 350,
      height: 533.82,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BioDataSubTitleTextStyle(
                          text: widget.firstName,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.middleName,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.lastName,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.gender,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.dateOfBirth,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.email,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        BioDataStatusTextStyle(
                          isActive: widget.emailStatus,
                          text: widget.emailStatus == true
                              ? "Verified"
                              : "Unverified",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.phoneNumber,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        BioDataStatusTextStyle(
                          isActive: widget.phoneNumberStatus,
                          text: widget.phoneNumberStatus == true
                              ? "Verified"
                              : "Unverified",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.occupation,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.nationality,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.residence,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BioDataSubTitleTextStyle(
                          text: widget.dateOfRegistration,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            insetPadding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            content: SizedBox(
                                height: 1095,
                                width: 600,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Edit Bright George profile details',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 28,
                                                      color: primaryColor,
                                                      fontFamily: "PushPenny"),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'You are about to make changes to this profile and KYC. Proceed?',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: Color(0xff6E80A3),
                                                      fontFamily: "PushPenny"),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image.asset(
                                                  'assets/images/cancel.png',
                                                  width: 40,
                                                  height: 40,
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Divider(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 526,
                                          height: 768,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF8F9FE),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 10, 20, 0),
                                            child: Column(
                                              children: [
                                                smallList("First Name",
                                                    firstNameController),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                smallList("Middle Name",
                                                    middleNameController),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                smallList("Last Name",
                                                    lastNameController),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Gender',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff6E80A3),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10,
                                                      ),
                                                    ),

                                                    DropdownButton(
                                                      isExpanded: true,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      dropdownColor:
                                                          Colors.white,
                                                      elevation: 1,
                                                      // Initial Value
                                                      value: dropdownvalue,
                                                      selectedItemBuilder:
                                                          (BuildContext
                                                              context) {
                                                        return countries.map(
                                                            (String items) {
                                                          return RichText(
                                                            text: TextSpan(
                                                              text:
                                                                  dropdownvalue,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 15,
                                                                  color:
                                                                      primaryColor,
                                                                  fontFamily:
                                                                      "PushPenny"),
                                                            ),
                                                          );
                                                        }).toList();
                                                      },
                                                      // Down Arrow Icon
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 18,
                                                        color:
                                                            Color(0xff23CE6B),
                                                      ),

                                                      // Array list of items
                                                      items: gender
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Container(
                                                            // width:double.infinity,
                                                            //alignment: Alignment.centerLeft,
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0,
                                                                    8.0,
                                                                    0,
                                                                    0),
                                                            decoration: const BoxDecoration(
                                                                border: Border(
                                                                    bottom: BorderSide(
                                                                        color: Color(
                                                                            0xffDDDDDD),
                                                                        width:
                                                                            0.5))),
                                                            child: Text(
                                                              items,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      // After selecting the desired option,it will
                                                      // change button value to selected value
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          dropdownvalue =
                                                              newValue!;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                smallList("Date of Birth",
                                                    dobController),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                smallList("Email Address",
                                                    emailController),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                smallList("Phone number",
                                                    phoneNumberController),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                smallList("Occupations",
                                                    occupationController),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Nationality',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff6E80A3),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    DropdownButton(
                                                      isExpanded: true,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      dropdownColor:
                                                          Colors.white,
                                                      elevation: 1,
                                                      // Initial Value
                                                      value: nationalityValue,
                                                      selectedItemBuilder:
                                                          (BuildContext
                                                              context) {
                                                        return countries.map(
                                                            (String items) {
                                                          return RichText(
                                                            text: TextSpan(
                                                              text:
                                                                  nationalityValue,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 15,
                                                                  color:
                                                                      primaryColor,
                                                                  fontFamily:
                                                                      "PushPenny"),
                                                            ),
                                                          );
                                                        }).toList();
                                                      },
                                                      // Down Arrow Icon
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 18,
                                                        color:
                                                            Color(0xff23CE6B),
                                                      ),

                                                      // Array list of items
                                                      items: countries
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Container(
                                                            // width:double.infinity,
                                                            //alignment: Alignment.centerLeft,
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0,
                                                                    8.0,
                                                                    0,
                                                                    0),
                                                            decoration: const BoxDecoration(
                                                                border: Border(
                                                                    bottom: BorderSide(
                                                                        color: Color(
                                                                            0xffDDDDDD),
                                                                        width:
                                                                            0.5))),
                                                            child: Text(
                                                              items,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      // After selecting the desired option,it will
                                                      // change button value to selected value
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          nationalityValue =
                                                              newValue!;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Residence',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff6E80A3),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    DropdownButton(
                                                      isExpanded: true,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      dropdownColor:
                                                          Colors.white,
                                                      elevation: 1,
                                                      // Initial Value
                                                      value: residenceValue,
                                                      selectedItemBuilder:
                                                          (BuildContext
                                                              context) {
                                                        return countries.map(
                                                            (String items) {
                                                          return RichText(
                                                            text: TextSpan(
                                                              text:
                                                                  residenceValue,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 15,
                                                                  color:
                                                                      primaryColor,
                                                                  fontFamily:
                                                                      "PushPenny"),
                                                            ),
                                                          );
                                                        }).toList();
                                                      },
                                                      // Down Arrow Icon
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 18,
                                                        color:
                                                            Color(0xff23CE6B),
                                                      ),

                                                      // Array list of items
                                                      items: countries
                                                          .map((String items) {
                                                        return DropdownMenuItem(
                                                          value: items,
                                                          child: Container(
                                                            // width:double.infinity,
                                                            //alignment: Alignment.centerLeft,
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0,
                                                                    8.0,
                                                                    0,
                                                                    0),
                                                            decoration: const BoxDecoration(
                                                                border: Border(
                                                                    bottom: BorderSide(
                                                                        color: Color(
                                                                            0xffDDDDDD),
                                                                        width:
                                                                            0.5))),
                                                            child: Text(
                                                              items,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      // After selecting the desired option,it will
                                                      // change button value to selected value
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          residenceValue =
                                                              newValue!;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                width: 222,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffF8F9FE),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                userProvider.getEditProfile(
                                                  user_id: user!.id ?? "",
                                                  first_name:
                                                      firstNameController.text,
                                                  last_name:
                                                      lastNameController.text,
                                                  middle_name:
                                                      middleNameController.text,
                                                  email: emailController.text,
                                                  phone_number:
                                                      phoneNumberController
                                                          .text,
                                                  occupation:
                                                      occupationController.text,
                                                  nationality: nationalityValue,
                                                  residence: residenceValue,
                                                  dob: dobController.text,
                                                  gender: dropdownvalue,
                                                  context: context,
                                                );
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                width: 222,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Yes, update profile',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        });
                  },
                  child: widget.isAccountKYC == true
                      ? Container(
                          width: 340,
                          height: 46,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Edit profile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        )
                      : SizedBox()),
            ],
          )),
    );
  }
}

Widget smallList(String smallText, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        smallText,
        style: TextStyle(
          color: Color(0xff6E80A3),
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),
      ),
      //SizedBox(height: 10,),
      TextField(
        autofocus: true,
        controller: controller,
      )
    ],
  );
}

class IdentificationData extends StatelessWidget {
  const IdentificationData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293.22,
      height: 400.82,
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
                    text: 'Transaction Status',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'Status',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BioDataTitleTextStyle(
                    text: 'SSN',
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
                    text: 'SSN',
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  BioDataSubTitleTextStyle(
                    text: 'Status',
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BioDataStatusTextStyle(
                      isActive: true,
                      text: 'Verified',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: '29292988338',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataStatusTextStyle(
                      isActive: true,
                      text: 'Verified',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BioDataSubTitleTextStyle(
                      text: 'NIL',
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
                      text: 'sam@yahoo.com',
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
  const NatureAndPurposeOfAccount({super.key, required this.currency});
  final String currency;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 476,
      height: 534.82,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            NatureAndPurposeHeadingTextStyle(
              headingTitle: 'Nature/Purpose of Account',
              isShow: true,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // Column(
                //   children: [
                //     NatureAndPurposeTextStyle(
                //       text: 'School fee',
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     NatureAndPurposeTextStyle(
                //       text: 'Upkeep',
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   width: 20,
                // ),
                // Column(
                //   children: [
                //     NatureAndPurposeTextStyle(
                //       text: 'Payment electronics',
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     NatureAndPurposeTextStyle(
                //       text: 'Shipping payment',
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   width: 20,
                // ),
                // Column(
                //   children: [
                //     NatureAndPurposeTextStyle(
                //       text: 'For  Yetunde',
                //     ),
                //     SizedBox(
                //       height: 20,
                //     ),
                //     NatureAndPurposeTextStyle(
                //       text: 'Return Money',
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            NatureAndPurposeHeadingTextStyle(
              headingTitle: 'Currencies Wallets',
              isShow: false,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    NatureAndPurposeIsActiveTextStyle(
                      text: currency,
                      isActiveText: 'Pending',
                      status: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //     NatureAndPurposeIsActiveTextStyle(
                    //       text: 'GBP',
                    //       isActiveText: 'Inactive',
                    //       status: true,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   width: 40,
                    // ),
                    // Column(
                    //   children: [
                    //     NatureAndPurposeIsActiveTextStyle(
                    //       text: 'USD',
                    //       isActiveText: 'Inactive',
                    //       status: true,
                    //     ),
                    //     SizedBox(
                    //       height: 20,
                    //     ),
                    //     NatureAndPurposeIsActiveTextStyle(
                    //       text: 'CAD',
                    //       isActiveText: 'Inactive',
                    //       status: true,
                    //     ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            NatureAndPurposeHeadingTextStyle(
              headingTitle: 'Destinations of payments',
              isShow: true,
            ),
            SizedBox(
              height: 20,
            ),
            // Column(
            //   children: [
            //     NatureAndPurposeTextStyle(
            //       text: 'UK',
            //     ),
            //     SizedBox(
            //       height: 20,
            //     ),
            //     NatureAndPurposeTextStyle(
            //       text: 'USA',
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 15,
            ),
            NatureAndPurposeHeadingTextStyle(
              headingTitle: 'Expected Amount',
              isShow: false,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // NatureAndPurposeAmountTextStyle(
                //   text: 'Tier 2',
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                // NatureAndPurposeAmountTextStyle(
                //   text: '₦1,000,000 - ₦5,000,000',
                // ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            NatureAndPurposeHeadingTextStyle(
              headingTitle: 'Transaction Countries',
              isShow: true,
            ),
            SizedBox(
              height: 20,
            ),
            // Column(
            //   children: [
            //     NatureAndPurposeTextStyle(
            //       text: 'UK',
            //     ),
            //     SizedBox(
            //       height: 20,
            //     ),
            //     NatureAndPurposeTextStyle(
            //       text: 'USA',
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class NatureAndPurposeHeadingTextStyle extends StatelessWidget {
  const NatureAndPurposeHeadingTextStyle(
      {super.key, required this.headingTitle, required this.isShow});
  final String headingTitle;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingTitle,
          style: TextStyle(
              color: Color(0xff0D2C65),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        isShow
            ? InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const PageNotFoundScreen()),
                  // );
                },
                child: Text(
                  'Show more',
                  style: TextStyle(
                    color: Colors.grey,
                      //color: Color(0xff23CE6B),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline),
                ),
              )
            : SizedBox()
      ],
    );
  }
}

class NatureAndPurposeTextStyle extends StatelessWidget {
  const NatureAndPurposeTextStyle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: Color(0xff233375),
          size: 11,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
              color: Color(0xff6E80A3),
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
      ],
    );
  }
}

class NatureAndPurposeAmountTextStyle extends StatelessWidget {
  const NatureAndPurposeAmountTextStyle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xff233375), fontWeight: FontWeight.w400, fontSize: 14),
    );
  }
}

class NatureAndPurposeIsActiveTextStyle extends StatelessWidget {
  const NatureAndPurposeIsActiveTextStyle(
      {super.key,
      required this.text,
      required this.isActiveText,
      required this.status});
  final String text;
  final String isActiveText;
  final bool status;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: Color(0xff233375),
          size: 11,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
              color: Color(0xff233375),
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Text(
          '-',
        ),
        Text(
          isActiveText,
          style: TextStyle(
              color: status != true ? Color(0xff23CE6B) : Color(0xffFBCD58),
              fontWeight: FontWeight.w400,
              fontSize: 14),
        )
      ],
    );
  }
}

class RiskStatusCard extends StatelessWidget {
  const RiskStatusCard(
      {super.key, required this.riskScore, required this.riskRatingg});
  final String riskScore;
  final String riskRatingg;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293,
      height: 278.43,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff8C8C8C)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 130.79,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/riskScore.png',
                    width: 65,
                    height: 65,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: riskScore,
                              style: TextStyle(
                                  color: Color(0xff233375),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700),
                              children: [
                            TextSpan(
                                text: '/5',
                                style: TextStyle(
                                    color: Color(0xff6F6F6F),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "PushPenny"))
                          ])),
                      Text(
                        'Risk Score',
                        style: TextStyle(
                            color: Color(0xff233375),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "PushPenny"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 293,
            height: 130.76,
            decoration: BoxDecoration(
                color: Color(0xffF8F9FE),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    riskRating,
                    width: 65,
                    height: 65,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        riskRatingg == "medium" ? "Medium" : riskRatingg,
                        style: TextStyle(
                            fontFamily: "PushPenny",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: riskRatingg == "medium"
                                ? Color(0xffFBCD58)
                                : riskRatingg == "low"
                                    ? Color(0xff6E80A3)
                                    : Colors.green),
                      ),
                      Text(
                        'Risk Rating',
                        style: TextStyle(
                            fontFamily: "PushPenny",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff233375)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 15,
          // ),
        ],
      ),
    );
  }
}

class IdentificationStatusBoard extends StatelessWidget {
  const IdentificationStatusBoard(
      {super.key,
      required this.canTransact,
      required this.bvnVerified,
      required this.bvn});
  final bool canTransact;
  final String bvn;
  final bool bvnVerified;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293.22,
      height: 335.58,
      decoration: BoxDecoration(
          color: Color(0xffF8F9FE), borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BioDataTitleTextStyle(
                  text: 'Transact. Status',
                ),
                SizedBox(
                  height: 20,
                ),
                BioDataTitleTextStyle(
                  text: 'BVN',
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
                  text: 'SSN',
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
                  text: 'UK Address',
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
                  text: 'Free Swap',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BioDataStatusTextStyle(
                  isActive: canTransact,
                  text: canTransact == true ? 'Active' : 'InActive',
                ),
                SizedBox(
                  height: 20,
                ),
                BioDataSubTitleTextStyle(
                  text: bvn,
                ),
                SizedBox(
                  height: 6,
                ),
                BioDataStatusTextStyle(
                  isActive: bvnVerified,
                  text: bvnVerified == true ? 'Verified' : "Unverified",
                ),
                SizedBox(
                  height: 20,
                ),
                BioDataSubTitleTextStyle(
                  text: 'Nil',
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
                  text: 'Nil',
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
                BioDataStatusTextStyle(
                  isActive: false,
                  text: 'Ineligible',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReferralProgramBoard extends StatelessWidget {
  const ReferralProgramBoard({super.key, required this.code});
  final String code;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 476.52,
      height: 338.87,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff8C8C8C)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BONUS BALANCE',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff233375)),
                        ),
                        Text(
                          '₦0.00',
                          style: TextStyle(
                            color: Color(0xff233375),
                            fontFamily: 'PushPenny',
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 195.57,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xff233375),
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Code -  ${code}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/images/copy.png',
                            width: 20,
                            height: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              width: 476.42,
              height: 206.88,
              decoration: BoxDecoration(
                  color: Color(0xffF8F9FE),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    NatureAndPurposeHeadingTextStyle(
                      headingTitle: 'Referrer Code',
                      isShow: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NatureAndPurposeTextStyle(
                      text: 'OLAG00012',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NatureAndPurposeHeadingTextStyle(
                      headingTitle: 'Referrals',
                      isShow: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   children: [
                    //     Column(
                    //       children: [
                    //         NatureAndPurposeTextStyle(
                    //           text: 'Dele Oguniran',
                    //         ),
                    //         SizedBox(
                    //           height: 20,
                    //         ),
                    //         NatureAndPurposeTextStyle(
                    //           text: 'Adewale Obanla',
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Column(
                    //       children: [
                    //         NatureAndPurposeTextStyle(
                    //           text: 'Thomas Johnson',
                    //         ),
                    //         SizedBox(
                    //           height: 20,
                    //         ),
                    //         NatureAndPurposeTextStyle(
                    //           text: 'Funke Adejumo',
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Column(
                    //       children: [
                    //         NatureAndPurposeTextStyle(
                    //           text: 'Ehis Teghang',
                    //         ),
                    //         SizedBox(
                    //           height: 20,
                    //         ),
                    //         NatureAndPurposeTextStyle(
                    //           text: 'Folawiyo Akin',
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              )),
          // SizedBox(
          //   height: 15,
          // ),
        ],
      ),
    );
  }
}

class KYCRecordsAndDocunmentContainer extends StatelessWidget {
  KYCRecordsAndDocunmentContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 529.91,
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
            text,
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

class KycRecordsBoard extends StatelessWidget {
  const KycRecordsBoard({super.key, required this.createdAt});
  final String createdAt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 531,
      height: 254.27,
      decoration: BoxDecoration(
        color: Color(0xffF8F9FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All records were created instantly when they were submitted',
              style: TextStyle(
                  fontFamily: 'PushPenny',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff6E7883)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KycRecordsAndDocumentBoardTitle(
                      text: 'CREATED AT',
                    ),
                    SizedBox(height: 30),
                    KycRecordsAndDocumentBoardSubText(text: createdAt),
                    SizedBox(height: 30),
                    // KycRecordsAndDocumentBoardSubText(
                    //     text: 'Nov 28, 2022 • 3:58 PM'),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KycRecordsAndDocumentBoardTitle(
                      text: 'REASON',
                    ),
                    SizedBox(height: 30),
                    KycRecordsAndDocumentBoardSubText(text: 'IDV'),
                    SizedBox(height: 30),
                    KycRecordsAndDocumentBoardSubText(text: 'Fraud'),
                  ],
                ),
                SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      KycRecordsAndDocumentBoardTitle(
                        text: 'STATUS',
                      ),
                      SizedBox(height: 30),
                      KycRecordsAndDocumentBoardButton(
                        color: Color(0xff23CE6B),
                        imageHeight: 20,
                        imageWidth: 20,
                        text: 'Passed',
                        width: 132,
                        image: 'assets/images/check.png',
                      ),
                      SizedBox(height: 30),
                      KycRecordsAndDocumentBoardButton(
                        color: Color(0xffFBCD58),
                        imageHeight: 20,
                        imageWidth: 20,
                        text: 'Pending',
                        width: 132,
                        image: 'assets/images/check.png',
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DocumentBoard extends StatelessWidget {
  const DocumentBoard({super.key, required this.createdAt});
  final String createdAt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 531,
      height: 254.27,
      decoration: BoxDecoration(
        color: Color(0xffF8F9FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All records were created instantly when they were submitted',
              style: TextStyle(
                  fontFamily: 'PushPenny',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff6E7883)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KycRecordsAndDocumentBoardTitle(
                      text: 'CREATED AT',
                    ),
                    SizedBox(height: 30),
                    KycRecordsAndDocumentBoardSubText(text: createdAt),
                    SizedBox(height: 30),
                    // KycRecordsAndDocumentBoardSubText(
                    //     text: 'Nov 28, 2022 • 3:58 PM'),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KycRecordsAndDocumentBoardTitle(
                      text: 'IMAGES',
                    ),
                    SizedBox(height: 30),
                    KycRecordsAndDocumentBoardSubText(text: '2'),
                    SizedBox(height: 30),
                    KycRecordsAndDocumentBoardSubText(text: '1'),
                  ],
                ),
                SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      KycRecordsAndDocumentBoardTitle(
                        text: 'ACTION',
                      ),
                      SizedBox(height: 30),
                      KycRecordsAndDocumentBoardButton(
                        color: Color(0xff233375),
                        imageHeight: 20,
                        imageWidth: 20,
                        text: 'View',
                        width: 132,
                        image: 'assets/images/eye.png',
                      ),
                      SizedBox(height: 30),
                      KycRecordsAndDocumentBoardButton(
                        color: Color(0xff233375),
                        imageHeight: 20,
                        imageWidth: 20,
                        text: 'View',
                        width: 132,
                        image: 'assets/images/eye.png',
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class KycRecordsAndDocumentBoardTitle extends StatelessWidget {
  KycRecordsAndDocumentBoardTitle({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'PushPenny',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Color(0xff233375)),
    );
  }
}

class KycRecordsAndDocumentBoardSubText extends StatelessWidget {
  KycRecordsAndDocumentBoardSubText({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'PushPenny',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Color(0xff6E7883)),
    );
  }
}

class KycRecordsAndDocumentBoardButton extends StatelessWidget {
  KycRecordsAndDocumentBoardButton({
    super.key,
    required this.color,
    required this.imageHeight,
    required this.imageWidth,
    required this.width,
    required this.text,
    required this.image,
  });
  double width;
  double imageHeight;
  double imageWidth;
  Color color;
  String text;
  String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: "PushPenny"),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            image,
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }
}
