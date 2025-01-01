import 'package:catering_app/model/company_api_proxy.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/view/company_offers/company_offers_ui.dart';
import 'package:catering_app/data/add_meal_data.dart';

class CateringCompanyAddMealLogic implements ICateringCompanyAddMealLogic {
  final ICateringCompanyOffersUI ui;
  final ICateringCompanyAPI companyAPI = CateringCompanyAPIProxy();

  CateringCompanyAddMealLogic(BuildContext context)
      : ui = CateringCompanyOffersUI(context);

  @override
  void onSaveDataClicked(AddMealDTO data) async {
    final result = await companyAPI.addMeal(data);

    if (result.success) {
      ui.showSuccessMessage("Posiłek został dodany pomyślnie.");
      ui.navigateBack();
    } else {
      ui.showErrorMessage(result.error);
    }
  }
}
