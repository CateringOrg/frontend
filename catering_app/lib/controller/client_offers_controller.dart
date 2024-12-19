import 'package:catering_app/interfaces/client_offers.dart';
import 'package:catering_app/interfaces/client_offers_ui.dart';
import 'package:catering_app/model/catering_model.dart';
import 'package:catering_app/data/meal_data.dart';
import 'package:catering_app/view/client_offers_list.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/view/main_view.dart';

class ClientOffersLogic implements IClientOffersLogic {
  final CateringModel model = CateringModel();
  IClientOffersView? view;

  @override
  void onBackClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => MainView(user: model.getLoggedUser())),
    );
  }

  @override
  void showClientOffersPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ClientOffersListView(),
      ),
    );
  }

  @override
  Future<List<Meal>> fetchOffers() async {
    try {
      return await model.getAllMeals();
    } catch (e) {
      throw Exception("Nie udało się pobrać oferty. Problem - ${e.toString()}");
    }
  }
}
