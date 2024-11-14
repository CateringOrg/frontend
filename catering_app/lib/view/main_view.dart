import 'package:flutter/material.dart';

import 'package:catering_app/assets/themes.dart';

import 'package:catering_app/controller/main_controller.dart';

class MainView extends StatefulWidget {
  final MainController controller;

  const MainView({super.key, required this.controller});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FractionallySizedBox(
            widthFactor: 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Witaj w systemie', style: AppTextThemes.headline),
                const SizedBox(height: 200),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            widget.controller
                                .onCateringSupplierRegistrationClicked(context);
                          },
                          child: const Text('Zarejestruj firme cateringowa'),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(children: <Widget>[
                  Expanded(
                      child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.controller.onLoginClicked(context);
                      },
                      child: const Text('Zaloguj'),
                    ),
                  ))
                ])
              ],
            )));
  }
}
