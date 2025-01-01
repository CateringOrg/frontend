import 'package:catering_app/view/company_offers/company_offers_list.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/view/company_offers/company_offers_form.dart';

import '../../data/meal_data.dart';

class CateringCompanyOffersUI implements ICateringCompanyOffersUI {
  final BuildContext context;

  CateringCompanyOffersUI(this.context);

  @override
  void navigateBack() {
    Navigator.pop(context);
  }

  @override
  void showAddMealForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MealFormView()),
    );
  }

  @override
  void showEditMealForm(Meal? meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MealFormView(initialMeal: meal)),
    );
  }

  @override
  void showListOfOffers(List<Meal>? meals) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CateringCompanyOffersListView(meals: meals),
      ),
    );
  }

  @override
  void showSuccessMessage(String? message) {
    final displayMessage = message ?? "Posiłek został pomyślnie dodany.";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          displayMessage,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void showErrorMessage(String? message) {
    final displayMessage =
        message ?? "Coś poszło nie tak. Spróbuj ponownie później";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          displayMessage,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
