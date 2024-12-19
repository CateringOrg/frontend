import 'dart:convert';

import 'package:catering_app/data/add_order_data.dart';
import 'package:catering_app/interfaces/client_orders.dart';
import 'package:catering_app/model/catering_model.dart';
import 'package:http/http.dart' as http;

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? error;

  ApiResponse({required this.success, this.data, this.error});
}

class ClientAPIProxy implements IClientAPI {
  final String baseUrl = "http://localhost:8080";
  final CateringModel cateringModel = CateringModel();

  Future<Map<String, dynamic>> _makeApiCall(
      Future<http.Response> Function() httpRequest) async {
    try {
      final response = await httpRequest();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {
          "success": true,
          "responseBody": response.body,
        };
      } else {
        return {
          "success": false,
          "message": "Coś poszło nie tak. Spróbuj ponownie później",
          "responseBody": response.body,
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Nie udało się połączyć z serwerem",
        "responseBody": null,
      };
    }
  }

  @override
  Future<ApiResponse<void>> addOrder(AddOrderDTO order) async {
    final url = Uri.parse("$baseUrl/orders/create");
    final result = await _makeApiCall(() => http.post(url,
        headers: cateringModel.getHeaders(),
        body: jsonEncode({
          "clientLogin": order.clientLogin,
          "deliveryAddress": order.deliveryAddress,
          "deliveryMethod": order.deliveryMethod,
          "mealIds": [order.mealIds],
          "deliveryTime": order.deliveryTime,
        })));
    if (result["success"]) {
      return ApiResponse(success: true);
    } else {
      return ApiResponse(success: false, error: result["message"]);
    }
  }
}
