import 'dart:convert';

import 'package:flutter/material.dart';
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

  Future<dynamic> fetchSubCat(id) async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/subcategory/get/supercategory/$id"),
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

  Future<dynamic> fetchWishlist() async {
    try {
      print("Bearer ${userCred.getUserToken()}");
      print(userCred.getUserId());
      final response = await client.get(
          Uri.parse(
              "${baseUrl}/api/user/getWishlistItems/${userCred.getUserId()}"),
          headers: {"Authorization": "Bearer ${userCred.getUserToken()}"});
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

  Future<dynamic> fetchCommercials() async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/commercial/get"),
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

  Future<dynamic> fetchHomeProduct() async {
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/product/home"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //   print(response.body);
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
        // print(response.body);
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
        // print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchProductdetails(id) async {
    try {
      final body = {"product_id": "$id", "user_id": userCred.getUserId()};
      print("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/product/getdetail"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
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

  Future<dynamic> fetchCartitems() async {
    // print(userCred.getUserId());
    // print(userCred.getUserToken());
    try {
      final response = await client.get(
          Uri.parse("${baseUrl}/api/user/getCartItems/${userCred.getUserId()}"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });
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

  Future<dynamic> fetchBlogdetailsinit(id) async {
    var client = http.Client();
    try {
      final body = {"blog_id": "$id", "user_id": userCred.getUserId()};
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/blog/userblogdetail"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        //  print(response.body);
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

  Future<dynamic> ChangeQty({String id = "", int qty = 0}) async {
    var client = http.Client();
    try {
      final body = {
        "cart_id": "$id",
        "user_id": userCred.getUserId(),
        "quantity": qty.toString()
      };
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/user/cart/updateCartQty"),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<dynamic> deletecartItems(id) async {
    var client = http.Client();
    try {
      final response = await client.get(
          Uri.parse(
              "${baseUrl}/api/user/deleteCartId/${userCred.getUserId()}/${id}"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<dynamic> removeWishList(id) async {
    var client = http.Client();
    try {
      final body = {"product_id": "$id", "user_id": userCred.getUserId()};
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/user/wishlist/delete"),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        //  print(response.body);
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

  Future<dynamic> addWishlist(id) async {
    var client = http.Client();
    try {
      final body = {"product_id": "$id", "user_id": userCred.getUserId()};
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/user/wishlist/add"),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<dynamic> addToCart(
      {String p_id = "", String price = "", String mrp = ""}) async {
    var client = http.Client();
    try {
      final body = {
        "user_id": userCred.getUserId(),
        "product_id": "62ce9cf26538a8a9c1ccd945",
        "price": "$price",
        "mrp": "$mrp",
        "quantity": "1"
      };
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/user/cart/addtocart"),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<dynamic> deleteAddress(id) async {
    var client = http.Client();
    try {
      final response = await client.delete(
          Uri.parse(
              "${baseUrl}/api/user/deleteAddress/${userCred.getUserId()}/$id"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<dynamic> updateUserdetails(
      {String name = "", String phone = "", String email = ""}) async {
    var client = http.Client();
    try {
      final body = {
        "user_id": userCred.getUserId(),
        "email": email,
        "phone": phone,
        "name": name
      };
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/user/update"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        //    print(response.body);
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

  Future<dynamic> addAddress(
      {String name = "",
      String address = "",
      String landmark = "",
      String city = "",
      String phone = "",
      String pincode = ""}) async {
    var client = http.Client();
    try {
      final body = {
        "name": "$name",
        "user_id": userCred.getUserId(),
        "address": "$address",
        "landmark": "$landmark",
        "city": "$city",
        "phone": "$phone",
        "pincode": "$pincode"
      };
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/user/address/add"),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        //    print(response.body);
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

  Future<dynamic> updateAddress(
      {String name = "",
      String address = "",
      String addId = "",
      String landmark = "",
      String city = "",
      String phone = "",
      String pincode = ""}) async {
    var client = http.Client();
    try {
      final body = {
        "address_id": "$addId",
        "name": "$name",
        "user_id": userCred.getUserId(),
        "address": "$address",
        "landmark": "$landmark",
        "city": "$city",
        "phone": "$phone",
        "pincode": "$pincode"
      };
      debugPrint("body : $body");

      final response = await client.post(
          Uri.parse("${baseUrl}/api/user/address/update"),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${userCred.getUserToken()}"
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  Future<dynamic> fetchSupercat() async {
    var client = http.Client();
    try {
      final response = await client.get(
        Uri.parse("${baseUrl}/api/category/getcategory"),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //  print(response.body);
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

  Future<dynamic> fetchUsedetails() async {
    try {
      final body = {"user_id": "${userCred.getUserId()}"};
      final response = await client.post(
          Uri.parse("${baseUrl}/api/user/userdetail"),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
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
        //  print(response.body);
        return response;
      } else {
        //   print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }

  Future<dynamic> fetchAddress() async {
    try {
      final response = await client.get(
          Uri.parse("${baseUrl}/api/user/address/${userCred.getUserId()}"),
          headers: {"Authorization": "Bearer ${userCred.getUserToken()}"});

      if (response.statusCode == 200 || response.statusCode == 201) {
        //  print(response.body);
        return response;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    } finally {}
  }
}

final homeapi = HomeApi();
