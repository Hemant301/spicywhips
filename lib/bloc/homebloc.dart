import 'package:rxdart/rxdart.dart';
import 'package:spicywhips/modal/categorymodal.dart';
import 'package:spicywhips/modal/homemodal.dart';
import 'package:spicywhips/modal/productdetailmodal.dart';
import 'package:spicywhips/modal/wishListModal.dart';
import 'package:spicywhips/repo/homerepo.dart';

class HomeBloc {
  HomeRepo _homeRepo = HomeRepo();
  final BehaviorSubject<TestimonialModal> _liveTestimonial =
      BehaviorSubject<TestimonialModal>();
  BehaviorSubject<TestimonialModal> get getHomeTestimonial => _liveTestimonial;
  fetchTestimomnial() async {
    try {
      TestimonialModal homeSlider = await _homeRepo.fetchTestimomnial();
      // print(homeSlider.imgs!.length);

      _liveTestimonial.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SubCatModal> _liveSubcat =
      BehaviorSubject<SubCatModal>();
  BehaviorSubject<SubCatModal> get getSubcat => _liveSubcat;
  fetchSubCat(id) async {
    try {
      SubCatModal homeSlider = await _homeRepo.fetchSubCat(id);
      // print(homeSlider.imgs!.length);

      _liveSubcat.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<PopulatKeyModal> _livePopularSearch =
      BehaviorSubject<PopulatKeyModal>();
  BehaviorSubject<PopulatKeyModal> get getpopularSearch => _livePopularSearch;
  fetchPopularSearch(id) async {
    try {
      PopulatKeyModal homeSlider = await _homeRepo.fetchPopularSearch(id);

      _livePopularSearch.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<NewSearchModal> _liveTrendingSearch =
      BehaviorSubject<NewSearchModal>();
  BehaviorSubject<NewSearchModal> get getTrendingSearch => _liveTrendingSearch;
  fetchTrendingSearch(id) async {
    try {
      NewSearchModal homeSlider = await _homeRepo.fetchTrendingSearch(id);

      _liveTrendingSearch.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<NewSearchModal> _livenewSearch =
      BehaviorSubject<NewSearchModal>();
  BehaviorSubject<NewSearchModal> get getNewSearch => _livenewSearch;
  fetchNewSearch(id) async {
    try {
      NewSearchModal homeSlider = await _homeRepo.fetchNewSearch(id);

      _livenewSearch.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<WishListModal> _liveWishList =
      BehaviorSubject<WishListModal>();
  BehaviorSubject<WishListModal> get getWishList => _liveWishList;
  fetchWishlist() async {
    try {
      WishListModal homeSlider = await _homeRepo.fetchWishlist();
      // print(homeSlider.imgs!.length);

      _liveWishList.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CommercialModal> _liveCommercial =
      BehaviorSubject<CommercialModal>();
  BehaviorSubject<CommercialModal> get getHomeCommercial => _liveCommercial;
  fetchCommercials() async {
    try {
      CommercialModal homeSlider = await _homeRepo.fetchCommercials();
      // print(homeSlider.imgs!.length);

      _liveCommercial.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<HomeProductModal> _liveHomeProduct =
      BehaviorSubject<HomeProductModal>();
  BehaviorSubject<HomeProductModal> get getHomeProduct => _liveHomeProduct;
  fetchHomeProduct() async {
    try {
      HomeProductModal homeSlider = await _homeRepo.fetchHomeProduct();
      // print(homeSlider.imgs!.length);

      _liveHomeProduct.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SliderModal> _liveSlider =
      BehaviorSubject<SliderModal>();
  BehaviorSubject<SliderModal> get getslider => _liveSlider;
  fetchSlider() async {
    try {
      SliderModal homeSlider = await _homeRepo.fetchSlider();
      // print(homeSlider.imgs!.length);

      _liveSlider.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<BlogModal> _liveBlog = BehaviorSubject<BlogModal>();
  BehaviorSubject<BlogModal> get getBlog => _liveBlog;
  fetchBlog() async {
    try {
      BlogModal homeSlider = await _homeRepo.fetchBlog();
      // print(homeSlider.imgs!.length);

      _liveBlog.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<BlogdetailModal> _liveBlogDetails =
      BehaviorSubject<BlogdetailModal>();
  BehaviorSubject<BlogdetailModal> get getBlogDetails => _liveBlogDetails;
  fetchBlogdetails(id) async {
    try {
      BlogdetailModal homeSlider = await _homeRepo.fetchBlogdetails(id);
      // print(homeSlider.imgs!.length);

      _liveBlogDetails.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<ProductdetailWiseModal> _liveProductDetails =
      BehaviorSubject<ProductdetailWiseModal>();
  BehaviorSubject<ProductdetailWiseModal> get getProductDetails =>
      _liveProductDetails;
  fetchProductdetails(id) async {
    try {
      ProductdetailWiseModal homeSlider =
          await _homeRepo.fetchProductdetails(id);
      // print(homeSlider.imgs!.length);

      _liveProductDetails.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CartModal> _livecartitems =
      BehaviorSubject<CartModal>();
  BehaviorSubject<CartModal> get getcartitems => _livecartitems;
  fetchCartitems() async {
    try {
      CartModal homeSlider = await _homeRepo.fetchCartitems();
      // print(homeSlider.imgs!.length);

      _livecartitems.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SuperSubcatModal> _liveSupersubCat =
      BehaviorSubject<SuperSubcatModal>();
  BehaviorSubject<SuperSubcatModal> get getSuperSubcat => _liveSupersubCat;
  fetchCSupersubCat(id) async {
    try {
      SuperSubcatModal homeSlider = await _homeRepo.fetchCSupersubCat(id);
      // print(homeSlider.imgs!.length);

      _liveSupersubCat.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  removeState() {
    _liveSubcat.addError('error');
    _liveProductDetails.addError('error');
    _liveSupersubCat.addError('error');
  }

  removeState2() {
    _liveSupersubCat.addError('error');
  }

  final BehaviorSubject<CategoryModal> _liveCategory =
      BehaviorSubject<CategoryModal>();
  BehaviorSubject<CategoryModal> get getCategory => _liveCategory;
  fetchCategory() async {
    try {
      CategoryModal homeSlider = await _homeRepo.fetchCategory();
      // print(homeSlider.imgs!.length);

      _liveCategory.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<UserModal> liveUserDetails =
      BehaviorSubject<UserModal>();
  BehaviorSubject<UserModal> get getUserDetails => liveUserDetails;
  fetchUsedetails() async {
    try {
      UserModal homeSlider = await _homeRepo.fetchUsedetails();
      // print(homeSlider.imgs!.length);

      liveUserDetails.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CategoryModal> _liveSubCategory =
      BehaviorSubject<CategoryModal>();
  BehaviorSubject<CategoryModal> get getSubCategory => _liveSubCategory;
  fetchSubCategory() async {
    try {
      CategoryModal homeSlider = await _homeRepo.fetchSubCategory();
      // print(homeSlider.imgs!.length);

      _liveSubCategory.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<AddressModal> _liveAddress =
      BehaviorSubject<AddressModal>();
  BehaviorSubject<AddressModal> get getAddress => _liveAddress;
  fetchAddress() async {
    try {
      AddressModal homeSlider = await _homeRepo.fetchAddress();
      // print(homeSlider.imgs!.length);

      _liveAddress.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }
}

final homeBloc = HomeBloc();
