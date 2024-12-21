import 'package:catering_app/data/meal_data.dart';
import 'package:flutter/cupertino.dart';

abstract class IClientCartUI {
  void onShowClientOrderingUIClicked();
  void onOrderButtonClicked(List<String>? mealIds);
  void showOrderSuccessMessage();
  void showOrderErrorMessage(String message);
}

abstract class IClientCartLogic {
  void addMealToCart(Meal meal);
  double getTotalPrice();
  int getTotalCalories();
  void showClientOffersUI(BuildContext context);
  void showClientOrderFormView(List<String>? mealIds);
}

abstract class IClientCartData {
  void addMealToCart(Meal meal);
}
