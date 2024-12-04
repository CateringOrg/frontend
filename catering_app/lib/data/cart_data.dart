import 'meal_data.dart';

class CartData {
  final List<Meal> _meals = [];

  List<Meal> get meals => List.unmodifiable(_meals);

  double get totalPrice {
    return _meals.fold(0.0, (sum, meal) => sum + meal.price);
  }

  void addMeal(Meal meal) {
    _meals.add(meal);
  }

  void removeMeal(String mealId) {
    _meals.removeWhere((meal) => meal.id == mealId);
  }

  void clearCart() {
    _meals.clear();
  }
}
