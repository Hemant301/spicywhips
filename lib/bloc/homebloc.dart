import 'package:rxdart/rxdart.dart';
import 'package:spicywhips/modal/homemodal.dart';
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
}

final homeBloc = HomeBloc();
