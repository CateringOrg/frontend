import 'package:flutter/material.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/view/company_offers_ui.dart';
import 'package:catering_app/data/add_meal_data.dart';

class CateringCompanyOffersLogic implements ICateringCompanyOffersLogic {
  final ICateringCompanyOffersUI ui;

  CateringCompanyOffersLogic(BuildContext context) : ui = CateringCompanyOffersUI(context);

  @override
  List<String> validateMealData(AddMealDTO data) {
    final errors = <String>[];

    if (data.description.isEmpty) {
      errors.add("Opis nie może być pusty.");
    }
    if (data.price.isEmpty) {
      errors.add("Cena nie może być pusta.");
    } else if (double.tryParse(data.price) == null) {
      errors.add("Cena musi być poprawną liczbą.");
    }

    return errors;
  }

  @override
  void onShowAddMealFormClicked() {
    ui.showMealDataForm();
  }

  @override
  void onSaveDataClicked(AddMealDTO data) {
    // TODO Handle API call
    Future.delayed(Duration(seconds: 1), () {
      ui.showSuccessMessage();
    });
  }
}