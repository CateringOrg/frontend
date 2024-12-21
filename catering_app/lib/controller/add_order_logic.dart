import 'package:catering_app/data/add_order_data.dart';
import 'package:catering_app/interfaces/client_orders.dart';
import 'package:catering_app/view/client_orders_ui.dart';
import 'package:flutter/material.dart';

import '../model/client_api_proxy.dart';

class ClientAddOrderLogic implements IClientAddOrderLogic {
  final IClientOrderingUI ui;
  final IClientAPI clientAPI = ClientAPIProxy();

  ClientAddOrderLogic(BuildContext context) : ui = ClientOrdersUI(context);

  @override
  void onSaveDataClicked(AddOrderDTO data) async {
    final result = await clientAPI.addOrder(data);

    if (result.success) {
      ui.showClientPaymentView(result.data);
      ui.showSuccessMessage();
    } else {
      ui.showErrorMessage(result.error);
    }
  }
}
