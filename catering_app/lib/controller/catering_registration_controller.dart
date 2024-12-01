import 'package:flutter/material.dart';
import 'package:catering_app/view/main_view.dart';

class CateringRegistrationController extends ChangeNotifier {
  void onRegisterClicked(BuildContext context, String name, String address) {
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainView()),
    );
  }


  void onCancelClicked(BuildContext context) {
    Navigator.of(context).pop();
  }
}
