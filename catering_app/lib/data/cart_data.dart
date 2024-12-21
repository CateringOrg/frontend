import 'package:catering_app/data/meal_data.dart';
import 'package:catering_app/interfaces/client_cart.dart';

class CartData implements IClientCartData {
  final List<Meal> _meals = [];

  @override
  void addMealToCart(Meal meal) {
    _meals.add(meal);
  }

  double get totalPrice {
    return _meals.fold(0.0, (sum, meal) => sum + meal.price);
  }

  void removeMeal(String mealId) {
    _meals.removeWhere((meal) => meal.id == mealId);
  }

  void clearCart() {
    _meals.clear();
  }

  List<Meal> get meals => _meals;

  List<String> getMealIds() {
    return _meals.map((meal) => meal.id).toList();
  }
}
