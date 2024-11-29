import 'package:catering_app/view/catering_registration_view.dart';
import 'package:catering_app/view/client_offers_list.dart';
import 'package:flutter/material.dart';
//import 'package:catering_app/view/client_registration_view.dart';
import 'package:catering_app/controller/company_offers_controller.dart';

class MainController extends ChangeNotifier {
  void onCateringSupplierRegistrationClicked(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CateringRegistrationView()),
    );
  }

  void onClientRegistrationClicked(BuildContext context) {
    /*Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ClientRegistrationView()),
    );*/
  }

  void onLoginClicked(BuildContext context) {
    /* Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ClientRegistrationView()),
    );*/
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ClientOffersListView()),
    );
  }

  void onShowAddMealFormClicked(BuildContext context) {
    final CateringCompanyOffersLogic companyOffersLogic =
        CateringCompanyOffersLogic(context);
    companyOffersLogic.onShowAddMealFormClicked();
  }
}
