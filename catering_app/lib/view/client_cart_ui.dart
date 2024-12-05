import 'package:catering_app/controller/client_cart_controller.dart';
import 'package:catering_app/interfaces/client_cart.dart';
import 'package:catering_app/view/cart_view.dart';
import 'package:catering_app/view/client_place_order_view.dart';
import 'package:flutter/material.dart';

class ClientCartUI implements IClientCartUI {
  final BuildContext context;
  ClientCartLogic? logic;

  String? _message;
  bool _isSuccess = true;

  ClientCartUI(this.context, this.logic);

  void _showMessageOverlay(String message, bool isSuccess) {
    _message = message;
    _isSuccess = isSuccess;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _message!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      _isSuccess
                          ? "lib/assets/cart_success.png"
                          : "lib/assets/error.png",
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void onShowClientOrderingUIClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartView(logic: logic!)),
    );
  }

  @override
  void onOrderButtonClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ClientOrderFormView()),
    );
  }

  @override
  void showOrderSuccessMessage() {
    _showMessageOverlay("Produkt pomyślnie dodany do koszyka!", true);
  }

  @override
  void showOrderErrorMessage(String message) {
    _showMessageOverlay(message, false);
  }
}
