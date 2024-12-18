
import 'package:catering_app/controller/add_order_logic.dart';
import 'package:catering_app/interfaces/client_orders.dart';
import 'package:catering_app/view/client_payment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientOrdersUI implements IClientOrderingUI {
  final BuildContext context;

  ClientOrdersUI(this.context);

  @override
  void navigateBack() {
    Navigator.pop(context);
  }

  @override
  void showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Zamówienie zostało pomyślnie złożone.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void showErrorMessage(String? message) {
    if (message == null || message.isEmpty) {
      message = "Coś poszło nie tak. Spróbuj ponownie później";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void onClientPaymentClicked(){
    Navigator.push(
      context,
        MaterialPageRoute(builder: (context) => ClientPaymentView())
    );
  }
}