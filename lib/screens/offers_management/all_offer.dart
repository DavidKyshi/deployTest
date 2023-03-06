// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../widgets/accept_offer_alertbox.dart';

class AllOfferTable extends StatefulWidget {
  AllOfferTable({super.key});

  @override
  State<AllOfferTable> createState() => _AllOfferTableState();
}

class _AllOfferTableState extends State<AllOfferTable> {

  late ScrollController controller;

  final List<String> date = [
    "Nov 28, 2022 3:58 PM",
    "Nov 28, 2022 3:58 PM",
    "Nov 28, 2022 3:58 PM",
  ];
  final List<String> date2 = [
    "Nov 28, 2022 3:58 PM",
    "Nov 28, 2022 3:58 PM",
  ];
  final List<String> createdBy = [
    "Bright George brightgerg@yahoo.com",
    "Bright George brightgerg@yahoo.com",
    "Bright George brightgerg@yahoo.com",
  ];
  final List<String> currency = ['GBP', 'GBP', 'GBP'];
  final List<String> amount = ['100.00', '100.00', '100.00'];
  final List<String> fee = ['1', '1', '1'];
  final List<String> charges = ['1.00', '1.00', '1.00'];
  final List<String> rate = ['930.00', '930.00', '930.00'];
  final List<String> id = [
    '6086346c-c5ac-98..',
    '6086346c-c5ac-98..',
    '6086346c-c5ac-98..'
  ];
  final List<String> email2 = [
    "Bright George brightgerg@yahoo.com",
    "Bright George brightgerg@yahoo.com",
  ];

 TableRow buildHeaderRow(List<String> cells)=>TableRow(
   children: cells.map((cell)=>Text(cell,
   style: TextStyle(
color: primaryColor,
                  fontFamily: 'PushPenny',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
   ),
   )).toList()
 );

 TableRow buildBodyRow(List<String> cells)=>TableRow(
   children: cells.map((cell)=>Text(cell,
   style: TextStyle(
color: primaryColor,
                  fontFamily: 'PushPenny',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
   ),
   )).toList()
 );

