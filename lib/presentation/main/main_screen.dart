import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/constant/app_colors.dart';
import '../../core/theme/constant/app_icons.dart';
import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';
import 'component/top_app_bar/top_app_bar.dart';
import 'cubit/bottom_nav_cubit.dart';
import 'cubit/mall_type_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => BottomNavCubit()),
      BlocProvider(create: (_) => MallTypeCubit()),
    ], child: const MainScreenView());
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (_, state) {
          switch (state) {
            case BottomNavState.home:
              return const HomePage();
            case BottomNavState.category:
              return const CategoryPage();
            case BottomNavState.search:
              return const Center(
                child: Text("Search"),
              );
            case BottomNavState.user:
              return const Center(
                child: Text("user"),
              );
            default:
              return const Center(
                child: Text("Home"),
              );
          }
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavCubit, BottomNavState>(builder: (_, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) => context.read<BottomNavCubit>().changeIndex(index),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: List.generate(
            BottomNavState.values.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomNavState.values[index].icon),
              label: BottomNavState.values[index].toName,
              activeIcon:
                  SvgPicture.asset(BottomNavState.values[index].activeIcon),
            ),
          ),
        );
      }),
    );
  }
}
