import 'package:flutter/material.dart';

import 'package:catering_app/controller/catering_registration_controller.dart';

import 'package:catering_app/view/catering_registration_view.dart';

class MainController {
  const MainController();

  void onCateringSupplierRegistrationClicked(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>  CateringRegistartionView(
            controller: CateringRegistrationController())));
  }

  void onLoginClicked(BuildContext context) {
    // TODO Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginView(controller: LoginController())));
  }
}
