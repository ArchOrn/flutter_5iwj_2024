import 'dart:convert';
import 'dart:developer';

import 'package:flutter_5iwj_2024/core/exceptions/app_exception.dart';
import 'package:flutter_5iwj_2024/core/models/recipe.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Recipe>> getRecipes() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final list = data['recipes'] as List<dynamic>;
      return list.map((e) => Recipe.fromJson(e)).toList();
    } catch (error) {
      log('An error occurred while retrieving recipes', error: error);
      throw AppException(message: 'An error occurred while retrieving recipes');
    }
  }
}
