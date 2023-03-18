// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../../helper/screen_export.dart';
import '../../styleguide/colors.dart';
import 'all_offer.dart';

class TextTab extends StatefulWidget {
  const TextTab({super.key});

  @override
  State<TextTab> createState() => _TextTabState();
}

class _TextTabState extends State<TextTab> {
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
  Widget build(BuildContext context) {
    // final offersData = offerManagementProvider.offerData;
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 83,
                                      child: Text(convertDateTime(
                                          offersData.createdAt.toString()))),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                      width: 157,
                                      child:Column(
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
                                      child:
                                          subText(offersData.baseAmount ?? "")),
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
                                          offersData.quoteCurrency ?? "")),
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
                                      child: subText(
                                          offersData.quoteFee.toString())),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                      width: 70,
                                      child:
                                          Text(offersData.exchangeRate ?? "")),
                                  SizedBox(
                                      width: 83,
                                      child: Text(convertDateTime(
                                          offersData.expiresAt.toString()))),
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
