class TestimonialModal {
  List<TestimonialDetailModal> data = [];
  TestimonialModal(js) {
    for (var i = 0; i < js['testimonial'].length; i++) {
      data.add(TestimonialDetailModal(js['testimonial'][i]));
    }
  }
}

class TestimonialDetailModal {
  String? _id;
  String? name;
  String? designation;
  String? description;
  String? testimonialImage;
  String? createdAt;
  TestimonialDetailModal(js) {
    _id = js['_id'] ?? "";
    name = js['name'] ?? "";
    designation = js['designation'] ?? "";
    description = js['description'] ?? "";
    testimonialImage = js['testimonialImage'] ?? "";
    createdAt = js['createdAt'] ?? "";
  }
}

class SliderModal {
  List<SliderDetailModal> data = [];
  SliderModal(js) {
    for (var i = 0; i < js['slider'].length; i++) {
      data.add(SliderDetailModal(js['slider'][i]));
    }
  }
}

class SliderDetailModal {
  String? _id;
  String? name;
  String? sliderImage;
  String? createdAt;
  SliderDetailModal(js) {
    _id = js['_id'] ?? "";
    name = js['name'] ?? "";
    sliderImage = js['sliderImage'] ?? "";
    createdAt = js['createdAt'] ?? "";
  }
}

class BlogModal {
  List<BlogDetailModal> data = [];
  BlogModal(js) {
    for (var i = 0; i < js['blog'].length; i++) {
      data.add(BlogDetailModal(js['blog'][i]));
    }
  }
}

class BlogDetailModal {
  String? id;
  String? name;
  String? blogThumbnail;
  String? createdAt;
  String? detail;
  BlogDetailModal(js) {
    id = js['_id'] ?? "";
    name = js['name'] ?? "";
    blogThumbnail = js['blogThumbnail'] ?? "";
    createdAt = js['createdAt'] ?? "";
    detail = js['detail'] ?? "";
  }
}

class CategoryModal {
  List<CategoryDetailModal> data = [];
  CategoryModal(js) {
    for (var i = 0; i < js['categories'].length; i++) {
      data.add(CategoryDetailModal(js['categories'][i]));
    }
  }
}

class CategoryDetailModal {
  String? id;
  String? name;
  String? categoryImage;
  String? createdAt;
  CategoryDetailModal(js) {
    id = js['_id'] ?? "";
    name = js['name'] ?? "";
    categoryImage = js['categoryImage'] ?? "";
    createdAt = js['createdAt'] ?? "";
  }
}

class BlogdetailModal {
  BlogdataModal? blog;
  // CheckLikeModal? checkLike;
  BlogdetailModal(js) {
    blog = BlogdataModal(js['blog']);
    // checkLike = CheckLikeModal(js['checkLike']);
  }
}

class BlogdataModal {
  String? id;
  String? name;
  String? slug;
  String? detail;
  dynamic numberOfLikes;
  String? blogThumbnail;
  String? createdAt;
  List<CommentBlogModal> comment = [];
  List<LikesBlogModal> likes = [];
  CreatedByModal? createdBy;

  BlogdataModal(js) {
    id = js['_id'] ?? "";
    name = js['name'] ?? "";
    slug = js['slug'] ?? "";
    numberOfLikes = js['numberOfLikes'] ?? "";
    detail = js['detail'] ?? "";
    blogThumbnail = js['blogThumbnail'] ?? "";
    createdAt = js['createdAt'] ?? "";
    createdBy = CreatedByModal(js['createdBy']);
    for (var i = 0; i < js['comments'].length; i++) {
      comment.add(CommentBlogModal(js['comments'][i]));
    }
    for (var i = 0; i < js['likes'].length; i++) {
      likes.add(LikesBlogModal(js['likes'][i]));
    }
  }
}

class LikesBlogModal {
  String? user;
  bool? isLike;
  String? _id;

  LikesBlogModal(js) {
    user = js['user'] ?? "";
    isLike = js['isLike'] ?? false;
    _id = js['_id'] ?? "";
  }
}

class CreatedByModal {
  String? firstName;
  CreatedByModal(js) {
    firstName = js['firstName'] ?? "";
  }
}

class CommentBlogModal {
  String? name;
  String? avatar;
  String? comment;
  String? commentAt;
  CommentBlogModal(js) {
    name = js['name'] ?? "";
    avatar = js['avatar'] ?? "";
    comment = js['comment'] ?? "";
    commentAt = js['commentAt'] ?? "";
  }
}

class CommercialModal {
  List<CommercialDetailModal> data = [];
  CommercialModal(js) {
    for (var i = 0; i < js['commercial'].length; i++) {
      data.add(CommercialDetailModal(js['commercial'][i]));
    }
  }
}

class CommercialDetailModal {
  String? _id;
  String? commercialImage;
  // String? video;

  CommercialDetailModal(js) {
    _id = js['_id'] ?? "";
    commercialImage = js['commercialImage'] ?? "";
    // video = js['video'] ?? "";
  }
}

class HomeProductModal {
  List<HomeproductsdetailModal> products = [];
  HomeProductModal(js) {
    for (var i = 0; i < js['products'].length; i++) {
      products.add(HomeproductsdetailModal(js['products'][i]));
    }
  }
}

class HomeproductsdetailModal {
  String? title;
  List<ProductdetailModal> productList = [];
  HomeproductsdetailModal(js) {
    title = js['title'] ?? "";
    for (var i = 0; i < js['product'].length; i++) {
      productList.add(ProductdetailModal(js['product'][i]));
    }
  }
}

class ProductdetailModal {
  String? id;
  List<HomeproductImage> image = [];
  ProductdetailModal(js) {
    id = js['_id'] ?? "";
    for (var i = 0; i < js['productPictures'].length; i++) {
      image.add(HomeproductImage(js['productPictures'][i]));
    }
  }
}

class HomeproductImage {
  String? img;
  HomeproductImage(js) {
    img = js['img'] ?? "";
  }
}

class SubCatModal {
  List<SubcatResultModal> data = [];
  SubCatModal(js) {
    for (var i = 0; i < js['result'].length; i++) {
      data.add(SubcatResultModal(js['result'][i]));
    }
  }
}

class SubcatResultModal {
  String? id;
  String? name;
  String? supercategory;
  SubcatResultModal(js) {
    id = js['id'] ?? "";
    name = js['name'] ?? "";
    supercategory = js['supercategory'] ?? "";
  }
}
