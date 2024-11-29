import 'package:catering_app/data/meal_data.dart';

abstract class IClientOffersLogic {
  Future<List<Meal>> fetchOffers();
  Future<Map<String, dynamic>> addMealToCart(String mealId, String userId);
}
