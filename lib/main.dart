

import 'package:kyshi_operations_dashboard/screens/wallet_management/all_wallets.dart';
import 'package:provider/provider.dart';

import 'helper/screen_export.dart';

void main() {
  // Get.put(MenuController());
  // Get.put(NavigationController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
final pageProvider = PageViewProvider();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (_) => pageProvider),
      ],
      child: MaterialApp(
        title: 'Operation Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'PushPenny',
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            }
          )
        ),
        home: const AllWallets(),
        routes: {
          UserAccountScreen.route:(context)=>UserAccountScreen(),
        },
      ),
    );
  }
}

