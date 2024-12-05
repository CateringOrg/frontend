import 'package:flutter/material.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/view/company_offers_form.dart';

class CateringCompanyOffersUI implements ICateringCompanyOffersUI {
  final BuildContext context;

  CateringCompanyOffersUI(this.context);

  @override
  void navigateBack() {
    Navigator.pop(context);
  }

  @override
  void showMealDataForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MealFormView()),
    );
  }

  @override
  void showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Posiłek został pomyślnie dodany.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void showErrorMessage(String message) {
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