
import 'package:catering_app/interfaces/client_orders.dart';
import 'package:flutter/cupertino.dart';

//nie ma order po stronie BE
class ClientOrderingLogic implements IClientOrderingLogic{
  final IClientOrderingLogic logic;
  ClientOrderingLogic(this.logic);

  @override
  void onOrderFormButtonClicked(BuildContext context) async{
  }
}