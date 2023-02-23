// // ignore_for_file: prefer_const_constructors
// import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

// class SideMenuItem extends StatelessWidget {
//   const SideMenuItem({super.key, required this.itemName, required this.onTap});
//   final String itemName;
//   final Function() onTap;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: onTap,
//         onHover: (value) {
//           value
//               ? menuController.onHover(itemName)
//               : menuController.onHover('not Hovering');
//         },
//         child: Column(
//             children: [
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(0),
//                     child: menuController.returnIconFor(itemName),
//                   ),
//                   // Image.asset(offerManagementIcon, width: 20, height: 20,),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   if (!menuController.isActive(itemName))
//                     Flexible(
//                         child: CustomText(
//                       text: itemName,
//                       color: menuController.isHovering(itemName)
//                           ? Color(0xff233375)
//                           : Color(0xff8C8C8C),
//                     ))
//                     else
//                     Flexible(child: CustomText(text: itemName, color: Color(0xff233375),)),

//                   // Text('Offer Management',
//                   // style: TextStyle(
//                   //   fontFamily: "PushPenny",
//                   //   fontSize: 12,
//                   //   color: Color(0xff8C8C8C),
//                   //   fontWeight: FontWeight.w400
//                   // ),
//                   // )
//                 ],
//               ),
//                SizedBox(
//                 height: 10,
//               )
//             ],
//           ),
//         );
//   }
// }

// class CustomText extends StatelessWidget {
//   CustomText({super.key, required this.text, required this.color});
//   final String text;
//   final Color color;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(
//           fontFamily: "PushPenny",
//           fontSize: 12,
//           color: Color(0xff8C8C8C),
//           fontWeight: FontWeight.w400),
//     );
//   }
// }
