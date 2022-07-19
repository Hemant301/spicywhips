import 'dart:convert';

import 'package:spicywhips/api/homeapi.dart';
import 'package:spicywhips/modal/categorymodal.dart';
import 'package:spicywhips/modal/homemodal.dart';
import 'package:spicywhips/modal/productdetailmodal.dart';
import 'package:spicywhips/modal/wishListModal.dart';

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

  Future<PopulatKeyModal> fetchPopularSearch(id) async {
    final response = await homeApi.fetchPopularSearch(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return PopulatKeyModal(jsonResponse);
  }

  Future<NewSearchModal> fetchNewSearch(id) async {
    final response = await homeApi.fetchNewSearch(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return NewSearchModal(jsonResponse);
  }

  Future<NewSearchModal> fetchTrendingSearch(id) async {
    final response = await homeApi.fetchTrendingSearch(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return NewSearchModal(jsonResponse);
  }

  Future<WishListModal> fetchWishlist() async {
    final response = await homeApi.fetchWishlist();
    var jsonResponse = jsonDecode(response.body) as Map;
    return WishListModal(jsonResponse);
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

  Future<CartModal> fetchCartitems() async {
    final response = await homeApi.fetchCartitems();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CartModal(jsonResponse);
  }

  Future<SuperSubcatModal> fetchCSupersubCat(id) async {
    final response = await homeApi.fetchCSupersubCat(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    return SuperSubcatModal(jsonResponse);
  }

  Future<CategoryModal> fetchCategory() async {
    final response = await homeApi.fetchCategory();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CategoryModal(jsonResponse);
  }

  Future<UserModal> fetchUsedetails() async {
    final response = await homeApi.fetchUsedetails();
    var jsonResponse = jsonDecode(response.body) as Map;
    return UserModal(jsonResponse);
  }

  Future<CategoryModal> fetchSubCategory() async {
    final response = await homeApi.fetchSubCategory();
    var jsonResponse = jsonDecode(response.body) as Map;
    return CategoryModal(jsonResponse);
  }

  Future<AddressModal> fetchAddress() async {
    final response = await homeApi.fetchAddress();
    var jsonResponse = jsonDecode(response.body) as Map;
    return AddressModal(jsonResponse);
  }
}
