import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/views/profile/profilecategories/myprofile.dart';
import 'package:daily_recipe/views/profile/profilecategories/users.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.pink,
        //   title:
        //       "Profiles".text
        //           .textStyle(
        //             GoogleFonts.poppins(
        //               color: Colors.white,
        //               fontSize: 30,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           )
        //           .make(),
        // ),
        body: Center(
          child: Column(
            children: [
              30.heightBox,
              "Profiles".text
                  .textStyle(
                    GoogleFonts.poppins(
                      color: Colors.pink,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  .make(),
              10.heightBox,

              TabBar(
                labelColor: Colors.pink,
                indicatorColor: Colors.pink,
                tabs: [
                  "My Profile".text
                      .textStyle(
                        GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      .make(),
                  "Users".text
                      .textStyle(
                        GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )
                      .make(),
                ],
              ),
              Expanded(
                child: TabBarView(children: [Myprofile(), UsersProfile()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
