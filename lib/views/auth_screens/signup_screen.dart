import 'package:daily_recipe/ApiServices/auths.dart';
import 'package:daily_recipe/common_widget/button.dart';
import 'package:daily_recipe/common_widget/textform.dart';
import 'package:daily_recipe/consts/packages.dart';

import 'package:daily_recipe/views/HomeScreen/home.dart';
import 'package:daily_recipe/views/auth_screens/logins_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen();

  @override
  State<SignupScreen> createState() => _LoginsScreenState();
}

class _LoginsScreenState extends State<SignupScreen> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            100.heightBox,
            Column(
              children: [
                40.heightBox,
                " Sign up to Dish Dash".text
                    .size(25)
                    .textStyle(
                      GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    )
                    .make(),
                5.heightBox,
                CustomTextFormField(
                  controller: nameController,
                  label: "name",
                  hintText: "noor",
                ),
                10.heightBox,
                CustomTextFormField(
                  controller: emailController,
                  label: "email",
                  hintText: "noor@gmail.com",
                ),
                10.heightBox,
                CustomTextFormField(
                  controller: passwordController,
                  label: "password",
                  hintText: "noor123",
                ),

                20.heightBox,
                CustomButton(
                  onTap: () {
                    Auths.register(
                      context,
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  content: "Signup",
                  height: 50,
                  width: 320,
                  color: Colors.pink,
                ),
                5.heightBox,
                Row(
                  children: [
                    50.widthBox,
                    "Already registered".text.make(),
                    4.widthBox,
                    TextButton(
                      onPressed: () {
                        Get.to(() => LoginsScreen());
                      },
                      child: "login".text.blue900.underline.make(),
                    ),
                  ],
                ),
              ],
            ).box.size(300, 600).make(),
          ],
        ),
      ),
    );
  }
}
