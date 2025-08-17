import 'package:daily_recipe/Controllers/menuschedulecontroller.dart';
import 'package:daily_recipe/Controllers/recipecontrollers.dart';
import 'package:daily_recipe/common_widget/dropdownbutton.dart';
import 'package:daily_recipe/common_widget/timetextfield.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

void showmealplanform(
  Menuschedulecontroller menuschedulecontroller,
  BuildContext context,
) {
  String initialvalue = "684e5263da5dbcb14adb4fbd";
  var monbreakfastcontroller = TextEditingController();
  var monlunchcontroller = TextEditingController();
  var mondinnercontroller = TextEditingController();

  var tuebreakfastcontroller = TextEditingController();
  var tuelunchcontroller = TextEditingController();
  var tuedinnercontroller = TextEditingController();

  var wedbreakfastcontroller = TextEditingController();
  var wedlunchcontroller = TextEditingController();
  var weddinnercontroller = TextEditingController();

  var thubreakfastcontroller = TextEditingController();
  var thulunchcontroller = TextEditingController();
  var thudinnercontroller = TextEditingController();

  var fribreakfastcontroller = TextEditingController();
  var frilunchcontroller = TextEditingController();
  var fridinnercontroller = TextEditingController();

  var satbreakfastcontroller = TextEditingController();
  var satlunchcontroller = TextEditingController();
  var satdinnercontroller = TextEditingController();

  var sunbreakfastcontroller = TextEditingController();
  var sunlunchcontroller = TextEditingController();
  var sundinnercontroller = TextEditingController();
  Get.dialog(
    AlertDialog(
      title: Text(
        " Edit Meal Schedule",
        style: GoogleFonts.poppins(
          color: Colors.pink,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: StatefulBuilder(
        builder: (context, setState) {
          var recipescontroller = Get.put(Recipecontrollers());
          Future<void> selectTime(
            TimeOfDay? pickedTime,
            String day,
            String time,
            BuildContext context,
          ) async {
            final TimeOfDay? selcetTime = await showTimePicker(
              context: context,
              initialTime: pickedTime ?? TimeOfDay.now(),
            );

            if (pickedTime != selcetTime) {
              setState(() {
                pickedTime = selcetTime;
                if (day == "mon" && time == "breakfast") {
                  monbreakfastcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "mon" && time == "lunch") {
                  monlunchcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "mon" && time == "dinner") {
                  mondinnercontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "tue" && time == "breakfast") {
                  tuebreakfastcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "tue" && time == "lunch") {
                  tuelunchcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "tue" && time == "dinner") {
                  tuedinnercontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "wed" && time == "breakfast") {
                  wedbreakfastcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "wed" && time == "lunch") {
                  wedlunchcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "wed" && time == "dinner") {
                  weddinnercontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "thu" && time == "breakfast") {
                  thubreakfastcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "thu" && time == "lunch") {
                  thulunchcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "thu" && time == "dinner") {
                  thudinnercontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "fri" && time == "breakfast") {
                  fribreakfastcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "fri" && time == "lunch") {
                  frilunchcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "fri" && time == "dinner") {
                  fridinnercontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "sat" && time == "breakfast") {
                  satbreakfastcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "sat" && time == "lunch") {
                  satlunchcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "sat" && time == "dinner") {
                  satdinnercontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "sun" && time == "breakfast") {
                  sunbreakfastcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "sun" && time == "lunch") {
                  sunlunchcontroller.text =
                      pickedTime!.format(context).toString();
                } else if (day == "sun" && time == "dinner") {
                  sundinnercontroller.text =
                      pickedTime!.format(context).toString();
                } else {
                  print("dfdfs");
                }
              });
            }
          }

          return SingleChildScrollView(
            child: Obx(() {
              if (menuschedulecontroller.menuList.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Monday"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Breakfast"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .monday
                              .breakfast
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: monbreakfastcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .monday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "mon",
                              "breakfast",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Lunch"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .monday
                              .lunch
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: monlunchcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .monday
                                    .lunch
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "mon",
                              "lunch",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Dinner"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .monday
                              .dinner
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: mondinnercontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .monday
                                    .dinner
                                    .mealid
                                    .sId;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "mon",
                              "dinner",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Text("Tuesday"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Breakfast"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .tuesday
                              .breakfast
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: tuebreakfastcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .tuesday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "mon",
                              "breakfast",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Lunch"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .tuesday
                              .lunch
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: tuelunchcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .tuesday
                                    .lunch
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "tue",
                              "lunch",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Dinner"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .tuesday
                              .dinner
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: tuedinnercontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .tuesday
                                    .dinner
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "tue",
                              "dinner",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Text("Wednesday"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Breakfast"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .wednesday
                              .breakfast
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: wedbreakfastcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .wednesday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "wed",
                              "breakfast",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Lunch"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .wednesday
                              .lunch
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: wedlunchcontroller,
                          label: "dfd",
                          height: 8,
                          width: 10,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .wednesday
                                    .lunch
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "wed",
                              "lunch",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Dinner"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .wednesday
                              .dinner
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: weddinnercontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .wednesday
                                    .dinner
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "wed",
                              "dinner",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Text("Thursday"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Breakfast"),
                        5.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .thursday
                              .breakfast
                              .mealid
                              .sId,
                        ),
                        5.widthBox,
                        Timetextfield(
                          controller: thubreakfastcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .thursday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "thu",
                              "breakfast",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Lunch"),
                        5.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .thursday
                              .lunch
                              .mealid
                              .sId,
                        ),
                        5.widthBox,
                        Timetextfield(
                          controller: thulunchcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .thursday
                                    .lunch
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "thu",
                              "lunch",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Dinner"),
                        5.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .thursday
                              .dinner
                              .mealid
                              .sId,
                        ),
                        5.widthBox,
                        Timetextfield(
                          controller: thudinnercontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .monday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "thu",
                              "dinner",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Text("Friday"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Breakfast"),
                        5.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .friday
                              .breakfast
                              .mealid
                              .sId,
                        ),
                        5.widthBox,
                        Timetextfield(
                          controller: fribreakfastcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .friday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "fri",
                              "breakfast",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Lunch"),
                        5.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .friday
                              .lunch
                              .mealid
                              .sId,
                        ),
                        5.widthBox,
                        Timetextfield(
                          controller: frilunchcontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .friday
                                    .lunch
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "fri",
                              "lunch",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Dinner"),
                        5.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .friday
                              .dinner
                              .mealid
                              .sId,
                        ),
                        5.widthBox,
                        Timetextfield(
                          controller: fridinnercontroller,
                          label: "dfd",
                          height: 10,
                          width: 20,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .friday
                                    .dinner
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "fri",
                              "dinner",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Text("Saturday"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Breakfast"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .saturday
                              .breakfast
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: satbreakfastcontroller,
                          label: "dfd",
                          height: 5,
                          width: 5,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .saturday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "sat",
                              "breakfast",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Lunch"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .saturday
                              .lunch
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: satlunchcontroller,
                          label: "dfd",
                          height: 5,
                          width: 5,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .saturday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "sat",
                              "lunch",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Dinner"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .saturday
                              .dinner
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: satdinnercontroller,
                          label: "dfd",
                          height: 5,
                          width: 5,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .saturday
                                    .dinner
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "sat",
                              "dinner",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Text("Sunday"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Breakfast"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .sunday
                              .breakfast
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: sunbreakfastcontroller,
                          label: "dfd",
                          height: 5,
                          width: 5,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .sunday
                                    .breakfast
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "sun",
                              "breakfast",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Lunch"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .sunday
                              .lunch
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: sunlunchcontroller,
                          label: "dfd",
                          height: 5,
                          width: 5,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .sunday
                                    .lunch
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "sun",
                              "lunch",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Dinner"),
                        2.widthBox,
                        dropdownButton(
                          menuschedulecontroller
                              .menuList[0]
                              .days
                              .sunday
                              .dinner
                              .mealid
                              .sId,
                        ),
                        2.widthBox,
                        Timetextfield(
                          controller: sundinnercontroller,
                          label: "dfd",
                          height: 5,
                          width: 5,
                          showtime: () {
                            String timeString =
                                menuschedulecontroller
                                    .menuList[0]
                                    .days
                                    .sunday
                                    .dinner
                                    .time;
                            final parts = timeString.split(
                              RegExp(r'[: ]'),
                            ); // ["2", "05", "PM"]
                            int hour = int.parse(parts[0]);
                            int minute = int.parse(parts[1]);
                            selectTime(
                              TimeOfDay(hour: hour, minute: minute),
                              "sun",
                              "dinner",
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("Cancel", style: TextStyle(color: Colors.red)),
        ),
        Obx(
          () => TextButton(
            onPressed: () {
              // handle save
              menuschedulecontroller.updateSchedule();
              Get.back();
            },
            child: Text("Save", style: TextStyle(color: Colors.blue)),
          ),
        ),
      ],
    ),
  );
}
