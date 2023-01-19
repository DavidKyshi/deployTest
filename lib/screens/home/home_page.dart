import '../../helper/screen_export.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
            children: const [
             SideBar(),
              Expanded(
                  flex: 4,
                  child: Text('Please Navigate')
              )
              ]),
    );
  }
}