

import '../../helper/screen_export.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
            children:  [
             Expanded(child: SideBar()),
              Expanded(
                  flex: 5,
                  child: localNavigator()
              )
              ]),
    );
  }
}