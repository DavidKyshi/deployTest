// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/models/offer_management_api_response/offer_data.dart';
import 'package:kyshi_operations_dashboard/screens/user_account_page/user_account_index.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../widgets/accept_offer_alertbox.dart';
import 'all_offer.dart';

class ExpiredOfferTable extends StatefulWidget {
  ExpiredOfferTable({super.key, required this.searchQuery});
final String searchQuery;
  @override
  State<ExpiredOfferTable> createState() => _ExpiredOfferTableState();
}

class _ExpiredOfferTableState extends State<ExpiredOfferTable> {
  late ScrollController controller;
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

  OfferManagementProvider get offerManagementProvider =>
      Provider.of<OfferManagementProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    List<OfferData>? expiredOffer = Provider.of<OfferManagementProvider>(context, listen: false).closedOfferData;
     if (widget.searchQuery.isNotEmpty) {
      expiredOffer = expiredOffer.where((offerData) => offerData.user!.toLowerCase().contains(widget.searchQuery.toLowerCase())).toList();
      //offerData = offerData.where((offerData) => offerData.baseCurrency!.toLowerCase().contains(widget.searchQuery.toLowerCase())).toList();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0XFFEAEBF1),
                borderRadius: BorderRadius.circular(12)),
            child: expiredOffer.isEmpty
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
                        'We currently don’t have an  expired  \n  offer  at the Kyshi marketplace,  it will \n appear here when we do',
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
                        ...offerManagementProvider.closedOfferData
                            .map((closedOfferData) => Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: 83,
                                            child: Text(convertDateTime(
                                                closedOfferData.createdAt
                                                    .toString()))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                            width: 157,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                subText(
                                                    closedOfferData.user ?? ""),
                                                    Text(closedOfferData.email ?? "")
                                              ],
                                            )),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(
                                                closedOfferData.baseCurrency ??
                                                    "")),
                                        SizedBox(
                                          width: 38,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: subText(
                                                closedOfferData.baseAmount ??
                                                    "")),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(closedOfferData
                                                .baseFee
                                                .toString())),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(
                                                closedOfferData.quoteCurrency ??
                                                    "")),
                                        SizedBox(
                                          width: 38,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: subText(
                                                closedOfferData.quoteAmount ??
                                                    "")),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(closedOfferData
                                                .quoteFee
                                                .toString())),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: Text(
                                                closedOfferData.exchangeRate ??
                                                    "")),
                                        SizedBox(
                                            width: 83,
                                            child: Text(convertDateTime(
                                                closedOfferData.expiresAt
                                                    .toString()))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                            width: 140,
                                            child:
                                                Text(closedOfferData.id ?? "")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: OfferMangementButton(
                                            text: closedOfferData.status ?? "",
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
  OfferButton({super.key, required this.isBorder, required this.text});

  bool isBorder;
  String text;
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
            width: 73,
            height: 24,
            decoration: BoxDecoration(
                color: Color(0xffFBCD58),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
  }
}
