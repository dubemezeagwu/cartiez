// import 'dart:convert';
// import 'package:cartiez/data/services/network/base_api.dart';
// import 'package:cartiez/utils/constants.dart';
// import 'package:dio/dio.dart';
// import 'package:logger/logger.dart';
//
// import '../../models/product.dart';
//
// class ProductsAPI extends BaseAPI{
//   Logger log = Logger();
//   final String endPointUrl = "/products";
//
//   List<Product> parseProducts(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<Product>((json) =>Product.fromJson(json)).toList();
//   }
//   Future<List<Product>> getProducts() async {
//     final String url = "$baseUrl$endPointUrl";
//     try {
//       final Response <dynamic> response = await dio.get(url);
//       log.e(response);
//       switch (response.statusCode) {
//         case SERVER_OKAY:
//           try {
//             return parseProducts(response.data);
//           }catch(e){
//             throw PARSING_ERROR;
//           }
//           break;
//         default:
//           throw response.data;
//       }
//     } catch(e){
//       log.e(e);
//       throw CustomE
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/product.dart';

class ProductsAPI {

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