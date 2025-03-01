import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:catering_app/view/main_view.dart';
import 'package:catering_app/controller/main_controller.dart';
import 'package:catering_app/assets/themes.dart';

import 'package:catering_app/data/user_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catering app',
      theme: AppThemes.light,
      darkTheme: AppThemes.light,
      home: MainView(user: UserDTO.empty()),
    );
  }
}
