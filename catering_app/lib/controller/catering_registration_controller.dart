import 'package:flutter/material.dart';
import 'package:catering_app/view/main_view.dart';
import 'package:catering_app/data/catering_registration_data.dart';
import 'package:catering_app/interfaces/catering_registration.dart';
import 'package:catering_app/model/catering_model.dart';

class CateringRegistrationLogic extends ICateringRegistrationLogic {
  final CateringModel model = CateringModel();

  @override
  void onRegisterClicked(BuildContext context, void Function(String) setError,
      RegisterCateringDTO data) async {
    final Map<String, dynamic> result =
        await model.registerCateringCompany(data);

    if (result["success"]) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => MainView(user: model.getLoggedUser())),
      );
    } else {
      setError(result["message"]);
    }
  }

  @override
  void onCancelClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => MainView(user: model.getLoggedUser())),
    );
  }
}
