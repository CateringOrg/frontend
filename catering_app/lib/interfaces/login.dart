import 'package:flutter/material.dart';
import 'package:catering_app/data/login_data.dart';

abstract class ILoginLogic {
  void onLoginClicked(
      BuildContext context, void Function(String) setError, LoginDTO data);
  void onCancelClicked(BuildContext context);
}
