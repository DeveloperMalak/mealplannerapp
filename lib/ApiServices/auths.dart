import 'dart:convert';


import 'package:daily_recipe/Models/allusersmodel.dart';
import 'package:daily_recipe/consts/lists.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:daily_recipe/views/HomeScreen/home.dart';
import 'package:daily_recipe/views/auth_screens/logins_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class Auths {
  static String baseurl = "http://192.168.10.$hostid:5000/api/users/";
  static String? userid;
  static var header = {
    "Content-Type": "application/json",
    "Accept": "*/*",
    "Connection": "keep-alive",
  };
  static Future<Map<String, dynamic>> register(
    context,
    String name,
    String email,

    String password,
  ) async {
    // ignore: prefer_interpolation_to_compose_strings
    String url = baseurl + "register";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,

        body: jsonEncode({"name": name, "email": email, "password": password}),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        VxToast.show(context, msg: "regestration successfull");
        if (kDebugMode) {
          print(data.toString());
        }
        Get.to(() => LoginsScreen());
        userid = data["user"]["_id"];
        return data;
      } else if (response.statusCode == 404) {
        VxToast.show(context, msg: "users already exists");
        return {"success": false, "message": "user already exists"};
      } else {
        VxToast.show(context, msg: "some thing went wrong");
        return {"success": false, "message": "registration failed"};
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      VxToast.show(
        position: VxToastPosition.center,

        context,
        msg: "some thing went wrong ${e.toString()}",
      );
      return {"success": false, "message": e.toString()};
    }
  }

  static Future<Map<String, dynamic>> login(
    context,
    String email,
    String password,
  ) async {
    String url = "${baseurl}login";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode({"email": email, "password": password}),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        VxToast.show(context, msg: "loggedin successfully");
        if (kDebugMode) {
          print(data.toString());
        }
        userid = data["user"]["_id"];
        Get.to(() => Home());
        return data;
      } else if (response.statusCode == 404) {
        VxToast.show(context, msg: "user not found");
        return {"success": false, "message": "user not found"};
      } else {
        VxToast.show(context, msg: "some thing went wrong");
        return {"success": false, "message": "login failed"};
      }
    } catch (e) {
      VxToast.show(context, msg: "some thing went wrong");
      return {"success": false, "message": e.toString()};
    }
  }

  static Future<AllUsersModel> getAllUsers() async {
    String url = baseurl + "allusers";
    try {
      final response = await http.get(Uri.parse(url), headers: header);

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("message", "data retrived successfully");
        if (kDebugMode) {
          print("retrived successfully");
        }

        AllUsersModel allUsersModel = AllUsersModel.fromJson(data);
        return allUsersModel;
      } else {
        if (kDebugMode) {
          print("failed to fetch data");
        }
        Get.snackbar("message", "failed to fetch data");

        throw Exception("failed to fetch user data ,${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("message", "some thing went wrong ${e.toString()}");
      if (kDebugMode) {
        print("some thing went wrong ${e.toString()}");
      }
      return AllUsersModel();
    }
  }

  static Future<Map<String, dynamic>> userinfo() async {
    String url = baseurl + "id/$userid";
    try {
      final response = await http.get(Uri.parse(url), headers: header);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("message", "userinfo retrived successfully");
        if (kDebugMode) {
          print("userinfo retrived succfully");
        }

        return data;
      } else {
        Get.snackbar("message", "failed to fetch data");

        if (kDebugMode) {
          print("failed to fetch data");
        }
        return {"success": false, "message": "failed to fetch data"};
      }
    } catch (e) {
      Get.snackbar("message", "something went wrong why  $e");
      if (kDebugMode) {
        print("something went wrong ${e.toString()}");
      }
      return {"success": false, "message": "something went wrong $e"};
    }
  }
}
