import 'package:flutter/material.dart';
import 'package:catering_app/view/main_view.dart';
import 'package:catering_app/model/catering_model.dart';
import 'package:catering_app/interfaces/client_payement.dart';
import 'package:catering_app/data/payement_data.dart';

class ClientPayementLogic extends IClientPayementLogic {
  final CateringModel model = CateringModel();

  @override
  void onPayClicked(BuildContext context, PayementDTO data) async {
    final Map<String, dynamic> result = await model.payForOrder(data);

    if (result["success"]) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => MainView(
                  user: model.getLoggedUser(),
                )),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Pomyślnie opłacono zamówienie!"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result["message"]),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void onCancelClicked(BuildContext context) {
    Navigator.of(context).pop();
  }
}
