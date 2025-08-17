import 'dart:convert';

import 'package:daily_recipe/ApiServices/auths.dart';
import 'package:daily_recipe/Models/menumodel.dart';
import 'package:daily_recipe/consts/lists.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;

class Menuschedule {
  static String baseurl = "http://192.168.10.$hostid:5000/api/";
  static String? userid = Auths.userid;
  static var header = {
    "Content-Type": "application/json",
    "Accept": "*/*",
    "Connection": "keep-alive",
  };

  static Future<Foodschedule> getMenu() async {
    String url = "${baseurl}foodmenu/view";

    final response = await http.get(Uri.parse(url), headers: header);

    try {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "messgage",
          "menu schedule retrived secussfully retrived successfuly",
          snackPosition: SnackPosition.BOTTOM,
        );

        Foodschedule recipesdata = Foodschedule.fromJson(data);

        return recipesdata;
      } else {
        Get.snackbar(
          "message",
          "failed to fetched  menu schedule",
          snackPosition: SnackPosition.BOTTOM,
        );
        if (kDebugMode) {
          print("failed to fetched");
        }
        throw Exception("failed to fetch");
      }
    } catch (e) {
      Get.snackbar(
        "message",
        "${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
      if (kDebugMode) {
        print(e.toString());
      }
      return Foodschedule();
    }
  }

  static Future<Map<String, dynamic>> updateschedule(var menu) async {
    String url = "${baseurl}foodmenu/updatemenu";

    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(menu),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "message",
          "added successfully",
          snackPosition: SnackPosition.BOTTOM,
        );
        return {"success": true, "messgae": "schedule updated successfully"};
      } else {
        Get.snackbar(
          "message",
          "failed to update menu schedule",
          snackPosition: SnackPosition.BOTTOM,
        );
        return {"success": false, "message": "failed to update menu schedule"};
      }
    } catch (e) {
      Get.snackbar(
        "message",
        "some thing went wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
      if (kDebugMode) {
        print(e.toString());
      }
      return {
        "success": false,
        "message": "some thing went wrong ",
        "error": e.toString(),
      };
    }
  }
}
