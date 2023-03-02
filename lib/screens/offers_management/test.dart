// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../../helper/screen_export.dart';

class TextTab extends StatefulWidget {
  const TextTab({super.key});

  @override
  State<TextTab> createState() => _TextTabState();
}

class _TextTabState extends State<TextTab> {
 OfferManagementProvider get offerManagementProvider =>
      Provider.of<OfferManagementProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
   final offersData = offerManagementProvider.offerData;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0XFFEAEBF1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Container(
                          width: 190,
                          child: Row(children: [ Text('Created'),
                          SizedBox(width: 60,),
                          Text('User'),],),
                         ),
                         
                          SizedBox(
                            width: 220,
                            child: Row(children: [Text('Currency'),
                           SizedBox(width: 30,),
                          Text('Amount'),
                          SizedBox(width: 30,),
                          Text('Fee (%)'),],),
                          ),
                         
                          Text('Currency'),
                         
                          Text('Amount'),
                           
                          Text('Fee (%)'),
                           
                          Text('Rate'),
                           
                          Text('Expire'),
                           
                          Text('ID'),
                         
                          Text('Status'),
                        ],
                  ),
                  ...offerManagementProvider.offerData
                          .map((offersData)=> Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 83,
                                    child: Text(convertDateTime(offersData.createdAt.toString()))),
                                    SizedBox(width: 20,),
                                  SizedBox(
                                    width: 152,
                                    child: Text(offersData.owner??"")),
                                      SizedBox(width: 30,),
                                    SizedBox(
                                    width: 35,
                                    child: Text(offersData.baseCurrency??"")),

                                ],
                              ),
                              SizedBox(height: 20,)
                            ],
                          )
                          ).toList()
                      ],
                    ),
                    
                  ),
                  
                
                ],
              )),
        ),
      ),
    );
  }
}


// class UseAsBackgroundTab extends StatelessWidget {
//   const UseAsBackgroundTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [

//         ],
//       ),
//     );
//   }
// }