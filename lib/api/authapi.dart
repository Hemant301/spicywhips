import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:spicywhips/util/const.dart';
import 'package:spicywhips/util/usercred.dart';

class AuthApi {
  Future<dynamic> doLogin(String email, String pwd) async {
    var client = http.Client();
    try {
      final body = {"email": "$email", "password": "$pwd"};
      debugPrint("body : $body");

      final response = await client.post(Uri.parse("$baseUrl/api/signin"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200 || response.statusCode == 400) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }

  Future<dynamic> verifyotp(String userid, String otp) async {
    var client = http.Client();
    try {
      final body = {"user_id": "$userid", "otp": "$otp"};
      debugPrint("body : $body");

      final response = await client.post(Uri.parse("$baseUrl/api/verify"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }

  Future<dynamic> verifyotpPassword(String phone, String otp) async {
    var client = http.Client();
    try {
      final body = {"phone": "$phone", "otp": "$otp"};
      debugPrint("body : $body");

      final response = await client.post(Uri.parse("$baseUrl/api/verifyotp"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }

  Future<dynamic> resetPassword(String id, String pwd) async {
    var client = http.Client();
    try {
      final body = {"user_id": "$id", "password": "$pwd"};
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("$baseUrl/api/updatepassword"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }

  Future<dynamic> saveComment({String blogid = "", String comment = ""}) async {
    var client = http.Client();
    try {
      final body = {
        "blogId": "$blogid",
        "user_id": userCred.getUserId(),
        "mycomment": "$comment"
      };
      final header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${userCred.getUserToken()}"
      };
      debugPrint("body : $body");
      debugPrint("header : $header");

      final response = await client.post(
          Uri.parse("$baseUrl/api/blog/addcomment"),
          body: jsonEncode(body),
          headers: header);

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }

  Future<dynamic> likeBlog({String blogid = "", bool like = false}) async {
    var client = http.Client();
    try {
      final body = {
        "blogId": "$blogid",
        "user_id": userCred.getUserId(),
        "like": like
      };
      final header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${userCred.getUserToken()}"
      };
      debugPrint("body : $body");
      debugPrint("header : $header");

      final response = await client.post(Uri.parse("$baseUrl/api/blog/addlike"),
          body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }

  Future<dynamic> verifyPhone(String phone) async {
    var client = http.Client();
    try {
      final body = {
        "phone": "$phone",
      };
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("$baseUrl/api/resetPassword"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }

  Future<dynamic> doSignin(
      {String email = "",
      String pwd = "",
      String name = "",
      String phone = ""}) async {
    var client = http.Client();
    try {
      final body = {
        "email": "$email",
        "password": "$pwd",
        "phone": "$phone",
        "firstName": "$name"
      };
      debugPrint("body : $body");

      final response = await client.post(Uri.parse("$baseUrl/api/signup"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200 || response.statusCode == 400) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      //// print\(e\);
    } finally {
      client.close();
    }
  }
}
