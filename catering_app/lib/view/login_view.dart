import 'package:catering_app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/data/login_data.dart';
import 'package:catering_app/interfaces/login.dart';
import 'package:catering_app/assets/themes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String errorInfo = "";
  late final ILoginLogic controller;

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void setErrorInfo(String info) {
    setState(() {
      errorInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();

    controller = LoginLogic();
  }

  @override
  void dispose() {
    usernameTextController.dispose();
    passwordTextController.dispose();
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
                'Zaloguj się',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Nazwa użytkownika"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: usernameTextController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'użytkownik123',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Hasło"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: passwordTextController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '********',
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
                  controller.onLoginClicked(
                      context,
                      setErrorInfo,
                      LoginDTO(
                          username: usernameTextController.text,
                          password: passwordTextController.text));
                },
                child: const Text(
                  'Zaloguj',
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
