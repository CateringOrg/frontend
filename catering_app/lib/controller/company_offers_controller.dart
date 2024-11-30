import 'package:flutter/material.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/view/company_offers_ui.dart';
import 'package:catering_app/data/add_meal_data.dart';
import 'package:catering_app/model/catering_model.dart';

class CateringCompanyOffersLogic implements ICateringCompanyOffersLogic {
  final ICateringCompanyOffersUI ui;
  final CateringModel model = CateringModel();

  CateringCompanyOffersLogic(BuildContext context) : ui = CateringCompanyOffersUI(context);

  @override
  List<String> validateMealData(AddMealDTO data) {
    final errors = <String>[];

    if (data.description.isEmpty) {
      errors.add("Nazwa nie może być pusta.");
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
  void onSaveDataClicked(AddMealDTO data) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await model.addCompanyMeal(data);

    if (result["success"]) {
      ui.showSuccessMessage();
    } else {
      ui.showErrorMessage(result["message"]);
    }
  }
}