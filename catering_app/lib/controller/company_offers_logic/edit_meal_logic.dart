import 'package:catering_app/model/company_api_proxy.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/view/company_offers/company_offers_ui.dart';
import 'package:catering_app/data/add_meal_data.dart';

class CateringCompanyEditMealLogic implements ICateringCompanyEditMealLogic {
  final ICateringCompanyOffersUI ui;
  final ICateringCompanyAPI companyAPI = CateringCompanyAPIProxy();

  CateringCompanyEditMealLogic(BuildContext context)
      : ui = CateringCompanyOffersUI(context);

  @override
  void onSaveDataClicked(String mealId, AddMealDTO data) async {
    final result = await companyAPI.updateMeal(mealId, data);
    if (result.success) {
      ui.showSuccessMessage("Posiłek został zaktualizowany pomyślnie.");
      final mealsResult = await companyAPI.getListOfMealsByCompany();
      if (!mealsResult.success) {
        ui.showErrorMessage(result.error);
        return;
      }
      ui.showListOfOffers(mealsResult.data);
    } else {
      ui.showErrorMessage(result.error);
    }
  }
}
