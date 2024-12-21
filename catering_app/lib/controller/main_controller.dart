import 'package:catering_app/controller/company_offers_logic/show_offers_list_logic.dart';
import 'package:catering_app/view/catering_registration_view.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/view/registration_view.dart';
import 'package:catering_app/view/login_view.dart';
import 'package:catering_app/view/client_offers_list.dart';
import 'package:catering_app/model/catering_model.dart';
import 'package:catering_app/view/main_view.dart';

class MainController extends ChangeNotifier {
  CateringModel model = CateringModel();
  void onCateringSupplierRegistrationClicked(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CateringRegistrationView()),
    );
  }

  void onClientRegistrationClicked(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const RegistrationView()),
    );
  }

  void onLoginClicked(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  void onLogoutClicked(BuildContext context) {
    model.logout();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => MainView(user: model.getLoggedUser())),
    );
  }

  void onShowListOfCompanyOffersClicked(BuildContext context) async {
    final companyOffersLogic = CateringCompanyShowOffersListLogic(context);
    companyOffersLogic.onShowListOfOffersClicked();
  }

  void onShowListOfClientOffersClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ClientOffersListView()),
    );
  }
}
