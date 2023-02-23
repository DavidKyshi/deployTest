

import 'helper/screen_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(MenuController());
  await dotenv.load(fileName: 'assets/env/.env');
  // Get.put(NavigationController());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UsersProvider()),
    ChangeNotifierProvider(create: (_) => OfferManagementProvider())
    // ChangeNotifierProvider(create: (_) => SendMoneyProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final pageProvider = PageViewProvider();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("${dotenv.env['API_URL']} CHECKING ENV FILE");
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
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            })),
        home: FirstTimer(),
        //FirstTimer(),
        routes: {
          UserAccountScreen.route: (context) => UserAccountScreen(),
        },
      ),
    );
  }
}
