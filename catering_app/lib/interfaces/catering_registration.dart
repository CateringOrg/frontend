import 'package:flutter/material.dart';
import 'package:catering_app/data/catering_registration_data.dart';

abstract class ICateringCompanyOffersLogic {
  void onRegisterClicked(BuildContext context, void Function(String) setError,
      RegisterCateringDTO data);
  bool validateMealData(RegisterCateringDTO data);
  void onCancelClicked(BuildContext context);
}
