import 'package:flutter/cupertino.dart';

class ProductModal {
  final String image;
  final String title;
  final String subtitle;

  ProductModal({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<ProductModal> productData = [
  ProductModal(
    image: "assets/Rectangle 30.png",
    title: "fghgfh",
    subtitle: "fcgxfgh",
  )
];
