import 'package:catering_app/controller/catering_registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/data/catering_registration_data.dart';
import 'package:catering_app/interfaces/catering_registration.dart';
import 'package:catering_app/assets/themes.dart';

class CateringRegistrationView extends StatefulWidget {
  const CateringRegistrationView({super.key});

  @override
  State<CateringRegistrationView> createState() =>
      _CateringRegistrationViewState();
}

class _CateringRegistrationViewState extends State<CateringRegistrationView> {
  String errorInfo = "";
  late final ICateringCompanyOffersLogic controller;

  final nameTextController = TextEditingController();
  final addressTextController = TextEditingController();

  void setErrorInfo(String info) {
    setState(() {
      errorInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();

    controller = CateringRegistrationLogic();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                errorInfo,
                style: AppTextThemes.bodyError,
                textAlign: TextAlign.center,
              ),
              const Text(
                'Zarejestruj firmę kateringową',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Nazwa"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: nameTextController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Firma 123',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Adres"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: addressTextController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pl. Politechniki 1, GG, pokój 133',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black45,
                  elevation: 5,
                ),
                onPressed: () {
                  controller.onRegisterClicked(
                      context,
                      setErrorInfo,
                      RegisterCateringDTO(
                        name: nameTextController.text,
                        address: addressTextController.text,
                      ));
                },
                child: const Text(
                  'Zarejestruj',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black45,
                  elevation: 5,
                ),
                onPressed: () => controller.onCancelClicked(context),
                child: const Text(
                  'Anuluj',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
