import 'package:flutter/material.dart';
import 'core/presentation/theme/theme_data.dart';
import 'features/radio/presentation/pages/radio_main.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.themeData,
      home: const RadioPage(),
    );
  }
}