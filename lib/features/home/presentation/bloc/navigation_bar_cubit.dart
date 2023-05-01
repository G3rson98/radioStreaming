
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit() : super(0);

  void onChangeTab(int index) => emit(index);
}
