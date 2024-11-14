import 'package:flutter/material.dart';

import 'package:catering_app/view/main_view.dart';

import 'package:catering_app/controller/main_controller.dart';

import 'package:catering_app/assets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final MainController mainController = const MainController();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catering app',
      theme: AppThemes.light,
      darkTheme: AppThemes.light,
      home: MainView(controller: mainController),
    );
  }
}
