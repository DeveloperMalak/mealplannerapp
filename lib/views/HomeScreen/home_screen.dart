import 'package:daily_recipe/consts/lists.dart';
import 'package:daily_recipe/main.dart';
import 'package:daily_recipe/notificationshandler.dart';

import 'package:flutter/material.dart';
import 'package:daily_recipe/consts/packages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          50.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // vertically center
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Hi! mom".text
                      .color(Colors.pink)
                      .size(30)
                      .textStyle(
                        GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      )
                      .make(),
                  "what are you cooking today".text.size(17).make(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications, size: 35),
                    color: Colors.pink,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, size: 35),
                    color: Colors.pink,
                  ),
                ],
              ),
            ],
          ),

          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    mealtimes[index].text.white
                        .make()
                        .centered()
                        .box
                        .rounded
                        .shadow
                        .size(110, 30)
                        .color(Colors.pink)
                        .make(),
              );
            }),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child:
                            "Todays Recipe".text
                                .textStyle(
                                  GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                .color(Colors.pink)
                                .size(20)
                                .make(),
                      ),
                      10.heightBox,
                      VxSwiper(
                        items: [
                          Card(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        "https://www.onceuponachef.com/images/2024/04/Fried-Egg-Hero-3-1200x900.jpg",
                                        height: 140,
                                        fit: BoxFit.cover,
                                        width: 300,
                                      ),
                                    ),

                                    Positioned(
                                      left: 260,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_outline_outlined,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        "beryani".text
                                            .size(23)
                                            .textStyle(
                                              GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                            .make(),
                                        "beryani".text
                                            .size(12)
                                            .textStyle(GoogleFonts.poppins())
                                            .make(),
                                      ],
                                    ),
                                    SizedBox(width: 30),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.punch_clock),
                                            "time".text
                                                .color(Colors.pink)
                                                .make(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      15.heightBox,

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "favourtie recipe".text.white
                                    .size(20)
                                    .textStyle(
                                      GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                    .make(),
                                7.heightBox,
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(50, (index) {
                                      return Card(
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.network(
                                                    "https://www.onceuponachef.com/images/2024/04/Fried-Egg-Hero-3-1200x900.jpg",
                                                    height: 80,
                                                    fit: BoxFit.cover,
                                                    width: 160,
                                                  ),
                                                ),

                                                Positioned(
                                                  left: 95,
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons
                                                          .favorite_outline_outlined,
                                                      color: Colors.pink,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    "beryani".text
                                                        .size(16)
                                                        .textStyle(
                                                          GoogleFonts.poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                        .make(),
                                                    "beryani".text
                                                        .size(12)
                                                        .textStyle(
                                                          GoogleFonts.poppins(),
                                                        )
                                                        .make(),
                                                  ],
                                                ),
                                                SizedBox(width: 25),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.punch_clock),
                                                        "time".text
                                                            .color(Colors.pink)
                                                            .make(),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ).box.white.shadowSm.color(Colors.pink).size(390, 190).rounded.make(),

                      10.heightBox,
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child:
                            "Top Recipe".text
                                .textStyle(
                                  GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                    fontSize: 20,
                                  ),
                                )
                                .make(),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(4, (index) {
                            return Card(
                              child: Column(
                                children: [
                                  //  ClipRRect(child: Image.network("src")),
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          "https://www.onceuponachef.com/images/2024/04/Fried-Egg-Hero-3-1200x900.jpg",
                                          height: 80,
                                          fit: BoxFit.cover,
                                          width: 160,
                                        ),
                                      ),

                                      Positioned(
                                        left: 95,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_outline_outlined,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          "beryani".text
                                              .size(16)
                                              .textStyle(
                                                GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                              .make(),
                                          "beryani".text
                                              .size(12)
                                              .textStyle(GoogleFonts.poppins())
                                              .make(),
                                        ],
                                      ),
                                      SizedBox(width: 25),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.punch_clock),
                                              "time".text
                                                  .color(Colors.pink)
                                                  .make(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    
    );
  }
}
