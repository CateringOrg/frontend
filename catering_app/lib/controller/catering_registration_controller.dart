import 'package:flutter/material.dart';
import 'package:catering_app/view/main_view.dart';
import 'package:catering_app/view/catering_registration_view.dart';
import 'package:catering_app/data/catering_registration_data.dart';
import 'package:catering_app/interfaces/catering_registration.dart';
import 'package:catering_app/model/catering_model.dart';

class CateringRegistrationLogic extends ICateringCompanyOffersLogic {
  final CateringModel model = CateringModel();

  @override
  void onRegisterClicked(BuildContext context, void Function(String) setError,
      RegisterCateringDTO data) async {
    bool validated = validateMealData(data);
    final Map<String, dynamic> result;
    if (validated) {
      result = await model.registerCateringCompany(data);
    } else {
      result = {"success": false};
    }

    if (result["success"]) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainView()),
      );
    } else {
      setError(
          validated ? result["message"] : "Niepoprawne dane rejestracyjne");
    }
  }

  @override
  bool validateMealData(RegisterCateringDTO data) {
    return data.name != "" && data.address != "" && data.nip != "";
  }

  @override
  void onCancelClicked(BuildContext context) {
    Navigator.of(context).pop();
  }
}
