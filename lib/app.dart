import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/presentation/theme/theme_data.dart';
import 'dependencies.dart';
import 'features/menu/presentation/bloc/navigation_bar_cubit.dart';
import 'features/radio/presentation/pages/radio_main.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: MaterialApp(
        title: 'Luz de esperanza',
        debugShowCheckedModeBanner: false,
        theme: CustomThemeData.themeData,
        home: BlocProvider(
          create: (_) => NavigationBarCubit(),
          child: const RadioPage()
        ),
      ),
    );
  }
}