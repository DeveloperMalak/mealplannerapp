import 'package:daily_recipe/ApiServices/auths.dart';
import 'package:daily_recipe/common_widget/button.dart';
import 'package:daily_recipe/common_widget/textform.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/views/auth_screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginsScreen extends StatefulWidget {
  const LoginsScreen({super.key});

  @override
  State<LoginsScreen> createState() => _LoginsScreenState();
}

class _LoginsScreenState extends State<LoginsScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            100.heightBox,
            Column(
              children: [
                40.heightBox,

                "Login to Dish Dash".text
                    .size(27)
                    .textStyle(
                      GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    )
                    .make(),
                50.heightBox,
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
                    Auths.login(context, emailController.text, passwordController.text);
                  },
                  content: "Login",
                  height: 60,
                  width: 320,
                  color: Colors.pink,
                ),
                5.heightBox,
                Row(
                  children: [
                    50.widthBox,
                    "not registered".text.make(),
                    4.widthBox,
                    TextButton(
                      onPressed: () {
                        Get.to(() => SignupScreen());
                      },
                      child: "signup".text.blue900.underline.make(),
                    ),
                  ],
                ),
              ],
            ).box.size(300, 500).make(),
          ],
        ),
      ),
    );
  }
}
