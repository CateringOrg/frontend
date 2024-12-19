import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:catering_app/data/add_order_data.dart';
import 'package:http/http.dart' as http;
import 'package:catering_app/data/meal_data.dart';
import 'package:catering_app/data/add_meal_data.dart';
import 'package:catering_app/data/catering_registration_data.dart';
import 'package:catering_app/data/registration_data.dart';
import 'package:catering_app/data/login_data.dart';
import 'package:catering_app/data/user_role.dart';
import 'package:catering_app/data/user_data.dart';

class CateringModel {
  final String baseUrl = "http://localhost:8080";
  String? authToken = '';
  UserRole? role = UserRole.NONE;
  String? username = '';

  Future<Map<String, dynamic>> register(
      RegistrationDTO registrationData) async {
    try {
      final url = Uri.parse("$baseUrl/auth/register");
      final response = await http.post(
        url,
        headers: _headers(contentType: true),
        body: jsonEncode({
          "login": registrationData.username,
          "password": registrationData.password,
        }),
      );
      if (_responseOK(response)) {
        return {"success": true};
      } else {
        final errorBody = jsonDecode(response.body);
        return {
          "success": false,
          "message": errorBody['message'] ?? 'Nieznany bląd. Spróbuj później.'
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Nie udało się połączyć z serwerem."
      };
    }
  }

  @override
  Future<Map<String, dynamic>> login(LoginDTO loginData) async {
    try {
      final url = Uri.parse("$baseUrl/auth/login");
      final response = await http.post(
        url,
        headers: _headers(contentType: true),
        body: jsonEncode({
          "login": loginData.username,
          "password": loginData.password,
        }),
      );
      if (_responseOK(response)) {
        authToken = jsonDecode(response.body)['token'];
        Map<String, dynamic> jwt_decoded = parseJwt(authToken!);
        username = jwt_decoded['sub'];
        role = userRoleMap[jwt_decoded['role']];

        // Zapisanie do cookies
        saveToCookies('authToken', authToken!);
        saveToCookies('username', username!);
        saveToCookies('role', userRoleToStringMap[role]!);

        print("Logged as $username ! Role: $role Token: $authToken");
        return {"success": true};
      } else {
        final errorBody = jsonDecode(response.body);
        return {
          "success": false,
          "message": errorBody['message'] ?? 'Nieznany błąd. Spróbuj później.'
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Nie udało się połączyć z serwerem."
      };
    }
  }

  void logout() {
    saveToCookies('authToken', '');
    saveToCookies('username', '');
    saveToCookies('role', '');
  }

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

      if (_responseOK(response)) {
        List<dynamic> mealJsonList = jsonDecode(response.body);

        return mealJsonList.map((json) {
          final List<dynamic> photoUrls = json['photoUrls'] ?? [];
          final String firstPhotoUrl = photoUrls.isNotEmpty
              ? photoUrls[0] as String
              : 'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg';

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
        headers: _headersForAll(),
        body: jsonEncode({
          "mealId": mealId,
          "userId": userId,
        }),
      );
      if (_responseOK(response)) {
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

  Future<Map<String, dynamic>> registerCateringCompany(
      RegisterCateringDTO addCateringCompany) async {
    try {
      final url = Uri.parse("$baseUrl/catering-companies");
      final response = await http.post(
        url,
        headers: _headersForAll(contentType: true),
        body: jsonEncode({
          // "id": '12fcc746-b380-4f0b-a34c-6b110a615a94',
          "address": addCateringCompany.address,
          "name": addCateringCompany.name,
          "nip": addCateringCompany.nip,
        }),
      );
      if (_responseOK(response) || response.statusCode == 204) {
        return {"success": true};
      } else {
        final errorBody = jsonDecode(response.body);
        print(errorBody);
        return {
          "success": false,
          "message": errorBody['errors'] ?? 'Zaszedł bląd. Spróbuj później.'
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
      const cateringCompanyId = '12fcc746-b380-4f0b-a34c-6b110a615a94';
      final url = Uri.parse("$baseUrl/offers/$cateringCompanyId/meals");
      final response = await http.post(
        url,
        headers: _headersForAll(),
        body: jsonEncode({
          "description": addMealData.description,
          "price": double.tryParse(addMealData.price),
          "photoUrls": [addMealData.photoUrl],
        }),
      );
      if (_responseOK(response) || response.statusCode == 204) {
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

  Future<Map<String, dynamic>> addOrder(AddOrderDTO addOrderData) async {
    try {
      final url = Uri.parse("$baseUrl/orders/create");
      final response = await http.post(
        url,
        headers: _headersForAll(),
        body: jsonEncode({
          "clientLogin": addOrderData.clientLogin,
          "deliveryAddress": addOrderData.deliveryAddress,
          "deliveryMethod": addOrderData.deliveryMethod,
          "mealIds": [addOrderData.mealIds],
          "deliveryTime": addOrderData.deliveryTime,
        }),
      );
      if (_responseOK(response) || response.statusCode == 204) {
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
    final response = await http.get(uri, headers: _headersForAll());
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
    if (_responseOK(response)) {
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
    if (_responseOK(response)) {
      return Meal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load meal: ${response.statusCode}. Response: ${response.body}');
    }
  }

  Future<http.Response> _postJson(Uri uri, Map<String, dynamic> data) async {
    print("POST $uri with data: $data");
    final response =
        await http.post(uri, headers: _headersForAll(), body: jsonEncode(data));
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
    final response =
        await http.put(uri, headers: _headersForAll(), body: jsonEncode(data));
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
    final response = await http.delete(uri, headers: _headersForAll());
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
    authToken = readFromCookies('authToken');
    username = readFromCookies('username');
    role = userRoleMap[readFromCookies('role') ?? ""] ?? UserRole.NONE;

    print("Token from cookies: $authToken");

    final String authBearer = 'Bearer $authToken';
    final headers = {
      'accept': 'application/json',
      'Authorization': authBearer,
      'Access-Control-Allow-Headers': 'Authorization'
    };
    if (contentType) {
      headers['Content-Type'] = 'application/json';
    }
    print(headers);
    return headers;
  }

  Map<String, String> getHeaders({bool contentType = false}) {
    return _headersForAll(contentType: contentType);
  }

  bool _responseOK(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  void saveToCookies(String key, String value) {
    html.document.cookie = "$key=$value; path=/;";
  }

  String? readFromCookies(String key) {
    final cookies = html.document.cookie?.split("; ") ?? [];
    for (final cookie in cookies) {
      final parts = cookie.split("=");
      if (parts[0] == key) {
        return parts[1];
      }
    }
    return null;
  }

  UserDTO getLoggedUser() {
    String username = readFromCookies('username') ?? "";
    String authToken = readFromCookies('authToken') ?? "";
    UserRole role = userRoleMap[readFromCookies('role') ?? ""] ?? UserRole.NONE;

    return UserDTO(username: username, token: authToken, role: role);
  }
}
