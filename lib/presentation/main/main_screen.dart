import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theme/constant/app_colors.dart';
import '../../core/theme/constant/app_icons.dart';
import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';
import 'cubit/bottom_nav_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: const MainScreenView(),
    );
  }
}

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leadingWidth: 86,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppIcons.mainLogo),
            ),
            title: Text(
              "Main Screen",
              style: TextStyle(
                color: AppColors.onPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.background,
                      BlendMode.srcIn),
                  AppIcons.location,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.background,
                      BlendMode.srcIn),
                  AppIcons.cart,
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (_, state) {
          switch (state) {
            case BottomNavState.home:
              return HomePage();
            case BottomNavState.category:
              return CategoryPage();
            case BottomNavState.search:
              return Center(
                child: Text("Search"),
              );
            case BottomNavState.user:
              return Center(
                child: Text("user"),
              );
            default:
              return Center(
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
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.navHome),
              label: "navHome",
              activeIcon: SvgPicture.asset(AppIcons.navHomeOn),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.navCategory),
              label: "navCategory",
              activeIcon: SvgPicture.asset(AppIcons.navCategoryOn),

            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.navSearch),
              label: "navSearch",
              activeIcon: SvgPicture.asset(AppIcons.navSearchOn),

            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.navUser),
              label: "navUser",
              activeIcon: SvgPicture.asset(AppIcons.navUserOn),

            ),
          ],
        );
      }),
    );
  }
}
