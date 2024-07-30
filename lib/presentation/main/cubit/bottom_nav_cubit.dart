import 'package:flutter_bloc/flutter_bloc.dart';

// 바텀 네비게이션 이동
enum BottomNavState {
  home,
  category,
  search,
  user;
}

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState.home);

  void changeIndex(int index) => emit(BottomNavState.values[index]);
}
