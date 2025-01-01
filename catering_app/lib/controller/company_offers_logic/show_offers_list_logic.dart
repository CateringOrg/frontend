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
    final result = await companyAPI.getListOfMealsByCompany();
    if (result.success) {
      ui.showListOfOffers(result.data);
    } else {
      ui.showErrorMessage(result.error);
    }
  }

  @override
  void onShowUpdateMealFormClicked(String id) async {
    final result = await companyAPI.getMeal(id);
    if (result.success) {
      ui.showEditMealForm(result.data);
    } else {
      ui.showErrorMessage(result.error);
    }
  }
}
