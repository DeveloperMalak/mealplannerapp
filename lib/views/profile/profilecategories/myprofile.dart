import 'package:daily_recipe/Controllers/userscontrollers.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  var usercontrollers = Get.put(Userscontrollers());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          usercontrollers.userinforloading.value
              ? Center(child: CircularProgressIndicator(strokeWidth: 34))
              : Column(
                children: [
                  10.heightBox,
                  CircleAvatar(radius: 80, backgroundColor: Colors.red),
                  10.heightBox,
                  Obx(
                    () => Column(
                      children: [
                        "${usercontrollers.userinfo["user"]["name"]}".text
                            .textStyle(
                              GoogleFonts.poppins(
                                color: Colors.pink,
                                fontSize: 30,
                              ),
                            )
                            .make(),
                        "${usercontrollers.userinfo["user"]["email"]}".text
                            .textStyle(
                              GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )
                            .make(),
                        10.heightBox,

                        Obx(
                          () => Column(
                            children: [
                              Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "Role".text.make().px(8),
                                      "${usercontrollers.userinfo["role"]}".text
                                          .make()
                                          .px(8),
                                    ],
                                  ).box
                                  .size(360, 35)
                                  .roundedSM
                                  .color(
                                    const Color.fromARGB(255, 226, 236, 226),
                                  )
                                  .make(),
                              10.heightBox,
                              Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "Rank".text.make().px(8),
                                      "${usercontrollers.userinfo["role"]}".text
                                          .make()
                                          .px(8),
                                    ],
                                  ).box
                                  .size(360, 35)
                                  .roundedSM
                                  .color(
                                    const Color.fromARGB(255, 226, 236, 226),
                                  )
                                  .make(),
                              10.heightBox,
                              Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "votescount".text.make().px(8),
                                      "${usercontrollers.userinfo["votecount"]}"
                                          .text
                                          .make()
                                          .px(8),
                                    ],
                                  ).box
                                  .size(360, 35)
                                  .roundedSM
                                  .color(
                                    const Color.fromARGB(255, 226, 236, 226),
                                  )
                                  .make()
                                  .px(8),
                              10.heightBox,
                              Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "Achievement".text.make().px(8),
                                      "30000000000000".text.make().px(8),
                                    ],
                                  ).box
                                  .size(360, 35)
                                  .roundedSM
                                  .color(
                                    const Color.fromARGB(255, 226, 236, 226),
                                  )
                                  .make(),
                              10.heightBox,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
