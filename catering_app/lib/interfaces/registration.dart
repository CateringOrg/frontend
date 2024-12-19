import 'package:flutter/material.dart';
import 'package:catering_app/data/registration_data.dart';

abstract class IRegistrationLogic {
  void onRegisterClicked(BuildContext context, void Function(String) setError,
      RegistrationDTO data);
  void onCancelClicked(BuildContext context);
}
