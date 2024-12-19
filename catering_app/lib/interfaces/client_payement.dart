import 'package:flutter/material.dart';
import 'package:catering_app/data/payement_data.dart';

abstract class IClientPayementLogic {
  void onPayClicked(BuildContext context, PayementDTO data);
  void onCancelClicked(BuildContext context);
}
