import 'package:flutter/material.dart';
import 'package:catering_app/view/main_view.dart';
import 'package:catering_app/data/registration_data.dart';
import 'package:catering_app/interfaces/registration.dart';
import 'package:catering_app/model/catering_model.dart';

class RegistrationLogic extends IRegistrationLogic {
  final CateringModel model = CateringModel();

  @override
  void onRegisterClicked(BuildContext context, void Function(String) setError,
      RegistrationDTO data) async {
    final Map<String, dynamic> result = await model.register(data);

    if (result["success"]) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainView()),
      );
    } else {
      setError(result["message"]);
    }
  }

  @override
  void onCancelClicked(BuildContext context) {
    Navigator.of(context).pop();
  }
}
