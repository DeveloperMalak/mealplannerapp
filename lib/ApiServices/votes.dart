import 'dart:convert';

import 'package:daily_recipe/ApiServices/auths.dart';
import 'package:daily_recipe/Models/votesmodel.dart';
import 'package:daily_recipe/consts/lists.dart';
import 'package:daily_recipe/consts/packages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class Votes {
  static String baseurl = "http://192.168.10.$hostid:5000/api/";
  static String? userid = Auths.userid;
  static var header = {
    "Content-Type": "application/json",
    "Accept": "*/*",
    "Connection": "keep-alive",
  };
  static Future<VotesModel> getAllVotes() async {
    String url = "${baseurl}votes/allvotes";

    final response = await http.get(Uri.parse(url), headers: header);

    try {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "messgage",
          "votes retrived successfuly",
          snackPosition: SnackPosition.BOTTOM,
        );

        VotesModel votesdata = VotesModel.fromJson(data);

        return votesdata;
      } else {
        Get.snackbar(
          "message",
          "failed to fetched votes",
          snackPosition: SnackPosition.BOTTOM,
        );
        if (kDebugMode) {
          if (kDebugMode) {
            print("failed to fetched");
          }
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
      return VotesModel();
    }
  }

  static Future<Map<String, dynamic>> castVote(String candidatesid) async {
    String url = baseurl + "votes/addvote";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode({"candidates_id": candidatesid, "voter_id": userid}),
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "message",
          "cast vote successfully",
          snackPosition: SnackPosition.BOTTOM,
        );

        if (kDebugMode) {
          print("casted vote succesfully");
        }
        return {"success": data["success"], "message": data["message"]};
      } else if (response.statusCode == 400) {
        Get.snackbar("message", data["message"]);
        if (kDebugMode) {
          print("already casted vote");
        }
        return {"success": data["success"], "message": data["message"]};
      } else {
        Get.snackbar(
          "message",
          "failed to cast vote",

          snackPosition: SnackPosition.BOTTOM,
        );
        if (kDebugMode) {
          print("failed to cast vote");
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

  static Future<Map<String, dynamic>> deleteVote(String voterid) async {
    String url = baseurl + "votes/deletevote/id/$voterid";

    try {
      final response = await http.delete(Uri.parse(url), headers: header);

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar(
          "message",
          "deleted vote successfully",
          snackPosition: SnackPosition.BOTTOM,
        );

        if (kDebugMode) {
          print("deleted vote succesfully");
        }
        return {"success": data["success"], "message": data["message"]};
      } else {
        Get.snackbar(
          "message",
          "failed to cast vote",

          snackPosition: SnackPosition.BOTTOM,
        );
        if (kDebugMode) {
          print("failed to delete vote");
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

 static  Future<Map<String, dynamic>> whomivoted() async {
    String url = baseurl + "votes/whomivoted/id/$userid";
    try {
      final response = await http.get(Uri.parse(url), headers: header);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("message", "casted vote retrived");
        if (kDebugMode) {
          print("casted vote retrived");
        }

        return data;
      } 
      else {
        Get.snackbar("message", "no casted vote");

        if (kDebugMode) {
          print("no casted vote");
        }
        return {"success": false, "message": "no casted vote"};
      }
    } catch (e) {
      Get.snackbar("message", "something went wrong  $e");
      if (kDebugMode) {
        print("something went wrong ${e.toString()}");
      }
      return {"success": false, "message": "something went wrong $e"};
    }
  }
}
