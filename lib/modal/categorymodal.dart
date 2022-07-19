class SuperSubcatModal {
  List<SubproductCatModal> product = [];
  SuperSubcatModal(js) {
    for (var i = 0; i < js['Products'].length; i++) {
      product.add(SubproductCatModal(js['Products'][i]));
    }
  }
}

class SubproductCatModal {
  String? id;
  String? name;
  String? desc;
  List<SubcatAttrModal> attr = [];
  List<SubcatpicModal> profile = [];
  SubproductCatModal(js) {
    id = js['_id'] ?? "";
    name = js['name'] ?? "";
    desc = js["description"] ?? "";
    for (var i = 0; i < js["attributes"].length; i++) {
      attr.add(SubcatAttrModal(js["attributes"][i]));
    }
    for (var i = 0; i < js["productPictures"].length; i++) {
      profile.add(SubcatpicModal(js["productPictures"][i]));
    }
  }
}

class SubcatpicModal {
  String? img;
  SubcatpicModal(js) {
    img = js['img'] ?? "";
  }
}

class SubcatAttrModal {
  dynamic colorname;
  String? price;
  String? mrp;
  String? stock;
  String? id;
  SubcatAttrModal(js) {
    colorname = js['color_name'] ?? "";
    price = js['price'] ?? "";
    mrp = js['mrp'] ?? "";
    stock = js['stock'] ?? "";
    id = js['_id'] ?? "";
  }
}
