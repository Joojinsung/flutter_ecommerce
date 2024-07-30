import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/bottom_nav_cubit.dart';
import 'default_app_bar.dart';
import 'home_app_bar.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(builder: (_, state) {
      switch (state) {
        case BottomNavState.home:
          return const HomeAppBar();
        case BottomNavState.category:
        case BottomNavState.search:
        case BottomNavState.user:
          return DefaultAppBar(state);
      }
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(44);
}
