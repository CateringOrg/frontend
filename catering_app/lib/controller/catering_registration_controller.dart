import 'package:flutter/material.dart';

import 'package:catering_app/controller/main_controller.dart';

import 'package:catering_app/view/catering_registration_view.dart';
import 'package:catering_app/view/main_view.dart';

class CateringRegistrationController {
  const CateringRegistrationController();

  void onRegisterClicked(BuildContext context, String name, String address) {
    // TODO Navigator.of(context).push(MaterialPageRoute(builder: (context) => CateringRegistartionView(controller: this)));
  }

  void onCancelClicked(BuildContext context) {
        Navigator.of(context).pop();

  }
}
