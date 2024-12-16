import 'package:catering_app/data/user_roles.dart';
import 'package:catering_app/interfaces/main_menu_logic.dart';
import 'package:catering_app/interfaces/main_menu_ui.dart';
import 'package:flutter/material.dart';

class MainMenuUI implements IMainMenuUI {
  @override
  Widget buildMainMenuUI(
      BuildContext context, IMainMenuLogic logic, UserRole role) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu główne - ${role.name}')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (role == UserRole.Client) ...[
            _buildLargeButton('Wszystkie oferty', logic.onShowClientOffers),
            _buildLargeButton('Zamówienia', logic.onShowClientOrders),
            _buildLargeButton('Koszyk', logic.onShowClientCart),
          ] else if (role == UserRole.Manager) ...[
            _buildLargeButton('Firmy kateringowe', logic.onShowCateringFirms),
            _buildLargeButton('Zamówienia', logic.onShowManagerOrders),
          ] else if (role == UserRole.CateringCompany) ...[
            _buildLargeButton('Oferty', logic.onShowCateringOffers),
            _buildLargeButton('Zamówienia', logic.onShowCateringOrders),
          ]
        ]),
      ),
    );
  }

  Widget _buildLargeButton(String title, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 250,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
