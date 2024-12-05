import 'package:flutter/cupertino.dart';

abstract class IClientCartUI {
  void navigateBack();
  void showOrderSuccessMessage();
  void showOrderErrorMessage(String message);
}

abstract class IClientCartLogic {
  double getTotalPrice();
  int getTotalCalories();
  void onOrderButtonClicked(BuildContext context);
}
