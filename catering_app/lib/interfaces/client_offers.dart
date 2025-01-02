import 'package:catering_app/data/meal_data.dart';
import 'package:flutter/material.dart';

abstract class IClientOffersLogic {
  void onBackClicked(BuildContext context);
  void showClientOffersPage(BuildContext context);
  Future<List<Meal>> fetchOffers();
}
