import 'package:catering_app/controller/main_menu_controller.dart';
import 'package:catering_app/data/user_roles.dart';
import 'package:catering_app/interfaces/main_menu_logic.dart';
import 'package:catering_app/interfaces/main_menu_ui.dart';
import 'package:flutter/material.dart';

class MainMenuUI extends StatelessWidget implements IMainMenuUI {
  final UserRole role;
  final IMainMenuLogic logic;

  MainMenuUI({required this.role, required this.logic});

  @override
  void buildMainMenu(UserRole role) {}

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    switch (role) {
      case UserRole.Client:
        buttons = [
          _buildButton('Offers', 'clientOffers'),
          _buildButton('Orders', 'clientOrders'),
          _buildButton('Cart', 'clientCart'),
        ];
        break;
      case UserRole.Manager:
        buttons = [
          _buildButton('Catering Firms', 'cateringFirms'),
          _buildButton('Orders', 'managerOrders'),
        ];
        break;
      case UserRole.CateringCompany:
        buttons = [
          _buildButton('Offers', 'cateringOffers'),
          _buildButton('Orders', 'cateringOrders'),
        ];
        break;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Main Menu - ${role.name}')),
      body: Center(child: Column(children: buttons)),
    );
  }

  Widget _buildButton(String title, String action) {
    return ElevatedButton(
      onPressed: () => logic.onButtonPress(action),
      child: Text(title),
    );
  }
}
