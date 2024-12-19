import 'package:flutter/material.dart';
import 'package:catering_app/view/main_view.dart';
import 'package:catering_app/data/login_data.dart';
import 'package:catering_app/interfaces/login.dart';
import 'package:catering_app/model/catering_model.dart';
import 'package:catering_app/view/client_offers_list.dart';

class LoginLogic extends ILoginLogic {
  final CateringModel model = CateringModel();

  @override
  void onLoginClicked(BuildContext context, void Function(String) setError,
      LoginDTO data) async {
    final Map<String, dynamic> result = await model.login(data);

    if (result["success"]) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ClientOffersListView()),
      );
    } else {
      setError(result["message"]);
    }
  }

  @override
  void onCancelClicked(BuildContext context) {
    Navigator.of(context).pop();
  }
}
