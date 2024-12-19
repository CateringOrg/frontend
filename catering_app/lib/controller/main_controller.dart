import 'package:catering_app/controller/main_menu_controller.dart';
import 'package:catering_app/data/user_role.dart';
import 'package:catering_app/interfaces/main_menu_logic.dart';
import 'package:catering_app/interfaces/main_menu_ui.dart';
import 'package:catering_app/controller/company_offers_logic/show_offers_list_logic.dart';
import 'package:catering_app/view/catering_registration_view.dart';
import 'package:catering_app/view/main_menu.dart';
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

  void onLoginAsClientClicked(BuildContext context) {
    UserRole role = UserRole.CLIENT;
    IMainMenuUI mainMenuUI = MainMenuUI();
    final IMainMenuLogic mainMenuLogic =
        MainMenuLogic(context: context, role: role, mainMenuUI: mainMenuUI);
    mainMenuLogic.showMainMenu();
  }

  void onLoginAsCompanyClicked(BuildContext context) {
    UserRole role = UserRole.CATERING_COMPANY;
    IMainMenuUI mainMenuUI = MainMenuUI();
    final IMainMenuLogic mainMenuLogic =
        MainMenuLogic(context: context, role: role, mainMenuUI: mainMenuUI);
    mainMenuLogic.showMainMenu();
  }

  void onLoginAsManagerClicked(BuildContext context) {
    UserRole role = UserRole.ADMIN;
    IMainMenuUI mainMenuUI = MainMenuUI();
    final IMainMenuLogic mainMenuLogic =
        MainMenuLogic(context: context, role: role, mainMenuUI: mainMenuUI);
    mainMenuLogic.showMainMenu();
  }

  void onShowListOfCompanyOffersClicked(BuildContext context) {
    final CateringCompanyShowOffersListLogic companyOffersLogic =
        CateringCompanyShowOffersListLogic(context);
    companyOffersLogic.onShowListOfOffersClicked();
  }

  void onShowListOfClientOffersClicked(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ClientOffersListView()),
    );
  }
}
