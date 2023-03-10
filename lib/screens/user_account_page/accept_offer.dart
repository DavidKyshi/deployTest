// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/models/offer_management_api_response/offer_data.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../widgets/accept_offer_alertbox.dart';
import '../offers_management/all_offer.dart';
import '../payout_transaction/payout_failed_transaction.dart';

class AcceptOfferTable extends StatefulWidget {
  AcceptOfferTable({super.key});

  @override
  State<AcceptOfferTable> createState() => _AcceptOfferTableState();
}

class _AcceptOfferTableState extends State<AcceptOfferTable> {
  late ScrollController controller;

  OfferManagementProvider get offerManagementProvider =>
      Provider.of<OfferManagementProvider>(context, listen: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final acceptedUserOfferData = offerManagementProvider.acceptedUserOfferData;
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
            child: acceptedUserOfferData.isEmpty
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
                        'No offer has been accepted by this\n user at the Kyshi marketplace,  it will\n appear here when the user does',
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
                        ...offerManagementProvider.acceptedUserOfferData
                            .map((acceptedUserOfferData) => Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: 83,
                                            child: Text(convertDateTime(
                                                acceptedUserOfferData.createdAt
                                                    .toString()))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                            width: 157,
                                            child: Text(
                                                acceptedUserOfferData.owner ??
                                                    "")),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(acceptedUserOfferData
                                                    .baseCurrency ??
                                                "")),
                                        SizedBox(
                                          width: 38,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: subText(acceptedUserOfferData
                                                    .baseAmount ??
                                                "")),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(acceptedUserOfferData
                                                .baseFee
                                                .toString())),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(acceptedUserOfferData
                                                    .quoteCurrency ??
                                                "")),
                                        SizedBox(
                                          width: 38,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: subText(acceptedUserOfferData
                                                    .quoteAmount ??
                                                "")),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 35,
                                            child: subText(acceptedUserOfferData
                                                .quoteFee
                                                .toString())),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                            width: 70,
                                            child: Text(acceptedUserOfferData
                                                    .exchangeRate ??
                                                "")),
                                        SizedBox(
                                            width: 83,
                                            child: Text(convertDateTime(
                                                acceptedUserOfferData.expiresAt
                                                    .toString()))),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                            width: 140,
                                            child: Text(
                                                acceptedUserOfferData.id ??
                                                    "")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: OfferMangementButton(
                                            text:
                                                acceptedUserOfferData.status ??
                                                    "",
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