  OfferManagementProvider get offerManagementProvider=>
      Provider.of<OfferManagementProvider>(context, listen: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  final allOffer= Provider.of<OfferManagementProvider>(context, listen: false)
    //                       .getAllOfferManagement();
    //final allOffer =offerManagementProvider.getAllOfferManagement() ;
    final offersData = offerManagementProvider.offerData;
    String formattedDateTime = convertDateTime(offersData[0].createdAt.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Stack(
            children: [
              Container(
                  // padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0XFFEAEBF1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // Text(offersData[0].owner??""),
                          // Table(
                          //   columnWidths: {
                          //     0: FractionColumnWidth(0.1),
                          //     1: FractionColumnWidth(0.1),
                          //     2: FractionColumnWidth(0.05),
                          //     3: FractionColumnWidth(0.05),
                          //     4: FractionColumnWidth(0.05),
                          //     5: FractionColumnWidth(0.05),
                          //     6: FractionColumnWidth(0.05),
                          //     7: FractionColumnWidth(0.05),
                          //     8: FractionColumnWidth(0.05),
                          //     9: FractionColumnWidth(0.05),
                          //     10: FractionColumnWidth(0.05),
                          //     11: FractionColumnWidth(0.05),
                          //     12: FractionColumnWidth(0.05),
                          //     13: FractionColumnWidth(0.05),
                          //   },
                          //   children: [
                          //     buildHeaderRow([
                          //       'Created',
                          //       'User',
                          //       'Currency',
                          //       'Amount',
                          //       'Fee (%)',
                          //       'Charges',
                          //       'Currency',
                          //       'Amount',
                          //       'Fee (%)',
                          //       'Charges',
                          //       'Rate',
                          //       'Expire',
                          //       'ID',
                          //       'Status'
                          //     ]),
                          //   ],
                          // ),
                          // ...offerManagementProvider.offerData
                          //     .map((offersData) => Table(
                          //           columnWidths: {
                          //             0: FractionColumnWidth(0.1),
                          //             1: FractionColumnWidth(0.1),
                          //             2: FractionColumnWidth(0.05),
                          //             3: FractionColumnWidth(0.05),
                          //             4: FractionColumnWidth(0.05),
                          //             5: FractionColumnWidth(0.05),
                          //             6: FractionColumnWidth(0.05),
                          //             7: FractionColumnWidth(0.05),
                          //             8: FractionColumnWidth(0.05),
                          //             9: FractionColumnWidth(0.05),
                          //             10: FractionColumnWidth(0.05),
                          //             11: FractionColumnWidth(0.05),
                          //             12: FractionColumnWidth(0.05),
                          //             13: FractionColumnWidth(0.05),
                          //           },
                          //           children: [
                          //             buildBodyRow([
                          //               offersData.createdAt.toString(),
                          //               offersData.owner ?? "fff",
                          //               offersData.baseCurrency ?? "",
                          //               offersData.baseAmount??"",
                          //               offersData.baseFee.toString(),
                          //               "1.00",
                          //               offersData.quoteCurrency ?? "",
                          //               offersData.quoteAmount??"",
                          //               offersData.quoteFee.toString(),
                          //               "930.00",
                          //               offersData.exchangeRate??"",
                          //               offersData.expiresAt.toString(),
                          //               offersData.id??"",
                          //               OfferMangementButton( text: offersData.status??"",).toString()

                          //             ])
                          //           ],
                          //         ))
                          //     .toList(),
                          //Text('HI'),
                          //Text(offersData.owner??"fff")
                         
                              
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: 340,
                            decoration: BoxDecoration(
                              //color: Colors.amber,
                              border: Border(
                                right: BorderSide(
                                  color: primaryColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            child: Row(
                              children: [
                               AllOfferTitleTable(
                                  title: 'Created',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 83,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: PageScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            // padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
formattedDateTime,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff233375)),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: date.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                AllOfferTitleTable(
                                  title: 'User',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 155,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //  padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData[index].owner??"",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff233375)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: createdBy.length,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                              
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            decoration: BoxDecoration(
                              //color: Colors.amber,
                              color: Colors.white,
                              border: Border(
                                right: BorderSide(
                                  color: Color(0xffF4F5F8),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                AllOfferTitleTable(
                                  title: 'Currency',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 35,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //  padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData[index].baseCurrency??"",
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: currency.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                AllOfferTitleTable(
                                  title: 'Amount',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 60,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //   padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData[index].baseAmount??"",
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: amount.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                AllOfferTitleTable(
                                  title: 'Fee (%)',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 35,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //   padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData[index].baseFee.toString(),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: fee.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                AllOfferTitleTable(
                                  title: 'Charges',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 35,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //   padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              charges[index],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: charges.length,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //  hkhkkhkhkkhkhkhkhkhkhkhkhkhkhkhhkhkhkhkh
                         ...offerManagementProvider.offerData
                              .map((offersData)=>  Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            decoration: BoxDecoration(
                              //color: Colors.amber,
                              color: Colors.white,
                              border: Border(
                                right: BorderSide(
                                  color: Color(0xffF4F5F8),
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                AllOfferTitleTable(
                                  title: 'Currency',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 35,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //  padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData.quoteCurrency??"",
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: currency.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                AllOfferTitleTable(
                                  title: 'Amount',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 70,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //   padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData.quoteAmount??"",
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: amount.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                AllOfferTitleTable(
                                  title: 'Fee (%)',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 35,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //   padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData.quoteFee.toString(),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: fee.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                AllOfferTitleTable(
                                  title: 'Charges',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 35,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //   padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              charges[index],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: charges.length,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ) ).toList(),

                          //tttttttttt
                        Container(
                            height: MediaQuery.of(context).size.height,
                            // width: 640,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            child: Row(
                              children: [
                                AllOfferTitleTable(
                                  title: 'Rate',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 52,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: PageScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            // padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData[index].exchangeRate.toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff233375)),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: rate.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                AllOfferTitleTable(
                                  title: 'Expire',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 95,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //  padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          children: [
                                            Text(
                                              offersData[index].expiresAt.toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff233375)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: date.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                AllOfferTitleTable(
                                  title: 'ID',
                                  name: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: 140,
                                    child: ListView.builder(
                                      // controller: controller,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            //  padding: const EdgeInsets.symmetric(vertical: 15),
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              offersData[index].id??"",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff233375)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: id.length,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                AllOfferTitleTable(
                                  title: 'Status',
                                  name: SizedBox(
                                      height: MediaQuery.of(context).size.height,
                                      width: 100,
                                      child: ListView.builder(
                                         itemCount: 3,
                                         physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index){
                                          return Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                           OfferMangementButton(
                                              
                                              text: offersData[index].status??"",
                                            ),
                                            SizedBox(
                                              height: 35,
                                            ),
                                            // InkWell(
                                            //     onTap: () {
                                            //       acceptOfferAlertBox(context);
                                            //       print('working');
                                            //     },
                                            //     child: OfferButton(
                                            //       isBorder: true,
                                            //       text: 'OPEN',
                                            //     )),
                                            // SizedBox(
                                            //   height: 35,
                                            // ),
                                            // OfferButton(
                                            //   isBorder: false,
                                            //   text: 'ACCEPTED',
                                            // ),
                                          ],
                                        ),
                                      );
                                        })
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ])
                        ,
                  )
                  ),
              //  Positioned(
              //  left: 490,
              //   top: 125,
              //   bottom: 0,
              //   child: Text('BASE',
              //   style: TextStyle(
              //     color: primaryColor.withOpacity(0.5),
              //     fontSize: 12,
              //     fontWeight: FontWeight.w500
              //   ),
              //   )
              //   ),
            ],
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
      required this.text, this.color,
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
            height:  40 ,
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
      required this.text
      });

  // bool isBorder;
  String text;
 
  @override
  Widget build(BuildContext context) {
    return 
        Container(
            width:  73,
            height:  24,
            decoration: BoxDecoration(
                color: text == "OPEN"
                    ? Colors.white
                    : text == "CLOSE"
                        ? Color(0xffFF5C5C)
                        : text == "ACCEPTED"?
                        primaryColor
                        : text == "EXPIRED"?
                        Color(0xffFBCD58):
                         Color(0XFFEF845C),
                borderRadius: BorderRadius.circular(4),
                 border: text == "OPEN" ?Border.all(color: Color(0xff23CE6B)): Border.all(color: Colors.transparent)
                ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: text == "OPEN"?
                    Color(0xff23CE6B)
                     : text == "EXPIRED"?
                     Colors.black:
                     Colors.white
                    ,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
  }
}