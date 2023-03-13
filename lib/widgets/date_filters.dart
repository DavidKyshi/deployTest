// ignore_for_file: prefer_const_constructors

import 'package:intl/intl.dart';
import 'package:kyshi_operations_dashboard/helper/screen_export.dart';
import 'package:kyshi_operations_dashboard/styleguide/colors.dart';

class _FilterRanger {
  final String title;
  final int daysAgo;

  const _FilterRanger(this.title, this.daysAgo);
}

  const List<_FilterRanger> lastDays = [
    _FilterRanger('Today', 0),
    _FilterRanger('Yesterday', 1),
    _FilterRanger('Last 7 days', 6),
    _FilterRanger('Last 30 days', 29),
    _FilterRanger('Last 1826 days', 1825),
  ];
// ignore: must_be_immutable
class LastDaysFilter extends StatefulWidget {
  LastDaysFilter({super.key});

  @override
  State<LastDaysFilter> createState() => _LastDaysFilterState();
}

class _LastDaysFilterState extends State<LastDaysFilter> {
  _FilterRanger dropdownvalue = lastDays[2];

  // List of items in our dropdown menu


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xffDDDDDD),
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<_FilterRanger>(
                isExpanded: true,
                borderRadius: BorderRadius.circular(10),
                dropdownColor: Colors.white,
                elevation: 1,
                // Initial Value
                value: dropdownvalue,
                selectedItemBuilder: (BuildContext context) {
                  return lastDays.map((items) {
                    return Center(
                      child: Text(
                        dropdownvalue.title,
                        style:  TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff0D2C65)),
                      ),
                    );
                  }).toList();
                },
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: lastDays.map((items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Container(
                      // width:double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xffDDDDDD), width: 0.5))),
                      child: Text(
                        items.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: ( newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                  Provider.of<UsersProvider>(context,listen:false).getDaysAgo(context:context,daysAgo:newValue?.daysAgo.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalenderPickDate extends StatefulWidget {
  const CalenderPickDate({super.key});

  @override
  State<CalenderPickDate> createState() => _CalenderPickDateState();
}

class _CalenderPickDateState extends State<CalenderPickDate> {
  DateTime date = DateTime.now();
  DateTime lastdate = DateTime.now();
  late var formattedDate;
  late var lastformattedDate;
  @override
  void initState() {
    formattedDate = DateFormat('d-MMM-yy').format(date);
    lastformattedDate = DateFormat('d-MMM-yy').format(lastdate);
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  // final difference = daysBetween(date,lastdate);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            await showDatePicker(
              context: context,
              firstDate: DateTime(2022),
              lastDate: DateTime(2030),
              initialDate: date,
            ).then((selectedDate) {
              if (selectedDate != null) {
                setState(() {
                  date = selectedDate;
                  formattedDate = DateFormat('d-MMM-yy').format(selectedDate);
                });
              }
            });

            // setState(() {
            //   firstDate
            // });
          },
          child: Container(
            width: 157,
            height: 49,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xffDDDDDD),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                )),
            child: Center(
              child: Text(
                formattedDate,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: "PushPenny",
                    color: Color(0xff0D2C65)),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await showDatePicker(
              context: context,
              firstDate: DateTime(2022),
              lastDate: DateTime(2030),
              initialDate: lastdate,
            ).then((lastselectedDate) {
              if (lastselectedDate != null) {
                setState(() {
                  lastdate = lastselectedDate;
                  lastformattedDate =
                      DateFormat('d-MMM-yy').format(lastselectedDate);
                });
              }
            });

            // setState(() {
            //   firstDate
            // });
          },
          child: Container(
            width: 157,
            height: 49,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xffDDDDDD),
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
            child: Center(
              child: Text(
                lastformattedDate,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: "PushPenny",
                    color: Color(0xff0D2C65)),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class WalletFilter extends StatefulWidget {
  WalletFilter({super.key});

  @override
  State<WalletFilter> createState() => _WalletFilterState();
}

class _WalletFilterState extends State<WalletFilter> {
  String dropdownvalue = 'NGN Wallet';

  // List of items in our dropdown menu
  var lastDays = [
    'NGN Wallet',
    'GBP Wallet',
    'USD Wallet',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 50,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                borderRadius: BorderRadius.circular(10),
                dropdownColor: primaryColor,
                elevation: 1,
                // Initial Value
                value: dropdownvalue,
                selectedItemBuilder: (BuildContext context) {
                  return lastDays.map((String items) {
                    return Center(
                      child: Text(
                        dropdownvalue,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    );
                  }).toList();
                },
                // Down Arrow Icon
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),

                // Array list of items
                items: lastDays.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Container(
                      // width:double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 6.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 0.5))),
                      child: Text(
                        items,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white),
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
      ),
    );
  }
}

class CalenderPickDateStatement extends StatefulWidget {
  const CalenderPickDateStatement({super.key});

  @override
  State<CalenderPickDateStatement> createState() =>
      _CalenderPickDateStatementState();
}

class _CalenderPickDateStatementState extends State<CalenderPickDateStatement> {
  DateTime date = DateTime.now();
  late var formattedDate;

  @override
  void initState() {
    formattedDate = DateFormat('d-MMM-yy').format(date);
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  // final difference = daysBetween(date,lastdate);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDatePicker(
          context: context,
          firstDate: DateTime(2022),
          lastDate: DateTime(2030),
          initialDate: date,
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              date = selectedDate;
              formattedDate = DateFormat('d-MMM-yy').format(selectedDate);
            });
          }
        });

        // setState(() {
        //   firstDate
        // });
      },
      child: Container(
        width: 152,
        height: 49,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xffDDDDDD),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            formattedDate,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "PushPenny",
                color: Color(0xff0D2C65)),
          ),
        ),
      ),
    );
  }
}

class CalenderPickDateStatement2 extends StatefulWidget {
  const CalenderPickDateStatement2({super.key});

  @override
  State<CalenderPickDateStatement2> createState() =>
      _CalenderPickDateStatement2State();
}

class _CalenderPickDateStatement2State
    extends State<CalenderPickDateStatement2> {
  DateTime date = DateTime.now();
  late var formattedDate;

  @override
  void initState() {
    formattedDate = DateFormat('d-MMM-yy').format(date);
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  // final difference = daysBetween(date,lastdate);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDatePicker(
          context: context,
          firstDate: DateTime(2022),
          lastDate: DateTime(2030),
          initialDate: date,
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              date = selectedDate;
              formattedDate = DateFormat('d-MMM-yy').format(selectedDate);
            });
          }
        });

        // setState(() {
        //   firstDate
        // });
      },
      child: Container(
        width: 152,
        height: 49,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xffDDDDDD),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            formattedDate,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "PushPenny",
                color: Color(0xff0D2C65)),
          ),
        ),
      ),
    );
  }
}
