import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:catering_app/data/meal_data.dart';
import 'package:catering_app/data/add_meal_data.dart';

class CateringModel {
  final String baseUrl = "http://localhost:8080";
  //final String? authToken = Auth.instance.accessToken; TODO are we using auth tokens?

  Future<List<Meal>> getAllMeals() async {
    return _postAllMeals('$baseUrl/offers/search/meals');
  }

  Future<List<Meal>> _postAllMeals(String url) async {
    Uri uri = Uri.parse(url);
    print("POST $uri");

    try {
      final response = await http.post(
        uri,
        headers: _headersForAll(),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> mealJsonList = jsonDecode(response.body);

        return mealJsonList.map((json) {
          final List<dynamic> photoUrls = json['photoUrls'] ?? [];
          final String firstPhotoUrl =
              photoUrls.isNotEmpty ? photoUrls[0] as String : '';

          return Meal.fromJson({
            ...json,
            'photoUrls': firstPhotoUrl,
          });
        }).toList();
      } else if (response.statusCode == 404) {
        throw Exception("nie znaleziono posiłków.");
      } else {
        throw Exception("nieoczekiwany problem: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in POST request: $e");
      throw Exception("nie udało się pobrać posiłków: ${e.toString()}");
    }
  }

  Future<Map<String, dynamic>> addMealToCart(int mealId, int userId) async {
    try {
      final url = Uri.parse("$baseUrl/orders"); //TODO endpoint
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          //"Authorization": "Bearer YOUR_AUTH_TOKEN"
        },
        body: jsonEncode({
          "mealId": mealId,
          "userId": userId,
        }),
      );
      if (response.statusCode == 200) {
        return {"success": true};
      } else {
        final errorBody = jsonDecode(response.body);
        return {
          "success": false,
          "message": errorBody['message'] ?? 'Zaszedł bląd. Spróbuj później.'
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Nie udało się połączyć z serwerem."
      };
    }
  }

  Future<Map<String, dynamic>> addCompanyMeal(AddMealDTO addMealData) async {
    try {
      final cateringCompanyId = '1'; // TODO: WHICH ID HERE???
      final url = Uri.parse("$baseUrl/$cateringCompanyId/meals");
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          //"Authorization": "Bearer YOUR_AUTH_TOKEN"
        },
        body: jsonEncode({
          "description": addMealData.description,
          "price": double.tryParse(addMealData.price),
          "photoUrls": [addMealData.photoUrl],
        }),
      );
      if (response.statusCode == 200) {
        return {"success": true};
      } else {
        final errorBody = jsonDecode(response.body);
        return {
          "success": false,
          "message": errorBody['message'] ?? 'Zaszedł bląd. Spróbuj później.'
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Nie udało się połączyć z serwerem."
      };
    }
  }

  Future<Meal> getMealById(int mealId) async {
    return _getMeal('$baseUrl/offers/$mealId');
  }

  Future<List<Meal>> getMealsByType(int typeId) async {
    return _getMeals('$baseUrl/offers/type/$typeId');
  }

  Future<List<Meal>> searchMeals(String query) async {
    Uri uri = Uri.parse('$baseUrl/offers/search?name=$query');
    return _getMeals(uri.toString());
  }

  Future<List<Meal>> searchScannedMeals(String query) async {
    Uri uri = Uri.parse('$baseUrl/offers/search/tags?name=$query');
    return _getMeals(uri.toString());
  }

  Future<Meal> getRandomMeal() async {
    return _getMeal('$baseUrl/offers/random/get');
  }

  Future<List<Meal>> getMealsByProducer(int producerId) async {
    return _getMeals('$baseUrl/offers/producer/$producerId');
  }

  Future<List<Meal>> getFavoriteMeals(int userId) async {
    return _getMeals('$baseUrl/offers/$userId/favorite');
  }

  Future<bool> checkIfMealIsLiked(int mealId, int userId) async {
    Uri uri = Uri.parse('$baseUrl/offers/$mealId/isLikedByUser?userId=$userId');
    print("GET $uri");
    final response = await http.get(uri, headers: _headers());
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    bool isLiked = jsonDecode(response.body);
    return isLiked;
  }

  Future<http.Response> createMeal(Map<String, dynamic> mealData) async {
    Uri uri = Uri.parse('$baseUrl/offers');
    return _postJson(uri, mealData);
  }

  Future<http.Response> updateMeal(
      int mealId, Map<String, dynamic> mealData) async {
    Uri uri = Uri.parse('$baseUrl/offers/$mealId');
    return _putJson(uri, mealData);
  }

  Future<http.Response> deleteMeal(int mealId) async {
    Uri uri = Uri.parse('$baseUrl/offers/$mealId');
    return _delete(uri);
  }

  Future<http.Response> favoriteMeal(int mealId) async {
    Uri uri = Uri.parse('$baseUrl/offers/$mealId/favorite');
    return _postJson(uri, {});
  }

  Future<http.Response> favoriteMealDelete(int mealId) async {
    Uri uri = Uri.parse('$baseUrl/offers/$mealId/favorite');
    return _delete(uri);
  }

  Future<List<Meal>> _getMeals(String url) async {
    Uri uri = Uri.parse(url);
    print("GET $uri");
    final response = await http.get(uri, headers: _headersForAll());
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      List<dynamic> mealJsonList = jsonDecode(response.body);
      return mealJsonList.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed to load meals: ${response.statusCode}. Response: ${response.body}');
    }
  }

  Future<Meal> _getMeal(String url) async {
    Uri uri = Uri.parse(url);
    print("GET $uri");
    final response = await http.get(uri, headers: _headersForAll());
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      return Meal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load meal: ${response.statusCode}. Response: ${response.body}');
    }
  }

  Future<http.Response> _postJson(Uri uri, Map<String, dynamic> data) async {
    print("POST $uri with data: $data");
    final response = await http.post(uri,
        headers: _headers(contentType: true), body: jsonEncode(data));
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode >= 400) {
      throw Exception(
          'Failed to create meal: ${response.statusCode}. Response: ${response.body}');
    }
    return response;
  }

  Future<http.Response> _putJson(Uri uri, Map<String, dynamic> data) async {
    print("PUT $uri with data: $data");
    final response = await http.put(uri,
        headers: _headers(contentType: true), body: jsonEncode(data));
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode >= 400) {
      throw Exception(
          'Failed to update meal: ${response.statusCode}. Response: ${response.body}');
    }
    return response;
  }

  Future<http.Response> _delete(Uri uri) async {
    print("DELETE $uri");
    final response = await http.delete(uri, headers: _headers());
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode >= 400) {
      throw Exception(
          'Failed to delete meal: ${response.statusCode}. Response: ${response.body}');
    }
    return response;
  }

  Map<String, String> _headers({bool contentType = false}) {
    final headers = {
      'accept': 'application/json',
      /*'Authorization': 'Bearer $authToken',*/
    };
    if (contentType) {
      headers['Content-Type'] = 'application/json';
    }
    print(headers);
    return headers;
  }

  Map<String, String> _headersForAll({bool contentType = false}) {
    final headers = {
      'accept': 'application/json',
    };
    if (contentType) {
      headers['Content-Type'] = 'application/json';
    }
    print(headers);
    return headers;
  }
}
