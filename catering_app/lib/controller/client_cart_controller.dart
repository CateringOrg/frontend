import 'package:catering_app/interfaces/client_cart.dart';
import 'package:catering_app/data/cart_data.dart';

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
  void onOrderButtonClicked() async {
    // Zhardcodowane narazie
    const bool isOrderSuccessful = true;

    if (isOrderSuccessful) {
      ui.showOrderSuccessMessage();
    } else {
      ui.showOrderErrorMessage("Wystąpił problem z zamówieniem.");
    }
    ui.navigateBack();
  }
}
