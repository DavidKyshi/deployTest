




import '../../helper/screen_export.dart';

class UserTransactions {
  String wallet;
  String dates;
  String provider;
  String rate;
  String amount;
  String phoneNumber;
  String status;

  UserTransactions({required this.wallet,
    required this.dates,required this.rate,required this.phoneNumber,
  required this.provider,required this.amount, required this.status});
}
class KyshiConnectServices extends StatefulWidget {
  const KyshiConnectServices({Key? key}) : super(key: key);

  @override
  State<KyshiConnectServices> createState() => _KyshiConnectServicesState();
}

class _KyshiConnectServicesState extends State<KyshiConnectServices> {
  List<String> dates = ["Nov 28, 20223:58 PM","Nov 28, 20223:58 PM","Nov 28, 20223:58 PM"];
  List<String> wallets = ["NGN","GBP","USD"];
  List<String> items =["Dates","Wallet","Provider","Phone Number", "Exchange rate","Status"];
  List<String> provider = ["Seerbit","Seerbit","Seerbit"];
  List<String> rate = ["£1/₦900","£1/₦900","£1/₦900"];
  List<String> status = ["Successful","Successful","Failed"];
  List<String> amount = ["3000","3000","3000"];
  List<String> phoneNumber = ["+2341988736636","+2341988736636","+2341988736636"];
  List<UserTransactions> userList = [
    UserTransactions(wallet: "NGN", dates: "Nov 28, 20223:58 PM", status: 'Failed', rate: '£1/₦900', provider: 'Seerbit', phoneNumber: '+23049949904004', amount: '3000'),
    UserTransactions(wallet: "GBP", dates: "Nov 28, 20223:58 PM", amount: '3000', phoneNumber: '+23049949904004', rate: '£1/₦900', status: 'Successful', provider: 'Seerbit'),
    UserTransactions(wallet: "USD", dates: "Nov 28, 20223:58 PM", amount: '3000', phoneNumber: '+23049949904004', rate: '£1/₦900', status: 'Successful', provider: 'Seerbit'),
  ];
  ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        child: Column(
          children:  [
            const SearchFieldDropdown(dropDownTitle: "Health Plans",),
            const SizedBox(height: 20,),
            SingleChildScrollView(
              child: Container(
                height:600,
                decoration:  BoxDecoration(
                    color:const Color(0XFFEAEBF1),
                    borderRadius: BorderRadius.circular(12)
                ),
                width: MediaQuery.of(context).size.width,
                padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text("Dates"),
                        // tooltip: "To Display name"
                        ),
                    DataColumn(label: Text("Wallet")),
                    DataColumn(label: Text("Provider")),
                    DataColumn(label: Text("Phone Number")),
                    DataColumn(label: Text("Amount (₦)")),
                    DataColumn(label: Text("Exchange rate")),
                    DataColumn(label: Text("Status")),
                  ],
                  rows: userList.map(
                        (user) => DataRow(
                      cells: [
                        DataCell(
                          Text(user.dates),
                        ),
                        DataCell(
                          Text(user.wallet),
                        ),
                        DataCell(
                          Text(user.provider),
                        ),
                        DataCell(
                          Text(user.phoneNumber),
                        ),
                        DataCell(
                          Text(user.amount),
                        ),
                        DataCell(
                         Text(user.rate)
                        ),
                        DataCell(
                            Text(user.status)
                        ),
                      ],
                    ),
                  ).toList(),),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
              //   height:600,
              //   width: MediaQuery.of(context).size.width,
              //   decoration:  BoxDecoration(
              //       color:const Color(0XFFEAEBF1),
              //       borderRadius: BorderRadius.circular(12)
              //   ),
              //   child: SizedBox(
              //     height: 500,
              //     width: MediaQuery.of(context).size.width,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context,index){
              //       return UserAccountTable(title: items[index],name: SizedBox(
              //         height: 500,
              //         width: 100,
              //         child: ListView.builder(
              //           controller: controller,
              //           physics: const PageScrollPhysics(),
              //           itemBuilder: (context,index){
              //             return Container(
              //                 decoration: const BoxDecoration(
              //                     border: Border(bottom: BorderSide(color: Colors.greenAccent))
              //                 ),
              //                 padding: const EdgeInsets.symmetric(vertical: 15),
              //                 child:Text(items[index]== "Dates" ? dates[index]:
              //                 items[index]=="Wallet" ?wallets[index]:
              //                 items[index]=="Provider"? provider[index]:
              //                 items[index]=="Phone Number" ? phoneNumber[index]: rate[index]
              //                 ));
              //           },
              //           itemCount: dates.length,
              //         ),
              //       ),);
              //       //   Row(
              //       //   children: [
              //       //     UserAccountTable(title: "Date",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(dates[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Wallet",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(wallets[index]));
              //       //         },
              //       //         itemCount: wallets.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Provider",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(provider[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Phone number",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(phoneNumber[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Amount (₦)",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(amount[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Exchange Rate",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(rate[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //     const SizedBox(width: 25,),
              //       //     UserAccountTable(title: "Status",name: SizedBox(
              //       //       height: 500,
              //       //       width: 100,
              //       //       child: ListView.builder(
              //       //         controller: controller,
              //       //         physics: const PageScrollPhysics(),
              //       //         itemBuilder: (context,index){
              //       //           return Container(
              //       //               padding: const EdgeInsets.symmetric(vertical: 15),
              //       //               child: Text(status[index]));
              //       //         },
              //       //         itemCount: dates.length,
              //       //       ),
              //       //     ),),
              //       //   ],
              //       // )
              //     },itemCount: items.length,),
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
