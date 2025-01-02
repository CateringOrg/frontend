import 'package:catering_app/controller/client_cart_controller.dart';
import 'package:catering_app/controller/client_offers_controller.dart';
import 'package:catering_app/controller/company_offers_logic/show_offers_list_logic.dart';
import 'package:catering_app/data/cart_data.dart';
import 'package:catering_app/data/user_role.dart';
import 'package:catering_app/interfaces/client_offers.dart';
import 'package:catering_app/interfaces/company_offers.dart';
import 'package:catering_app/interfaces/main_menu_logic.dart';
import 'package:catering_app/interfaces/main_menu_ui.dart';
import 'package:catering_app/view/client_cart_ui.dart';
import 'package:flutter/material.dart';

class MainMenuLogic implements IMainMenuLogic {
  final BuildContext context;
  final UserRole role;
  final IMainMenuUI mainMenuUI;

  MainMenuLogic(
      {required this.context, required this.role, required this.mainMenuUI});

  @override
  void showMainMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => mainMenuUI.buildMainMenuUI(context, this, role),
      ),
    );
  }

  @override
  void onShowClientOffers() {
    final IClientOffersLogic clientOffersLogic = ClientOffersLogic();
    clientOffersLogic.showClientOffersPage(context);
  }

  @override
  void onShowClientOrders() {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const OrderListView(),
    ),
  );
  }

  @override
  void onShowClientCart() {
    final cartData = CartData();

    ClientCartUI clientCartUI = ClientCartUI(context, null);

    ClientCartLogic clientCartLogic = ClientCartLogic(clientCartUI, cartData);

    clientCartUI.logic = clientCartLogic;

    clientCartLogic.showClientOffersUI(context);
  }

  @override
  void onShowCateringFirms() {
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const CateringCompanyListView(),
    ),
  );
  }

  @override
  void onShowManagerOrders() {}

  @override
  void onShowCateringOffers() {
    final ICateringCompanyShowOffersListLogic companyOffersLogic =
        CateringCompanyShowOffersListLogic(context);
    companyOffersLogic.onShowListOfOffersClicked();
  }

  @override
  void onShowCateringOrders() {}
}
