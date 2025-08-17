import 'dart:convert';

import 'package:daily_recipe/ApiServices/auths.dart';
import 'package:daily_recipe/consts/lists.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FavRecipes {
  static String baseurl = "http://192.168.10.$hostid:5000/api/";

  static String? userid = Auths.userid;
  static var header = {
    "Content-Type": "application/json",
    "Accept": "*/*",
    "Connection": "keep-alive",
  };
  static Future<Map<String, dynamic>> addfav(String recipeid) async {
    String url = baseurl + "favourites/add";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode({"recipe_id": recipeid, "fav_by": userid}),
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "message",
          "added to fav successfully",
          snackPosition: SnackPosition.BOTTOM,
        );

        if (kDebugMode) {
          print("added successfully to fav");
        }
        return {"success": data["success"], "message": data["message"]};
      } else {
        Get.snackbar(
          "message",
          "failed to add",

          snackPosition: SnackPosition.BOTTOM,
        );
        if (kDebugMode) {
          print("failed to add");
        }
        return {"success": data["succes"], "message": data["message"]};
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      Get.snackbar(
        "message",
        "some thing went wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
      return {
        "success": false,
        "message": "some thing went wrong ${e.toString()}",
      };
    }
  }

  
}
