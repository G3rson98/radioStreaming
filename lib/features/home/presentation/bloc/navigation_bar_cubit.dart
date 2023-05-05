
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/router.dart';

class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit() : super(0);

  void onChangeTab(int index) => emit(index);
  void onPopTab(String route) {
    switch(route){
      case Routes.radio:
        emit(0);
        break ;
      case Routes.announcement:
        emit(1);
        break;
      case Routes.video:
        emit(2);
        break ;
      case Routes.menu:
        emit(3);
        break;
    }
  }
}
