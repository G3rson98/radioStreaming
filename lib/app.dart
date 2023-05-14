import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/presentation/theme/theme_data.dart';
import 'core/router/router.dart';
import 'dependencies.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: MaterialApp.router(
        title: 'Luz de esperanza',
        debugShowCheckedModeBanner: false,
        theme: CustomThemeData.themeData,
        routeInformationProvider: CustomRouter.router.routeInformationProvider,
        routeInformationParser: CustomRouter.router.routeInformationParser,
        routerDelegate: CustomRouter.router.routerDelegate,

      ),
    );
  }
}