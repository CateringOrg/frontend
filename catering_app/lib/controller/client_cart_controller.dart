import 'package:catering_app/interfaces/client_cart.dart';
import 'package:catering_app/data/cart_data.dart';
import 'package:catering_app/view/client_place_order_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientCartLogic implements IClientCartLogic {
  final IClientCartUI ui;
  final CartData cartData;

  ClientCartLogic(this.ui, this.cartData);

  @override
  double getTotalPrice() {
    return cartData.totalPrice;
  }

  @override
  int getTotalCalories() {
    return 1000;
  }

  @override
  void onOrderButtonClicked(BuildContext context) async {
    // Zhardcodowane narazie
    /*const bool isOrderSuccessful = true;

    if (isOrderSuccessful) {
      ui.showOrderSuccessMessage();
    } else {
      ui.showOrderErrorMessage("Wystąpił problem z zamówieniem.");
    }
    ui.navigateBack();*/

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ClientOrderFormView()),
    );
  }
}
