// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../../widgets/accept_offer_alertbox.dart';

class OfferManageAcceptedOfferTable extends StatefulWidget {
   OfferManageAcceptedOfferTable({super.key});

  @override
  State<OfferManageAcceptedOfferTable> createState() => _OfferManageAcceptedOfferTableState();
}

class _OfferManageAcceptedOfferTableState extends State<OfferManageAcceptedOfferTable> {
 late ScrollController controller;

   final List<String> date = ["Nov 28, 2022 3:58 PM","Nov 28, 2022 3:58 PM","Nov 28, 2022 3:58 PM",];
   final List<String> date2 = ["Nov 28, 2022 3:58 PM","Nov 28, 2022 3:58 PM",];
   final List<String> createdBy = ["Bright George brightgerg@yahoo.com","Bright George brightgerg@yahoo.com","Bright George brightgerg@yahoo.com",];
   final List<String> currency = ['GBP', 'GBP','GBP'];
   final List<String> amount = ['100.00', '100.00','100.00'];
   final List<String> fee = ['1', '1','1'];
   final List<String> charges = ['1.00', '1.00','1.00'];
   final List<String> rate =['930.00', '930.00', '930.00'];
   final List<String> id = ['6086346c-c5ac-98..', '6086346c-c5ac-98..','6086346c-c5ac-98..'];
   final List<String> email2 = ["Bright George brightgerg@yahoo.com","Bright George brightgerg@yahoo.com",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
          child: Stack(
            children: [
             
              Container(
               // padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration:  BoxDecoration(
                      color:const Color(0XFFEAEBF1),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child:
                   ListView(
                   scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                       height:  MediaQuery.of(context).size.height,
                       width: 340,
                       
                       decoration: BoxDecoration(
                         //color: Colors.amber,
                         border: Border(right: BorderSide(color: primaryColor,
                         width: 2,
                         ),
                         
                         ),
                       ),
                        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                        child: Row(
                          children: [
                            AllOfferTitleTable( 
                              title: 'Created',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 83,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  PageScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                     // padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(date[index],
                                          style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                           color: Color(0xff233375)
                                          ),
                                          ),
                                          SizedBox(height: 30,)
                                        ],
                                      ));
                                },
                                itemCount: date.length,
                              ),
                            ),
                             ),
                             SizedBox(width: 20,),
                             AllOfferTitleTable( 
                              title: 'User',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 155,
                              child: ListView.builder(
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                    //  padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(createdBy[index],
                                           style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                           color: Color(0xff233375)
                                          ),
                                          ),
                                          SizedBox(height: 30,)
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
                       
                       padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                        decoration: BoxDecoration(
                         //color: Colors.amber,
                         color: Colors.white,
                         border: Border(right: BorderSide(color: Color(0xffF4F5F8),
                         width: 2,
                         ),
                         
                         ),
                       ),
                       child: Row(
                         children: [
                           AllOfferTitleTable( 
                              title: 'Currency',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 35,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                    //  padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(currency[index],),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: currency.length,
                              ),
                            ),
                             ),
                             SizedBox(width: 30,),
                             AllOfferTitleTable( 
                              title: 'Amount',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 60,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                   //   padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(amount[index],),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: amount.length,
                              ),
                            ),
                             ),
                             SizedBox(width: 30,),
                             AllOfferTitleTable( 
                              title: 'Fee (%)',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 35,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                   //   padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(fee[index],),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: fee.length,
                              ),
                            ),
                             ),
                             SizedBox(width: 30,),
                             AllOfferTitleTable( 
                              title: 'Charges',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 35,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                   //   padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(charges[index],),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: charges.length,
                              ),
                            ),
                             ),
                         ],
                       ),
                      ) ,
                     //  hkhkkhkhkkhkhkhkhkhkhkhkhkhkhkhhkhkhkhkh
                     Container(
                       
                       padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                        decoration: BoxDecoration(
                         //color: Colors.amber,
                         color: Colors.white,
                         border: Border(right: BorderSide(color: Color(0xffF4F5F8),
                         width: 2,
                         ),
                         
                         ),
                       ),
                       child: Row(
                         children: [
                           AllOfferTitleTable( 
                              title: 'Currency',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 35,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                    //  padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(currency[index],),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: currency.length,
                              ),
                            ),
                             ),
                             SizedBox(width: 30,),
                             AllOfferTitleTable( 
                              title: 'Amount',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 60,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                   //   padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(amount[index],),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: amount.length,
                              ),
                            ),
                             ),
                             SizedBox(width: 30,),
                             AllOfferTitleTable( 
                              title: 'Fee (%)',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 35,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                   //   padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(fee[index],),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: fee.length,
                              ),
                            ),
                             ),
                             SizedBox(width: 30,),
                             AllOfferTitleTable( 
                              title: 'Charges',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 35,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                   //   padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(charges[index],),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: charges.length,
                              ),
                            ),
                             ),
                         ],
                       ),
                      ) ,
                     
                      //tttttttttt
                      Container(
                       height:  MediaQuery.of(context).size.height,
                      // width: 640,
                        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                        child: Row(
                          children: [
                            AllOfferTitleTable( 
                              title: 'Rate',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 52,
                              child: 
                              ListView.builder(
                               
                                // controller: controller,
                                physics:  PageScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                     // padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(rate[index],
                                          style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                           color: Color(0xff233375)
                                          ),
                                          ),
                                          SizedBox(height: 40,)
                                        ],
                                      ));
                                },
                                itemCount: rate.length,
                              ),
                            ),
                             ),
                             SizedBox(width: 20,),
                             AllOfferTitleTable( 
                              title: 'Expire',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 83,
                              child: ListView.builder(
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                    //  padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                        children: [
                                          Text(date[index],
                                           style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                           color: Color(0xff233375)
                                          ),
                                          ),
                                          SizedBox(height: 20,)
                                        ],
                                      ));
                                },
                                itemCount: date.length,
                              ),
                            ),
                             ),
                               SizedBox(width: 20,),
                             AllOfferTitleTable( 
                              title: 'ID',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 65,
                              child: ListView.builder(
                                // controller: controller,
                                physics:  NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return Container(
                                    //  padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(id[index],
                                           style: TextStyle(
                                           fontSize: 14,
                                           fontWeight: FontWeight.w400,
                                           color: Color(0xff233375)
                                          ),
                                          ),
                                          SizedBox(height: 20,)
                                        ],
                                      ));
                                },
                                itemCount: id.length,
                              ),
                            ),
                             ),
                               SizedBox(width: 20,),
                              AllOfferTitleTable( 
                              title: 'Status',
                             name: SizedBox(
                              height:  MediaQuery.of(context).size.height,
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 OfferButton(isBorder: false, text: 'ACCEPTED', ),
                                 SizedBox(height: 35,),
                                 InkWell(
                                  onTap: (){
                                    acceptOfferAlertBox(context);
                                    print('working');
                                  },
                                  child: OfferButton(isBorder: false, text: 'ACCEPTED', )),
                                  SizedBox(height: 35,),
                                 OfferButton(isBorder: false, text: 'ACCEPTED', ),
                               ],
                              )
                            ),
                             ),
                          ],
                        ),
                      ),
                     ]
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
   OfferButton({super.key, required this.isBorder, required this.text});

 bool isBorder;
 String text;
  @override
  Widget build(BuildContext context) {
    return isBorder?
    Container(
      width: 73,
      height: 24,
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xff23CE6B))
        
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
             color: Color(0xff23CE6B),
            fontSize: 10,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    ) :
    Container(
      width: 73,
      height: 24,
      
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Center(
        child: Text(text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500
        ),
        ),
      ),
    ) ;
  }
}
