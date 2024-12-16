import 'package:catering_app/data/user_roles.dart';
import 'package:catering_app/interfaces/main_menu_logic.dart';
import 'package:catering_app/interfaces/main_menu_ui.dart';
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
  void onShowClientOffers() {}

  @override
  void onShowClientOrders() {}

  @override
  void onShowClientCart() {}

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
