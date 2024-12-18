import 'package:catering_app/data/add_order_data.dart';
import 'package:flutter/cupertino.dart';

import '../model/client_api_proxy.dart';

abstract class IClientOrderingUI{
  void navigateBack();
  void showSuccessMessage();
  void showErrorMessage(String? message);
  void onClientPaymentClicked();
}

abstract class IClientOrderingLogic {
  void onOrderFormButtonClicked(BuildContext context);
}

abstract class IClientAddOrderLogic{
  void onSaveDataClicked(AddOrderDTO data);
  void showClientPaymentView(BuildContext context);
}

abstract class IClientAPI{
  Future<ApiResponse<void>> addOrder(AddOrderDTO order);
}