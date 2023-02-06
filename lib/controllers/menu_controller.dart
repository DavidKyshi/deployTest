// import 'package:kyshi_operations_dashboard/helper/screen_export.dart';


// class MenuController extends GetxController{
//   // This instance allows you to access the menu controller from anywhere in the code
//   static MenuController instance =  Get.find();
//   var activeItem =  UserAccountPageRoute.obs;
//   var hoverItem = "".obs;

//   changeActiveItemTo(String itemName){
//     activeItem.value = itemName;
//   }
// // When you hover on an item
//   onHover(String itemName){
//     if(!isActive(itemName)) hoverItem.value = itemName;
//   }
//   isActive(String itemName)=> activeItem.value == itemName;
//   isHovering(String itemName)=> hoverItem .value == itemName;

//   //This method returns a widget based on the item name
//   Widget returnIconFor(String itemName){
//     switch (itemName) {
//       case UserAccountPageRoute:
//         return _customImage(userAccountIcon, itemName, greyUserAccountIcon, 24,24);
//       case OfferManagementPageRoute:
//         return _customImage(offerManagementIcon, itemName, greyOfferManagementIcon, 20,20);
//         // case AuthenticationPageRoute:
//         // return _customImage(userAccountIcon, itemName);
//       default: 
//         return _errorRoute();
//     }
//   }

//   static _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Nothing to see here'),
//         ),
//         body: Center(
//           child: Text('Mischief managed'),
//         ),
//       );
//     });
//   }

//   Widget _customImage(String image, String itemName, String grayImage, double width, double height){
//     if(isActive(itemName)) return Image.asset(image, width: width, height: height,);
    
//     return !isHovering(itemName)?
//     Image.asset(grayImage, width: width, height: height, )
//     : Image.asset(image,width: width, height: height,);
//   }

//   //  Widget _customIcon(String image, String itemName){
//   //   if(isActive(itemName)) return Image.asset(image, width: 24, height: 24,);
    
//   //   return !isHovering(itemName)?
//   //   Image.asset(image, color:Colors.grey,)
//   //   : Image.asset(image,);
//   // }
// }