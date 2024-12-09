import 'dart:convert';
import 'dart:developer';

import 'package:flutter_5iwj_2024/core/exceptions/app_exception.dart';
import 'package:flutter_5iwj_2024/core/models/product.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final list = data['products'] as List<dynamic>;
      return list.map((e) => Product.fromJson(e)).toList();
    } catch (error) {
      log('An error occurred while retrieving products', error: error);
      throw AppException(message: 'An error occurred while retrieving products');
    }
  }

  static Future<Product> getProduct({required int id}) async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/$id'));
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Product.fromJson(data);
    } catch (error) {
      log('An error occurred while retrieving product with id $id', error: error);
      throw AppException(message: 'An error occurred while retrieving product with id $id');
    }
  }
}
