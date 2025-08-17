import 'package:daily_recipe/ApiServices/menuschedule.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Menuschedulecontroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getMenuschedule();
  }

  RxList menuList = [].obs;
  RxBool loading = false.obs;
  Future<void> getMenuschedule() async {
    try {
      loading.value = true;
      var result = await Menuschedule.getMenu();
      if (result.menu != null && result.menu!.isNotEmpty) {
        menuList.value = result.menu!;
      } else {
        menuList.value = [].obs; // fallback empty map
      }
    } catch (e) {
      loading.value = false;
      if (kDebugMode) {
        print("error fetching users $e");
      }
    } finally {
      loading.value = false;
    }
  }

  Future<void> updateSchedule(var menu) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false, // prevent closing manually
      );

      var result = Menuschedule.updateschedule(menu).then((value) {
        getMenuschedule();
        Get.back();
      });
      Get.back();
    } catch (e) {
      if (kDebugMode) {
        print("error adding users $e");
      }
    }
  }
}
