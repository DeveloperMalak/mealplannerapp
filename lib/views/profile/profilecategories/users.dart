import 'package:daily_recipe/ApiServices/auths.dart';
import 'package:daily_recipe/Controllers/userscontrollers.dart';
import 'package:daily_recipe/Controllers/votescontroller.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UsersProfile extends StatefulWidget {
  const UsersProfile({super.key});

  @override
  State<UsersProfile> createState() => _UsersProfileState();
}

class _UsersProfileState extends State<UsersProfile> {
  var alluserscontroller = Get.put(Userscontrollers());
  var alluservotecontroller = Get.put(Votescontroller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.heightBox,
        Expanded(
          child: Obx(
            () =>
                alluserscontroller.isloading.value == true &&
                        alluservotecontroller.usersallvotes.isEmpty
                    ? "data laoding ....".text.size(30).make()
                    : ListView.builder(
                      itemCount: alluservotecontroller.usersallvotes.length,
                      itemBuilder: (BuildContext context, index) {
                        var userdata = alluserscontroller.users;
                        var uservotes = alluservotecontroller.usersallvotes;
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const CircleAvatar(radius: 30),
                                    uservotes[index].role == "admin"
                                        ? Positioned(
                                          top: -16,
                                          left: 17,
                                          child: Image.asset(
                                            "assets/admin.png",
                                            height: 30,
                                            width: 30,
                                          ),
                                        )
                                        : Container(),
                                  ],
                                ),
                                10.widthBox,
                                // Expanded section to avoid overflow
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "${userdata[index].name}".text
                                          .textStyle(
                                            GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                          .make(),
                                      4.heightBox,

                                      "Votes:${uservotes[index].voteCount}".text
                                          .textStyle(
                                            GoogleFonts.poppins(fontSize: 12),
                                          )
                                          .make(),

                                      "${uservotes[index].role}".text
                                          .textStyle(
                                            GoogleFonts.poppins(fontSize: 12),
                                          )
                                          .make(),
                                    ],
                                  ),
                                ),

                                Obx(
                                  () => TextButton(
                                    onPressed: () {
                                      alluservotecontroller.castvote(
                                        userdata[index].sId,
                                        Auths.userid,
                                      );
                                      // handle upvote
                                    },
                                    child:
                                        //alluservotecontroller.isVoted(
                                          //    userdata[index].sId,
                                            //);
                                            uservotes[index].id.sId==alluservotecontroller.mycastedvotecandidatesid.value
                                            ? "Downvote".text
                                                .color(Colors.red)
                                                .make()
                                            : "Upvote".text.make(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ),
      ],
    );
  }
}
