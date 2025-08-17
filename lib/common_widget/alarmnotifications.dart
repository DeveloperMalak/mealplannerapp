import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

class Alarmnotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> scheduleNotificaions(
    DateTime scheduletime,
    context,
  ) async {
    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Recipe",
        "its time to meal",
        tz.TZDateTime.from(scheduletime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "alarm notificaions",
            "alarm notifications",
            channelDescription: 'Channel for Alarm notification',

            importance: Importance.max,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound('alarmsound'),
            playSound: true,
          ),
        ),

        matchDateTimeComponents: DateTimeComponents.time, // for daily repeating

        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    } catch (e) {
      VxToast.show(context, msg: '${e.toString()}');
    }
  }
}
