import 'package:flutter/material.dart';
class Category {
  final String title;
  final String icon;

  Category({
    required this.title,
    required this.icon});

}

List<Category> sampleCategories = [
  Category(title: "Dress", icon: "assets/icons/dress.svg"),
  Category(title: "Shirt", icon: "assets/icons/shirt.svg"),
  Category(title: "Pants", icon: "assets/icons/pants.svg"),
  Category(title: "T-shirt", icon: "assets/icons/Tshirt.svg")
];