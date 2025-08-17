import 'package:daily_recipe/common_widget/alarmnotifications.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/views/auth_screens/logins_screen.dart';
import 'package:daily_recipe/views/auth_screens/signup_screen.dart';
import 'package:daily_recipe/views/HomeScreen/home.dart';
import 'package:daily_recipe/views/HomeScreen/home_screen.dart';
import 'package:daily_recipe/views/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: DarwinInitializationSettings(),
  );

  await Alarmnotifications.flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  final androidPlugin =
      Alarmnotifications.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

  await androidPlugin!.requestNotificationsPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
