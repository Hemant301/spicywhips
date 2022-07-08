import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spicywhips/util/const.dart';
import 'package:spicywhips/util/usercred.dart';

class HomeApi {
  var client = http.Client();

  Future<dynamic> fetchTestimomnial() async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/testimonial/get"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //  print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchSlider() async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/slider/getslider"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //  print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchBlog() async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/blog/get"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchBlogdetails(id) async {
    try {
      final body = {"blog_id": "$id", "user_id": userCred.getUserId()};
      print("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/blog/userblogdetail"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchCategory() async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/category/getcategory"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchSubCategory() async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/subcategory/get"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }
}
