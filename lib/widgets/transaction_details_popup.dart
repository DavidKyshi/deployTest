// ignore_for_file: prefer_const_constructors


import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../helper/screen_export.dart';


confirmPopUp(BuildContext context){
  return showDialog(
                      context: context,
                      builder: (ctx) =>  AlertDialog(
                      insetPadding: const EdgeInsets.all(20),
                      shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                        content: SizedBox(
                          height: 791.03,
                          width: 687,
                          child: SingleChildScrollView(
                            child: Padding(
                            padding:  const EdgeInsets.fromLTRB(
                                        30, 30, 30, 0),
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
                                                  'Confirm to submit this offer',
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
                                                  'You are about to create an offer in the marketplace. Proceed?',
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

                                        Divider(),
                                      
                                        Row(
                                          children: [
                                           

                                             InkWell(
                                              onTap: () {
                                                 Navigator.of(context).pop();
                                              },
                                               child: Container(
                                                width: 203,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffF8F9FE),
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Color(0xffDDDDDD))
                                                ),
                                                child: Center(child: Text('No, go back',
                                                                                               style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: primaryColor
                                                ),
                                                )),
                                                                                         ),
                                             ),

                                             InkWell(
                                              onTap: (){

                                                Navigator.of(context).pop();
                                                showDialog(
                      context: context,
                      builder: (ctx) =>  AlertDialog(
                      insetPadding: const EdgeInsets.all(20),
                      shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                        content: SizedBox(
                          height: 791.03,
                          width: 687,
                          child: SingleChildScrollView(
                            child: Padding(
                            padding:  const EdgeInsets.fromLTRB(
                                        30, 30, 30, 0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Image.asset(
                                          'assets/images/cancel.png',
                                          width: 40,
                                          height: 40,
                                        )),
                                  ),

                                        
                                        Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.asset(createOfferSuccessfull),
                                                SizedBox(height: 20,),
                                                Text(
                                                  'Offer has been submitted',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 24,
                                                      color: primaryColor,
                                                      fontFamily: "PushPenny"),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Your exchange offer has been successfully placed in the marketplace.',
                                                  textAlign: TextAlign.center,
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
                                          child: Container(
                                           width: 203,
                                           height: 56,
                                           decoration: BoxDecoration(
                                             color: Color(0xffF8F9FE),
                                             borderRadius: BorderRadius.circular(10),
                                             border: Border.all(color: Color(0xffDDDDDD))
                                           ),
                                           child: Center(child: Text('Go back',
                                                                                          style: TextStyle(
                                             fontSize: 16,
                                             fontWeight: FontWeight.w500,
                                             color: primaryColor
                                           ),
                                           )),
                                                                                    ),
                                        )
                                ],
                              ),
                              ),
                          ),
                        ),
                        
                      ),
                    );
                                              },
                                               child: Container(
                                                width: 203,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  color: primaryColor,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Center(child: Text('Yes, submit offer',
                                                                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white
                                                ),
                                                )),
                                                                                         ),
                                             ),
                                          ],
                                        )
                                ],
                              ),
                              ),
                          ),
                        ),
                        
                      ),
                    );
}