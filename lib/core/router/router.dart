import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/announcement/presentation/bloc/announcement_bloc.dart';
import '../../features/announcement/presentation/pages/announcement_page.dart';
import '../../features/history/presentation/bloc/history_bloc.dart';
import '../../features/home/presentation/bloc/ad/ad_bloc.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/bloc/navigation_bar_cubit.dart';
import '../../features/menu/presentation/pages/menu_page.dart';
import '../../features/radio/presentation/bloc/radio_bloc.dart';
import '../../features/radio/presentation/pages/radio_main.page.dart';
import '../../features/video/presentation/bloc/web_view_bloc.dart';
import '../../features/video/presentation/pages/video_page.dart';
import '../audio/bloc/audio_bloc.dart';

export 'package:go_router/go_router.dart';

part 'routes.dart';

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
                BlocProvider(create: (context) => HistoryBloc(context.read())..add(GetRadioHistory())),
                BlocProvider(create: (context) => AudioBloc(context.read())),
                BlocProvider(create: (context) => NavigationBarCubit()),
              ],
              child: HomePage(child: child),
            );
          },
          routes: [
            _mainRoutesBuilder(const RadioPage(), Routes.radio),
            _mainRoutesBuilder(
                BlocProvider(
                    create: (context) => AnnouncementBloc(context.read())..add(GetAllAnnouncements()),
                    child: const AnnouncementPage()),
                Routes.announcement),

            _mainRoutesBuilder(BlocProvider(
              create: (context) => WebViewBloc()..add(LoadWebView()),
              child: const VideoPage(),
            ), Routes.video),
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
      pageBuilder: (context,state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
      }

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