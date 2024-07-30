import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/constant/app_icons.dart';

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

extension BottomNavX on BottomNavState {
  String get icon {
    switch (this) {
      case BottomNavState.home:
        return AppIcons.navHome;
      case BottomNavState.category:
        return AppIcons.navCategory;
      case BottomNavState.search:
        return AppIcons.navSearch;
      case BottomNavState.user:
        return AppIcons.navUser;
      default:
        return AppIcons.navHome;
    }
  }

  String get activeIcon {
    switch (this) {
      case BottomNavState.home:
        return AppIcons.navHomeOn;

      case BottomNavState.category:

        return AppIcons.navCategoryOn;
      case BottomNavState.search:
        return AppIcons.navSearchOn;

      case BottomNavState.user:
        return AppIcons.navUserOn;
    }
  }

  String get toName {
    switch (this) {
      case BottomNavState.home:
        return "홈";

      case BottomNavState.category:
        return "카테고리";

      case BottomNavState.search:
        return "검색";

      case BottomNavState.user:
        return "마이페이지";
    }
  }
}
