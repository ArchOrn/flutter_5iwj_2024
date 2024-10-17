import 'dart:convert';
import 'dart:developer';

import 'package:flutter_5iwj_2024/core/exceptions/app_exception.dart';
import 'package:flutter_5iwj_2024/core/models/user.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (error) {
      log('An error occurred while retrieving users', error: error);
      throw AppException(message: 'An error occurred while retrieving users');
    }
  }
}
