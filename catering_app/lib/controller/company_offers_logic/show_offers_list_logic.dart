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
    // final result = await companyAPI
    //     .getListOfMealsByCompanyId('12fcc746-b380-4f0b-a34c-6b110a615a94');
    // if (result.success) {
    //   ui.showListOfOffers(result.data);
    // } else {
    //   ui.showErrorMessage(result.error);
    // }

    List<Meal> dummyMeals = [
      Meal(
        id: "1",
        name: "Spaghetti Carbonara",
        description: "makaron z sosem",
        price: 19.99,
        photoUrls: "",
      ),
      Meal(
        id: "2",
        name: "Grilled Chicken Salad",
        description: "Grilled Chicken Salad",
        price: 15.49,
        photoUrls: "",
      ),
      Meal(
        id: "3",
        name: "Beef Steak with Vegetables",
        description: "Beef Steak with Vegetables",
        price: 25.99,
        photoUrls: "",
      ),
      Meal(
        id: "4",
        name: "Margherita Pizza",
        description: "Margherita Pizza",
        price: 12.99,
        photoUrls: "",
      ),
      Meal(
        id: "5",
        name: "Sushi Platter",
        description: "Sushi Platter",
        price: 29.99,
        photoUrls: "",
      ),
    ];
    ui.showListOfOffers(dummyMeals);
  }

  @override
  void onShowUpdateMealFormClicked(String id) async {
    // final result = await companyAPI.getMeal(id);
    // if (result.success) {
    //   ui.showEditMealForm(result.data);
    // } else {
    //   ui.showErrorMessage(result.error);
    // }

    Meal meal = Meal(
      id: "5",
      name: "Sushi Platter",
      description: "Sushi Platter",
      price: 29.99,
      photoUrls: "",
    );
    ui.showEditMealForm(meal);
  }
}
