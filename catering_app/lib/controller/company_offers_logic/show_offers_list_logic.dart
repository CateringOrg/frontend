import 'package:catering_app/data/meal_data.dart';
import 'package:catering_app/model/company_api_proxy.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/view/company_offers/company_offers_ui.dart';

class CateringCompanyShowOffersListLogic
    implements ICateringCompanyShowOffersListLogic {
  final ICateringCompanyOffersUI ui;
  final ICateringCompanyAPI companyAPI = CateringCompanyAPIProxy();

  CateringCompanyShowOffersListLogic(BuildContext context)
      : ui = CateringCompanyOffersUI(context);

  @override
  void onShowAddMealFormClicked() {
    ui.showAddMealForm();
  }

  @override
  void onShowListOfOffersClicked() async {
    final result = await companyAPI
        .getListOfMealsByCompanyId('12fcc746-b380-4f0b-a34c-6b110a615a94');
    if (result.success) {
      ui.showListOfOffers(result.data);
    } else {
      ui.showErrorMessage(result.error);
    }
  }

  @override
  void onShowUpdateMealFormClicked(String id) async {
    Meal meal = Meal(
      id: id,
      name: "Sushi Platter",
      description: "Sushi Platter",
      price: 29.99,
      photoUrls: "https://www.feastingathome.com/wp-content/uploads/2024/01/ahi-poke-5.jpg",
    );
    ui.showEditMealForm(meal);
  }
}
