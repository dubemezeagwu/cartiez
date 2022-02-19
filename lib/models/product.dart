import 'package:flutter/material.dart';

class Product {
  final String image;
  final String title;
  final int price;
  final Color backgroundColor;

  Product({
    required this.image,
    required this.title,
    required this.price,
    this.backgroundColor = const Color(0xFFEFEFF2)
});
}

List<Product> demoProduct = [
  Product(
    image: "assets/images/product_0.png",
    title: "Short Sleeve Shirts",
    price: 165,
    backgroundColor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/images/product_1.png",
    title: "Casual Henley Shirts",
    price: 99,
  ),
  Product(
    image: "assets/images/product_2.png",
    title: "Curved Hem Shirts",
    price: 180,
    backgroundColor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/images/product_3.png",
    title: "Casual Nolin",
    price: 149,
    backgroundColor: const Color(0xFFEEEEED),
  ),
];