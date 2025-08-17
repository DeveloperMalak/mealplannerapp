import 'dart:convert';

import 'package:daily_recipe/ApiServices/auths.dart';
import 'package:daily_recipe/Models/recipesmodel.dart';
import 'package:daily_recipe/consts/lists.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Recipes {
  static String baseurl = "http://192.168.10.$hostid:5000/api/";
  static String? userid = Auths.userid;
  static var header = {
    "Content-Type": "application/json",
    "Accept": "*/*",
    "Connection": "keep-alive",
  };
  static Future<Recipes2> getAllRecipes() async {
    String url = "${baseurl}recipes/all";

    final response = await http.get(Uri.parse(url), headers: header);

    try {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "messgage",
          "recipes retrived successfuly",
          snackPosition: SnackPosition.BOTTOM,
        );

        Recipes2 recipesdata = Recipes2.fromJson(data);

        return recipesdata;
      } else {
        Get.snackbar(
          "message",
          "failed to fetched recipes",
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
      return Recipes2();
    }
  }

  static Future<Map<String, dynamic>> addrecipes(String name, desc) async {
    String url = baseurl + "recipes/add";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode({
          "name": name,
          "description": desc,
          "image": null,
          "created_by": userid,
        }),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "message",
          "added successfully",
          snackPosition: SnackPosition.BOTTOM,
        );
        return {"success": true, "messgae": "added successfully"};
      } else {
        Get.snackbar(
          "message",
          "failed to add",
          snackPosition: SnackPosition.BOTTOM,
        );
        return {"success": false, "message": "failed to add"};
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
