import 'package:catering_app/data/meal_data.dart';
import 'package:flutter/material.dart';

abstract class IClientOffersLogic {
  void showClientOffersPage(BuildContext context);
  Future<List<Meal>> fetchOffers();
  Future<Map<String, dynamic>> addMealToCart(String mealId, String userId);
}
