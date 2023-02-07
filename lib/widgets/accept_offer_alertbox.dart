// ignore_for_file: prefer_const_constructors

import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

import '../helper/screen_export.dart';

acceptOfferAlertBox(BuildContext context){
  return showDialog(
                context: context,
              builder: (BuildContext context){
                
             return   AlertDialog(
                  insetPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Container(
                     height: 444.56,
            width: 529,
                    child:  Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: (){
                               Navigator.of(context).pop();
                            },
                            child: Image.asset('assets/images/cancel.png',width: 40, height: 40,))),
                            SizedBox(height: 10,),
                            Image.asset('assets/images/accept_warning.png', width: 187.06, height: 187.06,),
                            Text('Heads Up!',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              fontFamily: "PushPenny"
                            ),
                            ),
                              SizedBox(height: 15,),
                            Container(
                              width: 399,
                              child: Center(
                                child: RichText(
                                  textAlign:TextAlign.center,
                                  text: TextSpan(
                                  text: 'You are about to accept the selected offer ',
                                  style: TextStyle(
                                    color: Color(0xff6E80A3),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "PushPenny"
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '6086346c-c5ac-98..',
                                      style: TextStyle(
                                         color: primaryColor
                                      )
                                    )
                                  ]
                                )),
                              ),
                            ),
                             SizedBox(height: 15,),
                            Container(
                              width: 378,
                              height: 46,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                       Navigator.of(context).pop();
                                    },
                                    child: DeclineButton()),
                                  InkWell(
                                    onTap: (){
                                       Navigator.of(context).pop();
                                    },
                                    child: AcceptButton())
                                ],
                              ),
                            )
                      ],
                    )),
                  
                );}
              );
}

class DeclineButton extends StatelessWidget {
   DeclineButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 46,
      decoration: BoxDecoration(
       border: Border.all(
        color: Color(0xffFBFBFB),
       ),
      borderRadius: BorderRadius.circular(30),
      )
      ,
      child: Center(
        child: Text('Cancel',
        style: TextStyle(
          color: Color(0xff6E80A3),
          fontSize: 14,
          fontWeight: FontWeight.w400
        ),
        ),
      ),
    );
  }
}

class AcceptButton extends StatelessWidget {
   AcceptButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 46,
      decoration: BoxDecoration(
       color: primaryColor,
      borderRadius: BorderRadius.circular(30),
      )
      ,
      child: Center(
        child: Text('Accept',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400
        ),
        ),
      ),
    );
  }
}