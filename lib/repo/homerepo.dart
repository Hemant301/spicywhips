import 'dart:convert';

import 'package:spicywhips/api/homeapi.dart';
import 'package:spicywhips/modal/homemodal.dart';
import 'package:spicywhips/modal/productdetailmodal.dart';

class HomeRepo {
  HomeApi homeApi = HomeApi();
  Future<TestimonialModal> fetchTestimomnial() async {
    final response = await homeApi.fetchTestimomnial();
    var jsonResponse = jsonDecode(response.body) as Map;
    return TestimonialModal(jsonResponse);
  }

  Future<SubCatModal> fetchSubCat(id) async {
    final response = await homeApi.fetchSubCat(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return SubCatModal(jsonResponse);
  }

  Future<CommercialModal> fetchCommercials() async {
    final response = await homeApi.fetchCommercials();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CommercialModal(jsonResponse);
  }

  Future<HomeProductModal> fetchHomeProduct() async {
    final response = await homeApi.fetchHomeProduct();
    var jsonResponse = jsonDecode(response.body) as Map;
    return HomeProductModal(jsonResponse);
  }

  Future<SliderModal> fetchSlider() async {
    final response = await homeApi.fetchSlider();
    var jsonResponse = jsonDecode(response.body) as Map;
    return SliderModal(jsonResponse);
  }

  Future<BlogModal> fetchBlog() async {
    final response = await homeApi.fetchBlog();
    var jsonResponse = jsonDecode(response.body) as Map;
    return BlogModal(jsonResponse);
  }

  Future<BlogdetailModal> fetchBlogdetails(id) async {
    final response = await homeApi.fetchBlogdetails(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return BlogdetailModal(jsonResponse);
  }

  Future<ProductdetailWiseModal> fetchProductdetails(id) async {
    final response = await homeApi.fetchProductdetails(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return ProductdetailWiseModal(jsonResponse);
  }

  Future<CategoryModal> fetchCategory() async {
    final response = await homeApi.fetchCategory();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CategoryModal(jsonResponse);
  }

  Future<CategoryModal> fetchSubCategory() async {
    final response = await homeApi.fetchSubCategory();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CategoryModal(jsonResponse);
  }
}
