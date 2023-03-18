// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/models/offer_management_api_response/offer_data.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../widgets/accept_offer_alertbox.dart';
import '../user_account_page/user_account_index.dart';

class AllOfferTable extends StatefulWidget {
  AllOfferTable({super.key, required this.searchQuery});
final String searchQuery;
  @override
  State<AllOfferTable> createState() => _AllOfferTableState();
}

class _AllOfferTableState extends State<AllOfferTable> {
  late ScrollController controller;

  OfferManagementProvider get offerManagementProvider =>
      Provider.of<OfferManagementProvider>(context, listen: false);

  

  Text titleText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: primaryColor,
        fontFamily: 'PushPenny',
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );
  }

  Text subText(String sub) {
    return Text(
      sub,
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff233375)),
    );
  }


   @override
  void initState() {
   
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
     List<OfferData>? offerData = Provider.of<OfferManagementProvider>(context, listen: false).offerData;
     if (widget.searchQuery.isNotEmpty) {
      offerData = offerData.where((offerData) => offerData.user!.toLowerCase().contains(widget.searchQuery.toLowerCase())).toList();
      //offerData = offerData.where((offerData) => offerData.baseCurrency!.toLowerCase().contains(widget.searchQuery.toLowerCase())).toList();
    }
    // offerData = 
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: 
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0XFFEAEBF1),
                borderRadius: BorderRadius.circular(12)),
            child: offerData.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/book-search.png',
                        width: 66,
                        height: 67,
                      ),
                      Text(
                        'We currently don’t have any offer at \n the Kyshi marketplace,  it will appear \n here when we do',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            fontFamily: "PushPenny",
                            color: primaryColor),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 190,
                              child: Row(
                                children: [
                                  titleText('Created'),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  titleText('User'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            SizedBox(
                              width: 220,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  titleText('Currency'),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  titleText('Amount'),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  titleText('Fee (%)'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              width: 250,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  titleText('Currency'),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  titleText('Amount'),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  titleText('Fee (%)'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 380,
                              child: Row(
                                children: [
                                  titleText('Rate'),
                                  SizedBox(
                                    width: 38,
                                  ),
                                  titleText('Expire'),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  titleText('ID'),
                                  SizedBox(
                                    width: 145,
                                  ),
                                  titleText('Status'),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 250, 20),
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'BASE',
                                  style: TextStyle(
                                      color: primaryColor.withOpacity(0.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'QUOTE',
                                  style: TextStyle(
                                      color: primaryColor.withOpacity(0.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ...offerManagementProvider.offerData
                            .map((offersData) => Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: 83,
                                            child: Text(convertDateTime(
                                                offersData.createdAt
                                                    .toString()))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                            width: 157,
                                            child:
                                                Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                subText(
                                                    offersData.user ?? ""),
                                                    Text(offersData.email ?? "")
                                              ],
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(
                                                offersData.baseCurrency ?? "")),
                                        SizedBox(
                                          width: 38,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: subText(
                                                offersData.baseAmount ?? "")),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(
                                                offersData.baseFee.toString())),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(
                                                offersData.quoteCurrency ??
                                                    "")),
                                        SizedBox(
                                          width: 38,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: subText(
                                                offersData.quoteAmount ?? "")),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(offersData.quoteFee
                                                .toString())),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: Text(
                                                offersData.exchangeRate ?? "")),
                                        SizedBox(
                                            width: 83,
                                            child: Text(convertDateTime(
                                                offersData.expiresAt
                                                    .toString()))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                            width: 140,
                                            child: Text(offersData.id ?? "")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: OfferMangementButton(
                                            text: offersData.status ?? "",
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ))
                            .toList()
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class OfferButton extends StatelessWidget {
  OfferButton(
      {super.key,
      required this.isBorder,
      required this.text,
      this.color,
      this.comment = false,
      this.commentBackground = true});

  bool isBorder;
  bool comment;
  bool commentBackground;
  String text;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return isBorder
        ? Container(
            width: 73,
            height: 24,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xff23CE6B))),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Color(0xff23CE6B),
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        : Container(
            width: 130,
            height: 40,
            decoration: BoxDecoration(
                color: !comment
                    ? primaryColor
                    : commentBackground
                        ? primaryColor
                        : color ?? Color(0XFF6D48FF),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
  }
}

class OfferMangementButton extends StatelessWidget {
  OfferMangementButton(
      {super.key,
      // required this.isBorder,
      required this.text});

  // bool isBorder;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 73,
      height: 24,
      decoration: BoxDecoration(
          color: text == "OPEN"
              ? Colors.white
              : text == "WITHDRAWN"
                  ? Color(0xffEF845C)
                  : text == "ACCEPTED"
                      ? primaryColor
                      : text == "EXPIRED"
                          ? Color(0xffFBCD58)
                          : Color(0XffFF5C5C),
          borderRadius: BorderRadius.circular(4),
          border: text == "OPEN"
              ? Border.all(color: Color(0xff23CE6B))
              : Border.all(color: Colors.transparent)),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: text == "OPEN"
                  ? Color(0xff23CE6B)
                  : text == "EXPIRED"
                      ? Colors.black
                      : Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
