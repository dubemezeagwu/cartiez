import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/product.dart';

class ApiService {

  final String endPointUrl = "https://fakestoreapi.com/products";

  List<Product> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) =>Product.fromJson(json)).toList();
  }
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}