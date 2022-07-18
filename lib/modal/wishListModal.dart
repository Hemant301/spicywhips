class WishListModal {
  List<WishListResultModal> result = [];
  WishListModal(js) {
    for (var i = 0; i < js["result"].length; i++) {
      result.add(WishListResultModal(js["result"][i]));
    }
  }
}

class WishListResultModal {
  WishListProductModal? product;
  String? id;

  WishListResultModal(js) {
    id = js["_id"] ?? "";

    product = WishListProductModal(js["product"]);
  }
}

class WishListProductModal {
  String? id;
  String? name;
  String? desc;
  List<WishListAttrModal> attr = [];
  List<WishListProfileModal> profile = [];
  WishListProductModal(js) {
    id = js['_id'] ?? "";
    name = js['name'] ?? "";
    desc = js["description"] ?? "";
    for (var i = 0; i < js["attributes"].length; i++) {
      attr.add(WishListAttrModal(js["attributes"][i]));
    }
    for (var i = 0; i < js["productPictures"].length; i++) {
      profile.add(WishListProfileModal(js["productPictures"][i]));
    }
  }
}

class WishListAttrModal {
  dynamic colorname;
  String? price;
  String? mrp;
  String? stock;
  String? id;
  WishListAttrModal(js) {
    colorname = js['color_name'] ?? "";
    price = js['price'] ?? "";
    mrp = js['mrp'] ?? "";
    stock = js['stock'] ?? "";
    id = js['_id'] ?? "";
  }
}

class WishListProfileModal {
  String? img;
  WishListProfileModal(js) {
    img = js['img'] ?? "";
  }
}
