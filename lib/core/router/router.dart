import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/bloc/navigation_bar_cubit.dart';
import '../../features/menu/presentation/pages/menu_page.dart';
import '../../features/radio/presentation/bloc/radio_bloc.dart';
import '../../features/radio/presentation/pages/radio_main.page.dart';
import 'routes.dart';

class CustomRouter{
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
      initialLocation: Routes.radio,
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => RadioBloc(context.read(),context.read())..add(InitRadio())),
                BlocProvider(create: (context) => NavigationBarCubit())

              ],
              child: HomePage(child: child),
            );
          },
          routes: [
            _mainRoutesBuilder(const RadioPage(), Routes.radio),
            _mainRoutesBuilder(const MenuPage(), Routes.menu),
          ]
        )



      ],
      errorPageBuilder: (context,state) => MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(child: Text(state.error.toString())),
          )
      )

  );


  static GoRoute _mainRoutesBuilder(Widget child,String path,{String? name}) => GoRoute(
      path: path,
      name: name,
      pageBuilder: (context,state) => CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      )

  );

  static GoRoute _routeBuilder(Widget child,String path,{String? name}) => GoRoute(
      path: path,
      name: name,
      pageBuilder: (context,state) {
        return MaterialPage(
          key: state.pageKey,
          child: child
      );
      }
  );

}