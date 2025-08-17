import 'package:daily_recipe/ApiServices/auths.dart';
import 'package:daily_recipe/ApiServices/votes.dart';
import 'package:daily_recipe/Models/allusersmodel.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

class Userscontrollers extends GetxController {
  @override
  void onInit() {
    getAllUsers();
    getuserinfo();
    
    super.onInit();
  }

  var users = [].obs;
  
  RxMap userinfo = <String, dynamic>{}.obs;

  RxBool isloading = false.obs;
  RxBool userinforloading = false.obs;
  Future<void> getAllUsers() async {
    try {
      isloading.value = true;
      var result = await Auths.getAllUsers();
      users.value = result.allusers!; // set the list of users here
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching users: $e");
      }
    } finally {
      isloading.value = false;
    }
  }

  Future<void> getuserinfo() async {
    try {
      userinforloading.value = true;
      userinfo.value = await Auths.userinfo();
    } catch (e) {
      if (kDebugMode) {
        print("error occuers ${e}");
      }
    } finally {
      userinforloading.value = false;
    }
  }

  
}
