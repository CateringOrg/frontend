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
  final nameTextController = TextEditingController();
  final addressTextController = TextEditingController();

  @override
  void dispose() {
    nameTextController.dispose();
    addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
            child: FractionallySizedBox(
                widthFactor: 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Zarejestruj firme kateringowa',
                        style: AppTextThemes.headline),
                    const SizedBox(height: 200),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              const Text("Nazwa"),
                              TextField(
                                controller: nameTextController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Firma 123',
                                ),
                              ),
                            ]))
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                              const Text("Adres"),
                              TextField(
                                controller: addressTextController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Pl. Politechniki 1, GG, pokój 133',
                                ),
                              ),
                            ]))
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () =>
                                  widget.controller.onRegisterClicked(context, nameTextController.text, addressTextController.text),
                              child: const Text('Zarejestruj'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () =>
                                widget.controller.onCancelClicked(context),
                            style: AppWidgetsThemes.cancelButtonStyle,
                            child: const Text(
                              'Anuluj',
                              style: AppTextThemes.bodyError,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ],
                ))));
  }
}
