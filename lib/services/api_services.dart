import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:haupcar_assignment/models/category_model.dart';
import 'package:haupcar_assignment/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "https://dummyjson.com/products";

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/categories'));
      if (response.statusCode == 200) {
        final jsonResponseList = json.decode(response.body) as List;
        if (jsonResponseList.isEmpty) {
          return [];
        } else {
          return jsonResponseList.map((category) => CategoryModel.fromJson(category as Map<String, dynamic>)).toList();
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> fetchProducts(String category) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/category/$category'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
        if (kDebugMode) {
          log(jsonResponse.toString(), name: "$baseUrl/category/$category");
        }
        final jsonResponseList = jsonResponse['products'] as List;

        if (jsonResponseList.isEmpty) {
          return [];
        } else {
          return jsonResponseList.map((product) => Product.fromJson(product as Map<String, dynamic>)).toList();
        }
      } else {
        throw Exception('Failed to load goods');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load goods');
    }
  }
}
