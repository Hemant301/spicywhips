class ProductdetailWiseModal {
  ProductsModal? product;
  dynamic isWhishlist;
  ProductdetailWiseModal(js) {
    product = ProductsModal(js['product']);
    isWhishlist = js["isWishlist"] ?? "";
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

class CartModal {
  List<CartitemsModal> result = [];
  List<CartTotalModal> total = [];
  CartModal(js) {
    for (var i = 0; i < js['result'].length; i++) {
      result.add(CartitemsModal(js['result'][i]));
    }
    for (var i = 0; i < js['total'].length; i++) {
      total.add(CartTotalModal(js['total'][i]));
    }
  }
}

class CartitemsModal {
  String? id;
  CartProductModal? product;
  dynamic price;
  dynamic mrp;
  dynamic quantity;
  CartitemsModal(js) {
    id = js['_id'] ?? "";
    product = CartProductModal(js['product']);
    price = js['price'] ?? "";
    mrp = js['mrp'] ?? "";
    quantity = js['quantity'] ?? "";
  }
}

class CartTotalModal {
  String? id;
  dynamic? total;
  CartTotalModal(js) {
    id = js['_id'] ?? "";
    total = js['total'] ?? "";
  }
}

class CartProductModal {
  String? id;
  String? name;
  String? desc;
  List<CartProductphoto> photo = [];
  CartProductModal(js) {
    id = js['_id'] ?? "";
    name = js['name'] ?? "";
    desc = js['description'] ?? "";
    for (var i = 0; i < js["productPictures"].length; i++) {
      photo.add(CartProductphoto(js['productPictures'][i]));
    }
  }
}

class CartProductphoto {
  String? img;
  CartProductphoto(js) {
    img = js['img'] ?? "";
  }
}
