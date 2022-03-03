import 'dart:convert';

import 'package:cartiez/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {

  final String endPointUrl = "https://fakestoreapi.com/products";

  List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) =>Product.fromJson(json)).toList();
  }
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      print("Response: ${response.body}");
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    final body = json.decode(response.body);

    return body.map<Product>(Product.fromJson).toList();
  }
}