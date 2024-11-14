import 'package:flutter/material.dart';

import 'package:catering_app/assets/themes.dart';

import 'package:catering_app/controller/catering_registration_controller.dart';

class CateringRegistartionView extends StatefulWidget {
  final CateringRegistrationController controller;

  const CateringRegistartionView({super.key, required this.controller});

  @override
  State<CateringRegistartionView> createState() =>
      _CateringRegistartionViewState();
}

class _CateringRegistartionViewState extends State<CateringRegistartionView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FractionallySizedBox(
            widthFactor: 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Witaj w systemie', style: AppTextThemes.headline),
                const SizedBox(height: 200),
                const Row(
                  children: <Widget>[Expanded(child: Text("COS"))],
                ),
                const SizedBox(height: 30),
                const Row(
                  children: <Widget>[Expanded(child: Text("COS"))],
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ElevatedButton(
                      onPressed:() => widget.controller.onRegisterClicked(context),
                      child: const Text("Zarejestruj")),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () => widget.controller.onRegisterClicked(context),
                      child: const Text("Anuluj")),
                )
              ],
            )));
  }
}
