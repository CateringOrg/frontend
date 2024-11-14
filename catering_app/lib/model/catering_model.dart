import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:catering_app/model/catering_model.dart'

// TODO ten api kontroler jest do pierdololnego piwa
// pysznego złotego napoju z chmielu

class CateringModel {
  final String baseUrl = "TODO";
  // final String? authToken = Auth.instance.accessToken; TODO are we using auth tokens?

  Future<List<Beer>> getAllBeers() async {
    return _getBeers('$baseUrl/beers');
  }

  Future<Beer> getBeerById(int beerId) async {
    return _getBeer('$baseUrl/beers/$beerId');
  }

  Future<List<Beer>> getBeersByType(int typeId) async {
    return _getBeers('$baseUrl/beers/type/$typeId');
  }

  Future<List<Beer>> searchBeers(String query) async {
    Uri uri = Uri.parse('$baseUrl/beers/search?name=$query');
    return _getBeers(uri.toString());
  }

  Future<List<Beer>> searchScannedBeers(String query) async {
    Uri uri = Uri.parse('$baseUrl/beers/search/tags?name=$query');
    return _getBeers(uri.toString());
  }

  Future<Beer> getRandomBeer() async {
    return _getBeer('$baseUrl/beers/random/get');
  }

  Future<List<Beer>> getBeersByProducer(int producerId) async {
    return _getBeers('$baseUrl/beers/producer/$producerId');
  }

  Future<List<Beer>> getFavoriteBeers() async {
    return _getBeers('$baseUrl/beers/$userId/favorite');
  }

  Future<bool> checkIfBeerIsLiked(int beerId) async {
    Uri uri = Uri.parse('$baseUrl/beers/$beerId/isLikedByUser?userId=$userId');
    print("GET $uri");
    final response = await http.get(uri, headers: _headers());
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    bool isLiked = jsonDecode(response.body);
    return isLiked;
  }

  Future<http.Response> createBeer(Map<String, dynamic> beerData) async {
    Uri uri = Uri.parse('$baseUrl/beers');
    return _postJson(uri, beerData);
  }

  Future<http.Response> updateBeer(
      int beerId, Map<String, dynamic> beerData) async {
    Uri uri = Uri.parse('$baseUrl/beers/$beerId');
    return _putJson(uri, beerData);
  }

  Future<http.Response> deleteBeer(int beerId) async {
    Uri uri = Uri.parse('$baseUrl/beers/$beerId');
    return _delete(uri);
  }

  Future<http.Response> favoriteBeer(int beerId) async {
    Uri uri = Uri.parse('$baseUrl/beers/$beerId/favorite');
    return _postJson(uri, {});
  }

  Future<http.Response> favoriteBeerDelete(int beerId) async {
    Uri uri = Uri.parse('$baseUrl/beers/$beerId/favorite');
    return _delete(uri);
  }

  Future<List<Beer>> _getBeers(String url) async {
    Uri uri = Uri.parse(url);
    print("GET $uri");
    final response = await http.get(uri, headers: _headersForAll());
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      List<dynamic> beerJsonList = jsonDecode(response.body);
      return beerJsonList.map((json) => Beer.fromJson(json)).toList();
    } else {
      throw Exception(
          'Failed to load beers: ${response.statusCode}. Response: ${response.body}');
    }
  }

  Future<Beer> _getBeer(String url) async {
    Uri uri = Uri.parse(url);
    print("GET $uri");
    final response = await http.get(uri, headers: _headersForAll());
    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      return Beer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to load beer: ${response.statusCode}. Response: ${response.body}');
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
          'Failed to create beer: ${response.statusCode}. Response: ${response.body}');
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
          'Failed to update beer: ${response.statusCode}. Response: ${response.body}');
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
          'Failed to delete beer: ${response.statusCode}. Response: ${response.body}');
    }
    return response;
  }

  Map<String, String> _headers({bool contentType = false}) {
    final headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $authToken',
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
