import 'package:dio/dio.dart';

class BaseAPI {
  String baseUrl = "https://fakestoreapi.com";

  final Dio dio = Dio();
}