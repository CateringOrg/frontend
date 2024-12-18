import 'package:catering_app/controller/client_cart_controller.dart';
import 'package:catering_app/controller/client_offers_controller.dart';
import 'package:catering_app/data/cart_data.dart';
import 'package:catering_app/data/user_roles.dart';
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
    ClientOffersLogic().showClientOffersPage(context);
  }

  @override
  void onShowClientOrders() {}

  @override
  void onShowClientCart() {
    final cartData = CartData();

    ClientCartUI clientCartUI = ClientCartUI(context, null);

    ClientCartLogic clientCartLogic = ClientCartLogic(clientCartUI, cartData);

    clientCartUI.logic = clientCartLogic;

    clientCartLogic.showClientOffersUI(context);
  }

  @override
  void onShowCateringFirms() {}

  @override
  void onShowManagerOrders() {
    //ManagerOrdersLogic(context).showManagerOrdersPage();
  }

  @override
  void onShowCateringOffers() {}

  @override
  void onShowCateringOrders() {}
}
