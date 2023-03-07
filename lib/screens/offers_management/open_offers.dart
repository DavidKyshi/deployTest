// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../widgets/accept_offer_alertbox.dart';
import 'all_offer.dart';

class OpenOfferTable extends StatefulWidget {
  OpenOfferTable({super.key});

  @override
  State<OpenOfferTable> createState() => _OpenOfferTableState();
}

class _OpenOfferTableState extends State<OpenOfferTable> {
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
          fontSize: 14,
         fontWeight: FontWeight.w500,
         color: Color(0xff233375)),
    );
  }
  @override
  Widget build(BuildContext context) {
    final openOffersData = offerManagementProvider.openOfferData;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0XFFEAEBF1),
                borderRadius: BorderRadius.circular(12)),
              child: openOffersData.isEmpty
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
                          'We currently don’t have an open \n offer at the Kyshi marketplace,  it will \n appear here when we do',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: "PushPenny",
                              color: primaryColor),
                        ),
                      ],
                    )
                  : 
                 Padding(
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
                  SizedBox(width: 120,),
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
                   SizedBox(width: 30,),
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 250, 20),
                child: SizedBox(
              
                  width: 300,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text('BASE',
                      style: TextStyle(
              color: primaryColor.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
                      ),
                      Text('QUOTE',
                      style: TextStyle(
              color: primaryColor.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
                      ),
                  ],
                ),
                ),
              ),
              ...offerManagementProvider.openOfferData
                  .map((openOfferData) => Column(
                        children: [
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 83,
                                  child: Text(convertDateTime(
                                      openOfferData.createdAt
                                          .toString()))),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                  width: 157,
                                  child:
                                      Text(openOfferData.owner ?? "")),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                  width: 35,
                                  child: subText(
                                      openOfferData.baseCurrency ?? "")),
                              SizedBox(
                                width: 38,
                              ),
                              SizedBox(
                                  width: 70,
                                  child: subText(
                                      openOfferData.baseAmount ?? "")),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                  width: 35,
                                  child: subText(
                                      openOfferData.baseFee.toString())),

                                      SizedBox(
                                width: 50,
                              ),

                                      SizedBox(
                                  width: 35,
                                  child: subText(
                                      openOfferData.quoteCurrency ?? "")),
                              SizedBox(
                                width: 38,
                              ),
                              SizedBox(
                                  width: 70,
                                  child: subText(
                                      openOfferData.quoteAmount ?? "")),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                  width: 35,
                                  child: subText(
                                      openOfferData.quoteFee.toString())),

                                      SizedBox(
                                width: 30,
                              ),
 
                                      SizedBox(
                                  width: 70,
                                  child: Text(
                                      openOfferData.exchangeRate ?? "")),

                                  SizedBox(
                                  width: 83,
                                  child: Text(convertDateTime(
                                      openOfferData.expiresAt
                                          .toString()))), 
                                          SizedBox(
                                            width: 20,
                                          ),

                                     SizedBox(
                                  width: 140,
                                  child: Text(
                                      openOfferData.id ?? "")),           
                                    SizedBox(
                                            width: 20,
                                          ),
                                  SizedBox(
                                    width: 100,
                                    child:  OfferMangementButton(
                                                  text: openOfferData
                                                          .status ??
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
                color: primaryColor, borderRadius: BorderRadius.circular(4)),
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
