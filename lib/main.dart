

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kyshi_operations_dashboard/screens/authentication/first_time_login.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/all_wallets.dart';
import 'package:kyshi_operations_dashboard/screens/wallet_management/all_wallets.dart';
import 'package:provider/provider.dart';

import 'helper/screen_export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(MenuController());
  await dotenv.load(fileName: 'assets/env/.env');
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
        home:  FirstTimer(),
        routes: {
          UserAccountScreen.route:(context)=>UserAccountScreen(),
        },
      ),
    );
  }
}

