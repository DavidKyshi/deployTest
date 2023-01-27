import 'package:kyshi_operations_dashboard/customWidget/searchField.dart';

import '../../helper/screen_export.dart';
import '../../styleguide/colors.dart';

class WalletAndBeneficiaries extends StatefulWidget {
  const WalletAndBeneficiaries({Key? key}) : super(key: key);

  @override
  State<WalletAndBeneficiaries> createState() => _WalletAndBeneficiariesState();
}

class _WalletAndBeneficiariesState extends State<WalletAndBeneficiaries> {
  final List<String> bankNames = ["GT Bank","Kuda Bank"];
  final List<String> accountNum = ["22121386920","01233348485"];
  final List<String> names = ["Bright George","Bright George"];
  final List<String> route = ["NIL","NIL"];
  final List<String> sortCode = ["10019921","10019921"];
  final List<String> currency = ["NGN","NGN"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 800,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                    itemBuilder: (context,index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          walletStatus(title: "NGN wallet details", subTitle: "SET",
                              color: primaryColor, backgroundColor:primaryColor, containerColor: const Color(0x0ff9f9f9), padding2: 60, padding1: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     walletStatus(title: "NGN wallet details", subTitle: "SET",
                          //         color: primaryColor, backgroundColor:primaryColor, containerColor: const Color(0x0ff9f9f9), padding2: 60, padding1: 10),
                          //     walletStatus(title: "GBP wallet deleted", subTitle: 'Re-open application',
                          //         color: Colors.white, backgroundColor:kyshiGreen, containerColor: kyshiRed, padding2: 14, padding1: 10 )
                          //   ],
                          // ),
                          const SizedBox(height: 20,),
                          Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.loose,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/3,
                                padding: const EdgeInsets.only(top: 15,left: 15,right: 60,bottom: 40),
                                decoration:  BoxDecoration(
                                    border:  Border.all(color: const Color(0XFF8C8C8C).withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children:  [
                                        Text("WALLET BALANCE",style: TextStyle(fontSize: 12,fontWeight:
                                        FontWeight.w400,fontFamily: 'PushPenny',color: primaryColor),),
                                        const SizedBox(width: 20,),
                                        Container(
                                          width: 90,
                                          height: 20,
                                          // padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: kyshiGreen,
                                              border: Border.all(color: primaryColor),
                                              borderRadius: BorderRadius.circular(19)
                                          ),
                                          child: const Text("Active",style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'PushPenny',fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    RichText(text:  TextSpan(text: "₦10,078,092.00",style: TextStyle(color: primaryColor,
                                        fontSize: 40,fontWeight: FontWeight.w500))),
                                    const SizedBox(height: 20,),
                                    Container(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 50,left: 15),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: primaryColor),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("BOnus balance",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 8,fontFamily: 'PushPenny',color: kyshiGreyishBlue),),
                                          RichText(text: TextSpan(text: "₦10,078.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: kyshiGreyishBlue),),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  top:200,
                                  child:Container(
                                    padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                    width: MediaQuery.of(context).size.width/3,
                                    // height: 500,
                                    decoration: BoxDecoration(
                                        color: const Color(0XFFF8F9FE),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("BANK ACCOUNT DETAILS",style: TextStyle(color: primaryColor,fontSize: 12,fontFamily:
                                        'PushPenny',fontWeight: FontWeight.w400),),
                                        const SizedBox(height: 15,),
                                        const Divider(color: Colors.white,height: 2,thickness: 2,),
                                        const SizedBox(height: 15,),
                                        bankAccountDetails(detail: "Account Number", value: '01488787992'),
                                        const SizedBox(height: 10,),
                                        bankAccountDetails(detail: "Account Name", value: 'Bright George'),
                                        const SizedBox(height: 10,),
                                        bankAccountDetails(detail: "Bank Name", value: 'VFD Bank'),
                                        const SizedBox(height: 40,),
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius: BorderRadius.circular(24)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: const [
                                              SizedBox(width: 20,),
                                              Text("View full wallet details",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'PushPenny'),),
                                              Icon(Icons.calendar_today_outlined),
                                              SizedBox(width: 20,),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  itemCount: 4,
                    ),
              ),
              // const SizedBox(height: 11,),
              headerTitle(context, title: "Funding Source"),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0XFFF8F9FE),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text("All records were created instantly when they were submitted",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12
                    ,color: Color(0XFF6E7883),fontFamily: 'PushPenny'),),
                    const SizedBox(height: 15,),
                   Row(
                     children: [
                       UserAccountTable(
                         title: "BANK NAME",
                         name: SizedBox(
                           height: 350,
                           width: 100,
                           child: ListView.builder(
                             // controller: controller,
                             physics: const PageScrollPhysics(),
                             itemBuilder: (context, index) {
                               return Container(
                                   padding:
                                   const EdgeInsets.symmetric(vertical: 15),
                                   child: Text(bankNames[index]));
                             },
                             itemCount: bankNames.length,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20,),
                       UserAccountTable(
                         title: "ACCT NO",
                         name: SizedBox(
                           height: 350,
                           width: 100,
                           child: ListView.builder(
                             // controller: controller,
                             physics: const PageScrollPhysics(),
                             itemBuilder: (context, index) {
                               return Container(
                                   padding:
                                   const EdgeInsets.symmetric(vertical: 15),
                                   child: Text(accountNum[index]));
                             },
                             itemCount: accountNum.length,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20,),
                       UserAccountTable(
                         title: "NAME",
                         name: SizedBox(
                           height: 350,
                           width: 100,
                           child: ListView.builder(
                             // controller: controller,
                             physics: const PageScrollPhysics(),
                             itemBuilder: (context, index) {
                               return Container(
                                   padding:
                                   const EdgeInsets.symmetric(vertical: 15),
                                   child: Text(names[index]));
                             },
                             itemCount: names.length,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20,),
                       UserAccountTable(
                         title: "ROUTING NO",
                         name: SizedBox(
                           height: 350,
                           width: 100,
                           child: ListView.builder(
                             // controller: controller,
                             physics: const PageScrollPhysics(),
                             itemBuilder: (context, index) {
                               return Container(
                                   padding:
                                   const EdgeInsets.symmetric(vertical: 15),
                                   child: Text(route[index]));
                             },
                             itemCount: route.length,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20,),
                       UserAccountTable(
                         title: "SORT CODE NO",
                         name: SizedBox(
                           height: 350,
                           width: 100,
                           child: ListView.builder(
                             // controller: controller,
                             physics: const PageScrollPhysics(),
                             itemBuilder: (context, index) {
                               return Container(
                                   padding:
                                   const EdgeInsets.symmetric(vertical: 15),
                                   child: Text(sortCode[index]));
                             },
                             itemCount: sortCode.length,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20,),
                       UserAccountTable(
                         title: "FIN. INST NO",
                         name: SizedBox(
                           height: 350,
                           width: 100,
                           child: ListView.builder(
                             // controller: controller,
                             physics: const PageScrollPhysics(),
                             itemBuilder: (context, index) {
                               return Container(
                                   padding:
                                   const EdgeInsets.symmetric(vertical: 15),
                                   child: Text(route[index]));
                             },
                             itemCount: route.length,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20,),
                       UserAccountTable(
                         title: "BRANCH. TRANSIT NO",
                         name: SizedBox(
                           height: 350,
                           width: 100,
                           child: ListView.builder(
                             // controller: controller,
                             physics: const PageScrollPhysics(),
                             itemBuilder: (context, index) {
                               return Container(
                                   padding:
                                   const EdgeInsets.symmetric(vertical: 15),
                                   child: Text(route[index]));
                             },
                             itemCount: route.length,
                           ),
                         ),
                       ),
                       const SizedBox(width: 20,),
                       UserAccountTable(
                         title: "CURRENCY",
                         name: SizedBox(
                           height: 350,
                           width: 100,
                           child: ListView.builder(
                             // controller: controller,
                             physics: const PageScrollPhysics(),
                             itemBuilder: (context, index) {
                               return Container(
                                   padding:
                                   const EdgeInsets.symmetric(vertical: 15),
                                   child: Text(currency[index]));
                             },
                             itemCount: currency.length,
                           ),
                         ),
                       ),
                     ],
                   )
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              headerTitle(context, title: "Beneficiaries"),
              const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0XFFF8F9FE),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text("All records were created instantly when they were submitted",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12
                        ,color: Color(0XFF6E7883),fontFamily: 'PushPenny'),),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        UserAccountTable(
                          title: "BANK NAME",
                          name: SizedBox(
                            height: 350,
                            width: 100,
                            child: ListView.builder(
                              // controller: controller,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(bankNames[index]));
                              },
                              itemCount: bankNames.length,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        UserAccountTable(
                          title: "ACCT NO",
                          name: SizedBox(
                            height: 350,
                            width: 100,
                            child: ListView.builder(
                              // controller: controller,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(accountNum[index]));
                              },
                              itemCount: accountNum.length,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        UserAccountTable(
                          title: "NAME",
                          name: SizedBox(
                            height: 350,
                            width: 100,
                            child: ListView.builder(
                              // controller: controller,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(names[index]));
                              },
                              itemCount: names.length,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        UserAccountTable(
                          title: "ROUTING NO",
                          name: SizedBox(
                            height: 350,
                            width: 100,
                            child: ListView.builder(
                              // controller: controller,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(route[index]));
                              },
                              itemCount: route.length,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        UserAccountTable(
                          title: "SORT CODE NO",
                          name: SizedBox(
                            height: 350,
                            width: 100,
                            child: ListView.builder(
                              // controller: controller,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(sortCode[index]));
                              },
                              itemCount: sortCode.length,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        UserAccountTable(
                          title: "FIN. INST NO",
                          name: SizedBox(
                            height: 350,
                            width: 100,
                            child: ListView.builder(
                              // controller: controller,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(route[index]));
                              },
                              itemCount: route.length,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        UserAccountTable(
                          title: "BRANCH. TRANSIT NO",
                          name: SizedBox(
                            height: 350,
                            width: 100,
                            child: ListView.builder(
                              // controller: controller,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(route[index]));
                              },
                              itemCount: route.length,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        UserAccountTable(
                          title: "CURRENCY",
                          name: SizedBox(
                            height: 350,
                            width: 100,
                            child: ListView.builder(
                              // controller: controller,
                              physics: const PageScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                    child: Text(currency[index]));
                              },
                              itemCount: currency.length,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container headerTitle(BuildContext context,{required String title}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color(0XFFF9F9F9),
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: const Color(0XFFF3F3F3))),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            color: primaryColor,
            fontFamily: 'PushPenny',
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Row bankAccountDetails({required String detail, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(detail), Text(value)
      ],
    );
  }

  Container walletStatus({required String title, required String subTitle,required
  Color color, required Color backgroundColor,required Color containerColor, required double padding1, required double padding2}) {
    return Container(
      width: MediaQuery.of(context).size.width/3,
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 30),
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: const Color(0XFFF3F3F3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'PushPenny',
                color: color),
          ),
          const SizedBox(width: 10,),
          Container(
            padding:  EdgeInsets.symmetric(vertical: padding1, horizontal: padding2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19), color: backgroundColor),
            child: Text(subTitle,style: TextStyle(color: Colors.white,fontFamily: 'PushPenny',fontWeight: FontWeight.w400,fontSize: 14),),
          )
        ],
      ),
    );
  }
}