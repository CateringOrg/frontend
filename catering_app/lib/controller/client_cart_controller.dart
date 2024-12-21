import 'package:catering_app/data/meal_data.dart';
import 'package:catering_app/interfaces/client_cart.dart';
import 'package:catering_app/data/cart_data.dart';
import 'package:flutter/material.dart';

class ClientCartLogic implements IClientCartLogic {
  final IClientCartUI ui;
  final CartData cartData;

  ClientCartLogic(this.ui, this.cartData);

  @override
  void addMealToCart(Meal meal) {
    try {
      cartData.addMealToCart(meal);
      ui.showOrderSuccessMessage();
    } catch (e) {
      ui.showOrderErrorMessage(
          "Wystąpił błąd podczas dodawania produktu do koszyka!");
    }
  }

  @override
  double getTotalPrice() {
    return cartData.totalPrice;
  }

  @override
  int getTotalCalories() {
    return 1000;
  }

  @override
  void showClientOffersUI(BuildContext context) {
    ui.onShowClientOrderingUIClicked();
  }

  @override
  void showClientOrderFormView(List<String>? meaIds) {
    ui.onOrderButtonClicked(meaIds);
  }
}
