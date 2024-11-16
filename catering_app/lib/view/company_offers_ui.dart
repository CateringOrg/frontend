import 'package:flutter/material.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/view/company_offers_form.dart';

class CateringCompanyOffersUI implements ICateringCompanyOffersUI {
  final BuildContext context;

  CateringCompanyOffersUI(this.context);

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
      const SnackBar(content: Text("Posiłek został pomyślnie dodany.")),
    );
  }
}