import 'dart:convert';

import 'package:catering_app/data/add_meal_data.dart';
import 'package:catering_app/data/meal_data.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:http/http.dart' as http;

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? error;

  ApiResponse({required this.success, this.data, this.error});
}

class CateringCompanyAPIProxy implements ICateringCompanyAPI {
  final String baseUrl = "http://localhost:8080";
  static String? _token;

  Future<Map<String, dynamic>> _makeApiCall(
      Future<http.Response> Function() httpRequest) async {
    try {
      final response = await httpRequest();
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {
          "success": true,
          "responseBody": response.body,
        };
      } else {
        return {
          "success": false,
          "message": "Błąd API: ${response.body}",
          "responseBody": response.body,
        };
      }
    } catch (e) {
      print("Error: $e");
      return {
        "success": false,
        "message": "Nie udało się połączyć z serwerem",
        "responseBody": null,
      };
    }
  }

  Future<ApiResponse<void>> login(String login, String password) async {
    final url = Uri.parse("$baseUrl/auth/login");
    final result = await _makeApiCall(() => http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"login": login, "password": password}),
        ));

    if (result["success"]) {
      final responseBody = jsonDecode(result["responseBody"]);
      _token = responseBody["token"];
      return ApiResponse(success: true);
    } else {
      return ApiResponse(success: false, error: result["message"]);
    }
  }

  @override
  Future<ApiResponse<void>> addMeal(AddMealDTO meal) async {
    final cateringCompanyId = '12fcc746-b380-4f0b-a34c-6b110a615a94';
    final url = Uri.parse("$baseUrl/offers/$cateringCompanyId/meals");
    final result = await _makeApiCall(() => http.post(
          url,
          headers: {
            "Content-Type": "application/json",
            if (_token != null) "Authorization": "Bearer $_token",
          },
          body: jsonEncode({
            "description": meal.description,
            "price": double.tryParse(meal.price),
            "photoUrls": [meal.photoUrl],
          }),
        ));

    if (result["success"]) {
      return ApiResponse(success: true);
    } else {
      return ApiResponse(success: false, error: result["message"]);
    }
  }

  @override
  Future<ApiResponse<List<Meal>>> getListOfMealsByCompanyId(
      String companyId) async {
    final url = Uri.parse("$baseUrl/offers/$companyId/meals");
    final result = await _makeApiCall(() => http.get(
          url,
          headers: {
            "Content-Type": "application/json",
            if (_token != null) "Authorization": "Bearer $_token",
          },
        ));

    if (result["success"]) {
      List<dynamic> mealJsonList = jsonDecode(result["responseBody"]);
      List<Meal> meals = mealJsonList.map((json) {
        final List<dynamic> photoUrls = json['photoUrls'] ?? [];
        final String firstPhotoUrl = photoUrls.isNotEmpty
            ? photoUrls[0] as String
            : 'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg';

        return Meal.fromJson({
          ...json,
          'photoUrls': firstPhotoUrl,
        });
      }).toList();
      return ApiResponse(success: true, data: meals);
    } else {
      return ApiResponse(success: false, error: result["message"]);
    }
  }

  @override
  Future<ApiResponse<Meal>> getMeal(String id) async {
    final cateringCompanyId = '12fcc746-b380-4f0b-a34c-6b110a615a94';
    final url = Uri.parse("$baseUrl/offers/$cateringCompanyId/meals/$id");
    final result = await _makeApiCall(() => http.get(
          url,
          headers: {
            "Content-Type": "application/json",
            if (_token != null) "Authorization": "Bearer $_token",
          },
        ));

    if (result["success"]) {
      final Map<String, dynamic> mealJson = jsonDecode(result["responseBody"]);
      final List<dynamic> photoUrls = mealJson['photosUrls'] ?? [];
      final String firstPhotoUrl = photoUrls.isNotEmpty
          ? photoUrls[0] as String
          : 'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg';
      Meal meal = Meal.fromJson({
        ...mealJson,
        'photoUrls': firstPhotoUrl,
      });
      return ApiResponse(success: true, data: meal);
    } else {
      return ApiResponse(success: false, error: result["message"]);
    }
  }

  @override
  Future<ApiResponse<void>> updateMeal(String mealId, AddMealDTO meal) async {
    final cateringCompanyId = '12fcc746-b380-4f0b-a34c-6b110a615a94';
    final url = Uri.parse("$baseUrl/offers/$cateringCompanyId/meals/$mealId");
    final result = await _makeApiCall(() => http.put(
          url,
          headers: {
            "Content-Type": "application/json",
            if (_token != null) "Authorization": "Bearer $_token",
          },
          body: jsonEncode({
            "description": meal.description,
            "price": double.tryParse(meal.price),
            "photoUrls": [meal.photoUrl],
          }),
        ));

    if (result["success"]) {
      return ApiResponse(success: true);
    } else {
      return ApiResponse(success: false, error: result["message"]);
    }
  }
}
