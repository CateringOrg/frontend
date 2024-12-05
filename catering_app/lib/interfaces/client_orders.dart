import 'package:flutter/cupertino.dart';

abstract class IClientOrderingUI{
  void navigateBack();
  void showOrderFormSuccessMessage();
  void showOrderFormErrorMessage(String message);
}

abstract class IClientOrderingLogic {
  void onOrderFormButtonClicked(BuildContext context);
}