import 'package:catering_app/controller/main_menu_controller.dart';
import 'package:catering_app/data/user_roles.dart';
import 'package:catering_app/interfaces/main_menu_logic.dart';
import 'package:catering_app/interfaces/main_menu_ui.dart';
import 'package:catering_app/view/catering_registration_view.dart';
import 'package:catering_app/view/client_offers_list.dart';
import 'package:catering_app/view/main_menu.dart';
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

  void onLoginAsClientClicked(BuildContext context) {
    UserRole role = UserRole.Client;
    IMainMenuUI mainMenuUI = MainMenuUI();
    final IMainMenuLogic mainMenuLogic =
        MainMenuLogic(context: context, role: role, mainMenuUI: mainMenuUI);
    mainMenuLogic.showMainMenu();
  }

  void onLoginAsCompanyClicked(BuildContext context) {
    UserRole role = UserRole.CateringCompany;
    IMainMenuUI mainMenuUI = MainMenuUI();
    final IMainMenuLogic mainMenuLogic =
        MainMenuLogic(context: context, role: role, mainMenuUI: mainMenuUI);
    mainMenuLogic.showMainMenu();
  }

  void onLoginAsManagerClicked(BuildContext context) {
    UserRole role = UserRole.Manager;
    IMainMenuUI mainMenuUI = MainMenuUI();
    final IMainMenuLogic mainMenuLogic =
        MainMenuLogic(context: context, role: role, mainMenuUI: mainMenuUI);
    mainMenuLogic.showMainMenu();
  }

  void onShowAddMealFormClicked(BuildContext context) {
    final CateringCompanyOffersLogic companyOffersLogic =
        CateringCompanyOffersLogic(context);
    companyOffersLogic.onShowAddMealFormClicked();
  }
}
