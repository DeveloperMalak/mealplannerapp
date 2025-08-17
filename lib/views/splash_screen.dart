import 'dart:async';

import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/views/auth_screens/logins_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.to(() => LoginsScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 77, 77),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            10.heightBox,
            "Dish Dash".text.white
                .size(30)
                .textStyle(GoogleFonts.poppins(fontWeight: FontWeight.bold))
                .make(),
            Image.asset(
              "assets/lunch.png",
              height: 100,
              width: 100,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
