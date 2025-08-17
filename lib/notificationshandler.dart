import 'package:daily_recipe/common_widget/alarmnotifications.dart';
import 'package:daily_recipe/consts/lists.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:intl/intl.dart';

class Notificationshandler {
  static void dailyReminder(context) {
    final now = DateTime.now();
    final day = DateFormat("EEE").format(now); // Mon, Tue...

    final todayMenu = menu[day];
    if (todayMenu == null) return;

    for (var val in todayMenu) {
      final parts = val["time"]!.split(":");
      final scheduledTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (scheduledTime.isAfter(now)) {
        Alarmnotifications.scheduleNotificaions(scheduledTime, context);
      }
    }
  }
}
