import 'package:daily_recipe/ApiServices/recipes.dart';
import 'package:daily_recipe/Controllers/recipecontrollers.dart';
import 'package:daily_recipe/Controllers/userscontrollers.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/notificationshandler.dart';
import 'package:daily_recipe/views/MealSchedule/schedule.dart';
import 'package:daily_recipe/views/Recipes/recipeshome.dart';
import 'package:daily_recipe/views/HomeScreen/home_screen.dart';
import 'package:daily_recipe/views/profile/profilehome.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedindex = 0;

  var screens = [HomeScreen(), FavourteRecipe(), Schedule(), Profile()];

  void onItemTaped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Notificationshandler.dailyReminder(context);
    });
  }

  var recipecontroller = Get.put(Recipecontrollers());
  var nameController = TextEditingController();
  var descController = TextEditingController();
  var userController = Get.put(Userscontrollers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedindex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Obx(
        () =>
            userController.userinfo["role"] != "admin"
                ? Text("")
                : FloatingActionButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text(
                          "Add Recipe",
                          style: TextStyle(color: Colors.pink),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: "Recipe Name",
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: descController,
                                  decoration: InputDecoration(
                                    hintText: "Description",
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text("upload Image"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              recipecontroller.addRecipe(
                                nameController.text,
                                descController.text,
                              );

                              // handle save
                              Get.back();
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.add, color: Colors.white),
                ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,

        onTap: onItemTaped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.pink),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank, color: Colors.pink),
            label: 'Recipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule, color: Colors.pink),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.pink),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
