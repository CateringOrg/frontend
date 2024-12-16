import 'package:catering_app/data/user_roles.dart';
import 'package:catering_app/interfaces/main_menu_logic.dart';
import 'package:flutter/material.dart';

abstract class IMainMenuUI {
  Widget buildMainMenuUI(
      BuildContext context, IMainMenuLogic logic, UserRole role);
}
