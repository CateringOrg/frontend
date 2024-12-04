import 'package:catering_app/interfaces/client_cart.dart';
import 'package:flutter/material.dart';

class ClientCartUI implements IClientCartUI {
  final BuildContext context;

  ClientCartUI(this.context);

  @override
  void navigateBack() {
    Navigator.pop(context);
  }

  @override
  void showOrderSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Zamówienie złożone pomyślnie.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void showOrderErrorMessage(String message) {
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
}
