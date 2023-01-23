import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

// ignore: must_be_immutable
class LastDaysFilter extends StatefulWidget {
  LastDaysFilter({super.key});

  @override
  State<LastDaysFilter> createState() => _LastDaysFilterState();
}

class _LastDaysFilterState extends State<LastDaysFilter> {
  String dropdownvalue = 'Last 7 days';

  // List of items in our dropdown menu
  var lastDays = [
    'Today',
    'Yesterday',
    'Last 7 days',
    'Last 30 days',
    'Last 1826 days'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffDDDDDD),
          
          )),
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              underline: Divider(
    color: Color.fromRGBO(236, 3, 3, 1),
    height: 8,
  ),
              borderRadius: BorderRadius.circular(10),
              dropdownColor: Colors.white,
              elevation: 0,
              // Initial Value
              value: dropdownvalue,
              selectedItemBuilder: (BuildContext context){
                return lastDays.map((String items){
                return Center(
                  child: Text(
        dropdownvalue,
        style: const TextStyle( fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff0D2C65) ),
      ),
                );
                }).toList();
              },
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: lastDays.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  
                  child: Text(items,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black
                  ),
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
