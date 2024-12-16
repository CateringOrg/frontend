import 'package:catering_app/data/user_roles.dart';
import 'package:catering_app/interfaces/main_menu_logic.dart';
import 'package:catering_app/view/main_menu.dart';
import 'package:flutter/material.dart';

class MainMenuLogic implements IMainMenuLogic {
  final BuildContext context;
  final UserRole role;

  MainMenuLogic(this.context, this.role);

  @override
  void showMainMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainMenuUI(role: role, logic: this),
      ),
    );
  }

  @override
  void onButtonPress(String action) {
    if (action == 'managerOrders') {
      //ManagerOrdersLogic(context).showManagerOrdersPage();
    }
    //other
  }
}
