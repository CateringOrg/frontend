import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:catering_app/assets/themes.dart';
import 'package:catering_app/controller/main_controller.dart';
import 'package:catering_app/data/user_data.dart';
import 'package:catering_app/data/user_role.dart';

class MainView extends StatelessWidget {
  final UserDTO user;
  const MainView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context, listen: false);
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
              const Text(
                'Witaj w systemie',
                style: AppTextThemes.headline,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Container(child: () {
                    if (user.role == UserRole.ADMIN) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black45,
                          elevation: 5,
                        ),
                        onPressed: () {
                          mainController
                              .onCateringSupplierRegistrationClicked(context);
                        },
                        child: const Text(
                          'Zarejestruj firmę cateringową',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }()),
                  Container(child: () {
                    if (user.role == UserRole.CLIENT) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black45,
                          elevation: 5,
                        ),
                        onPressed: () {
                          mainController
                              .onShowListOfClientOffersClicked(context);
                        },
                        child: const Text(
                          'Pokaż ofertę',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }()),
                  const SizedBox(height: 20),
                  Container(child: () {
                    if (user.role == UserRole.CATERING_COMPANY) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black45,
                          elevation: 5,
                        ),
                        onPressed: () {
                          mainController
                              .onShowListOfCompanyOffersClicked(context);
                        },
                        child: const Text(
                          'Moje oferty',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }()),
                  const SizedBox(height: 20),
                  Container(child: () {
                    if (user.role == UserRole.NONE) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black45,
                          elevation: 5,
                        ),
                        onPressed: () {
                          mainController.onLoginClicked(context);
                        },
                        child: const Text(
                          'Zaloguj',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }()),
                  const SizedBox(height: 20),
                  Container(child: () {
                    if (user.role != UserRole.NONE) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black45,
                          elevation: 5,
                        ),
                        onPressed: () {
                          mainController.onLogoutClicked(context);
                        },
                        child: const Text(
                          'Wyloguj',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }()),
                ],
              ),
              const SizedBox(height: 50),
              Container(child: () {
                if (user.role == UserRole.NONE) {
                  return Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Nie masz konta? ',
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Zarejestruj się!',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                mainController
                                    .onClientRegistrationClicked(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }()),
            ],
          ),
        ),
      ),
    );
  }
}
