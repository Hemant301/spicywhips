class ProductdetailWiseModal {
  ProductsModal? product;
  ProductdetailWiseModal(js) {
    product = ProductsModal(js['product']);
  }
}

class ProductsModal {
  String? id;
  String? name;
  String? slug;
  String? desc;
  List<AttributeModal> attr = [];
  List<SizesModal> size = [];
  List<ProductimageModal> productimage = [];
  ProductsModal(js) {
    id = js['_id'] ?? "";
    name = js['name'] ?? "";
    slug = js['slug'] ?? "";
    desc = js['description'] ?? "";
    for (var i = 0; i < js['attributes'].length; i++) {
      attr.add(AttributeModal(js['attributes'][i]));
    }
    for (var i = 0; i < js['sizes'].length; i++) {
      size.add(SizesModal(js['sizes'][i]));
    }
    for (var i = 0; i < js['productPictures'].length; i++) {
      productimage.add(ProductimageModal(js['productPictures'][i]));
    }
  }
}

class AttributeModal {
  dynamic colorname;
  String? price;
  String? mrp;
  String? stock;
  String? id;
  AttributeModal(js) {
    colorname = js['color_name'] ?? "";
    price = js['price'] ?? "";
    mrp = js['mrp'] ?? "";
    stock = js['stock'] ?? "";
    id = js['_id'] ?? "";
  }
}

class SizesModal {
  SizeIdModal? sizeid;
  String? id;
  SizesModal(js) {
    sizeid = SizeIdModal(js['sizeId']);
    id = js['_id'] ?? "";
  }
}

class SizeIdModal {
  String? name;
  SizeIdModal(js) {
    name = js['name'] ?? '';
  }
}

class ProductimageModal {
  String? img;
  ProductimageModal(js) {
    img = js['img'] ?? "";
  }
}
