import 'package:daily_recipe/Controllers/menuschedulecontroller.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/views/MealSchedule/Mealforms/meal_form.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

var mealschedulecontroller = Get.put(Menuschedulecontroller());

class _ScheduleState extends State<Schedule> {
  final List<String> days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];
  final List<String> mealTypes = ['Breakfast', 'Lunch', 'Dinner'];
  final List<String> mealTimes = ['8:00 AM', '1:00 PM', '7:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray100,
      body: SafeArea(
        child:
            VStack([
              // Header
              Align(
                alignment: Alignment.center,
                child: "Meal Schedule".text.xl4.bold
                    .color(Colors.pink)
                    .fontFamily('Poppins')
                    .make()
                    .pOnly(bottom: 24),
              ),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Obx((){

                    if(mealschedulecontroller.menuList.isEmpty){

                      return Center(child: CircularProgressIndicator(),);
                    }else{
                  return VStack([
                      _buildScheduleCard(),
                      24.heightBox,
                      _buildEditButton(),
                    ]);}
                  })
                ),
              ),
            ]).p16(),
      ),
    );
  }

  Widget _buildScheduleCard() {
    return VxBox(
      child:
          Column(
            children: [
              // Meal type headers
              Row(
                children: [
                  const SizedBox(width: 60), // Space for day column
                  ...mealTypes.map(
                    (meal) => Expanded(
                      child:
                          meal.text.semiBold
                              .color(Colors.pink)
                              .center
                              .make()
                              .p8(),
                    ),
                  ),
                ],
              ),

              // Divider
              const Divider(thickness: 1).pOnly(bottom: 8),

              // Days and meals
              ...days.map((day) {
                  final allDays = mealschedulecontroller.menuList[0].days;

  var daymeal;
  if (day.toLowerCase() == 'monday') {
    daymeal = allDays.monday;
  } else if (day.toLowerCase() == 'tuesday') {
    daymeal = allDays.tuesday;
  } else if (day.toLowerCase() == 'wednesday') {
    daymeal = allDays.wednesday;
  } else if (day.toLowerCase() == 'thursday') {
    daymeal = allDays.thursday;
  } else if (day.toLowerCase() == 'friday') {
    daymeal = allDays.friday;
  } else if (day.toLowerCase() == 'saturday') {
    daymeal = allDays.saturday;
  } else if (day.toLowerCase() == 'sunday') {
    daymeal = allDays.sunday;
  }

             return   Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Day column
                        SizedBox(
                          width: 60,
                          child: day.text.semiBold.make().p8(),
                        ),

                        // Meals for the day
                        ...mealTypes.map((mealType) {
                              var mealtimename;
                      if (daymeal != null) {
                        if (mealType == "Breakfast") mealtimename = daymeal.breakfast;
                        if (mealType == "Lunch") mealtimename = daymeal.lunch;
                        if (mealType == "Dinner") mealtimename = daymeal.dinner;
                      }

                       return   Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              Text(mealtimename!.mealid.name),
                               Text(mealtimename!.time)
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                    if (day != days.last)
                      const Divider(height: 1, thickness: 0.5),
                  ],
                );
              }),
            ],
          ).p16(),
    ).white.roundedLg.shadowSm.make();
  }

  Widget _buildEditButton() {
    return ElevatedButton(
      onPressed: () {
        mealschedulecontroller.menuList.isEmpty?
        Center(child: CircularProgressIndicator()):
        showmealplanform(mealschedulecontroller, context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: "Edit Schedule".text.white.semiBold.make(),
    );
  }
}
