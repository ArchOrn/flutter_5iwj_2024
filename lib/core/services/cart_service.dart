import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_5iwj_2024/core/models/cart_line.dart';
import 'package:flutter_5iwj_2024/core/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static const _cartKey = 'kCart';
  static final List<CartLine> _lines = [];
  static bool _initialized = false;

  static Future<List<CartLine>> getAll() async {
    if (!_initialized) {
      _initialized = true;
      _lines.clear();
      _lines.addAll(await _getAll());
    }

    return _lines;
  }

  static Future<List<CartLine>> add({required Product product, int quantity = 1}) async {
    final existing = _lines.firstWhereOrNull((e) => e.product.id == product.id);
    if (existing != null) {
      final index = _lines.indexOf(existing);
      _lines.replaceRange(index, index + 1, [existing.copyWith(quantity: existing.quantity + quantity)]);
    } else {
      _lines.add(CartLine(product: product, quantity: quantity));
    }
    await _saveAll(_lines);
    return _lines;
  }

  static Future<List<CartLine>> remove({required int productId}) async {
    _lines.removeWhere((e) => e.product.id == productId);
    await _saveAll(_lines);
    return _lines;
  }

  static Future<List<CartLine>> _getAll() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_cartKey)?.map((e) {
          return CartLine.fromJson(jsonDecode(e));
        }).toList() ??
        [];
  }

  static Future<void> _saveAll(List<CartLine> lines) async {
    final prefs = await SharedPreferences.getInstance();
    final value = lines.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList(_cartKey, value);
  }
}
